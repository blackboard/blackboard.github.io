# Messaging Recommendations

## Table of Contents

- [Overview](#overview)
- [Iframe to Iframe communication](#iframe-to-iframe-communication)
    - [LocalStorage](#localstorage)
    - [HTTP](#http)
    - [Recommendation](#recommendation)
- [Static Content to Iframe communication](#static-content-to-iframe-communication)

## Overview
In some cases, an Integration may want to render content into Ultra 
and have that content send messages back to the originating integration. 
There are two primary use cases for this

1. iframe to iframe
2. static content to Iframe.

In the case of iframe to iframe the goal is to send content from a portal
that is an iframe back to the originating iframe (integration loaded in ultra).
In the case of static content the goal is to send events from statically rendered content back
to the originating iframe.

## Iframe to Iframe communication
In the case of Iframe to Iframe communication we have a bit more control of sending messages between contexts.
Currently there are two known ways to do this. This can be accomplished by using either LocalStorage or HTTP.

### LocalStorage
The first is to use [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage)
as a message bus between the two iframes.

`LIMITATION WARNING: In order for this to work both iframes have to have the same origin. If this is not the case then this will not work.`

The implementation for this is rather easy and can be broken down into the following

```javascript
// localStorageMessager.js (used in all following scripts.)
const subscribers = new Map();

const updateSubscribers = (subs, data) => {
    subs.forEach(sub => {
        sub(data);
    });
}

window.addEventListener('storage', (event) => {
    const subs = subscribers.get(event.key); // Get subscribers.

    if (!subs) {
        return;
    }

    updateSubscribers(subs, JSON.parse(event.newValue)); // Notify subscribers.
});

const subscribe = (topic, callback) => {
    const current = subscribers.get(topic);

    if (current) {
        current.push(callback);
    } else {
        subscribers.set(topic, [callback]);
    }
};

const publish = (topic, value) => {
    localStorage.setItem(topic, JSON.stringify(value));
};
```

```javascript
// iframe rendered content
subscribe('topic.response', event => {
    console.log('Got message from owning integration ', event);
});
publish('topic.send', {data: 'hello'});
```

```javascript
// owning integration
subscribe('topic.send', event => {
    console.log('Got message from rendered content ', event);
    publish('topic.response', {data: 'Greetings'});
});
```

### HTTP
Another more complicated approach would be to use fetch
or XMLHttpRequest to send a message from the iframe to a web service.
This web service would in turn forward the message on to the originating iframe.
While this approach is a bit more difficult,
if done correctly this can allow cross origin communication.

```javascript
// httpManager.js (used in all scripts but server script.)
const subscribers = new Map();

const updateSubscribers = (subs, data) => {
    subs.forEach(sub => {
        sub(data);
    });
}

const evtSource = new EventSource(`/api/messaging`); // Create an EventSource to get data back gradually over time.
evtSource.addEventListener('message', (event) => {
    const res = JSON.parse(event.data);

    res.forEach(message => {
        const subs = subscribers.get(message.topic);

        if (subs) {
            updateSubscribers(subs, message.value);
        }
    });
});

evtSource.addEventListener('open', () => {
    console.log('Message channel is open');
});

const subscribe = (topic, callback) => {
    const current = subscribers.get(topic);

    if (current) {
        current.push(callback);
    } else {
        subscribers.set(topic, [callback]);
    }
};

const publish = (topic, value) => {
    const message = new Request('http://mysite.com/api/messaging/data', {
        method: 'POST',
        body: JSON.stringify({ topic, value}),
        headers: new Headers([
            ['Content-Type', 'application/json;charset=UTF-8']
        ])
    });

    fetch(message); // Send the message to the web server.
};
```

```javascript
// web server handler (in express)
const messages = new Map();
const listeners = [];

const registerMessagingHandlers = (app) => { // Call this with your express app
    function formatMessage(message) {
        return `data: ${JSON.stringify(message)}\n\n`; // Correct the format for event stream.
    }

    function updateListeners() {
        const retVal = [];

        messages.forEach((v, k) => {
            retVal.push({
                topic: k,
                value: v,
            });
        });

        listeners.forEach((v) => {
            v.write(formatMessage(retVal));
        });
    }

    app.post('/api/messaging/data', (req, res) => {
        const current = messages.get(req.body.topic);
        if (current === req.body.value) {
            return;
        }

        messages.set(req.body.topic, req.body.value);

        setTimeout(() => {
            updateListeners(); // Send new data to clients
        });

        res.status(201).send();
    });

    app.get('/api/messaging', (req, res) => { // Handle incoming event source request.
        listeners.push(res);
        const retVal = [];

        messages.forEach((v, k) => {
            retVal.push({
                topic: k,
                value: v,
            });
        });

        res.writeHead(200, {
            'Cache-Control': 'no-cache',
            'Connection': 'keep-alive',
            'Content-Type': 'text/event-stream',
        });

        res.write(formatMessage(retVal)); // Send current state.
    });
};

```

```javascript
// iframe rendered content
subscribe('topic.response', event => {
    console.log('Got message from owning integration ', event);
});
publish('topic.send', {data: 'hello'});
```

```javascript
// owning integration
subscribe('topic.send', event => {
    console.log('Got message from rendered content ', event);
    publish('topic.response', {data: 'Greetings'});
});
```

### Recommendation
For most cases the LocalStorage approach would be our recommendation.
The LocalStorage approach is the easiest to implement and has been proven more times.

## Static content to iframe communication
In some cases an integration might want to render interactive content without the use of iframes.
In this case the integration can use callbacks.
Callbacks will notify the integrations iframe when a change has occured.
In the below example we use callbacks to create a simple counter.

```javascript
const btnStyle = {
    'margin': '4px'
};

let count = 0;
let renderId;

function renderContent() {
    let contents = {
      tag: 'span',
      children: [
        {
          tag: 'button',
          props: {
            onClick: {
              callbackId: '1', // Id to be sent when button is pressed.
              mode: 'sync'
            },
            style: btnStyle
          },
          children: 'Decrement'
        },
        {
          tag: 'span',
          props: {},
          children: `Current Value ${count}`
        },
        {
          tag: 'button',
          props: {
            onClick: {
              callbackId: '2', // Id to be sent when button is pressed.
              mode: 'sync'
            },
            style: btnStyle
          },
          children: 'Increment'
        }
      ]
    };

    sendMessage({
      type: "portal:render",
      portalId: renderId,
      contents: contents
    });
}

const onUltraMessageReceived = (msg) => {
  if (msg.data.type === 'authorization:authorize') {
    ultraMessageChannel.postMessage({
      "type": "event:subscribe",
      "subscriptions": ['click', 'hover', 'route', 'portal:new', 'portal:removed']
    });

    ultraMessageChannel.postMessage({
      "type": "portal:panel",
      "correlationId": "some:id",
      "panelType": "small",
      "panelTitle": "Static Messaging"
    }); // Create panel when authorization is done.
  }

  if (msg.data.type === "event:event") {
      switch (msg.data.eventType) {
        case "portal:new":
          renderId = msg.data.portalId;
          renderContent(); // Portal has been created render initial content.
          break;
      }
  }

  if (msg.data.type === "portal:callback") { // Got a callback update our state
      if (msg.data.callbackId === "1" && count > 0) {
          count--; // Decrement button was pressed.
      } else if (msg.data.callbackId === "2") {
          count++; // Increment button was pressed.
      }

      renderContent();
  }
};

init(onUltraMessageReceived);

```