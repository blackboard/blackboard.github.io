var FirstandthirdToc = (function () {
  'use strict';

  function isWindow(obj) {
    return obj != null && obj === obj.window;
  }

  function find(selector, context) {
    if (context === void 0) {
      context = null;
    }

    if (selector instanceof HTMLElement || selector instanceof Node || isWindow(selector)) {
      return [selector];
    } else if (selector instanceof NodeList) {
      return [].slice.call(selector);
    } else if (typeof selector === 'string') {
      var startElement = context ? find(context)[0] : document;
      return [].slice.call(startElement.querySelectorAll(selector));
    }

    return [];
  }

  function addClass(selector, cls) {
    if (Array.isArray(selector)) {
      return selector.forEach(function (item) {
        return addClass(item, cls);
      });
    }

    var els = find(selector);

    if (els.length) {
      var clsArray = [].concat(cls);
      els.forEach(function (el) {
        clsArray.forEach(function (item) {
          el.classList.add(item);
        });
      });
      return els;
    }
  }

  function on(selector, event, cb, capture) {
    if (capture === void 0) {
      capture = false;
    }

    if (Array.isArray(selector)) {
      selector.forEach(function (item) {
        return on(item, event, cb, capture);
      });
      return;
    }

    var data = {
      cb: cb,
      capture: capture
    };

    if (!window._domassistevents) {
      window._domassistevents = {};
    }

    window._domassistevents["_" + event] = data;
    var el = find(selector);

    if (el.length) {
      el.forEach(function (item) {
        item.addEventListener(event, cb, capture);
      });
    }
  }

  function findOne(selector, el) {
    var found = find(selector, el);

    if (found.length) {
      return found[0];
    }

    return null;
  } // Check for the usage of native support for CustomEvents which is lacking
  // completely on IE.
  //


  function canIuseNativeCustom() {
    try {
      var p = new CustomEvent('t', {
        detail: {
          a: 'b'
        }
      });
      return p.type === 't' && p.detail.a === 'b';
    } catch (e) {
      return false;
    }
  } // Lousy polyfill for the Custom Event constructor for IE.


  var IECustomEvent = function CustomEvent(type, params) {
    var e = document.createEvent('CustomEvent');

    if (params) {
      e.initCustomEvent(type, params.bubbles, params.cancelable, params.detail);
    } else {
      e.initCustomEvent(type, false, false, undefined);
    }

    return e;
  };

  var DomassistCustomEvent = false;

  function fire(selector, type, params) {
    if (params === void 0) {
      params = {};
    }

    if (Array.isArray(selector)) {
      return selector.forEach(function (item) {
        return fire(item, type, params);
      });
    }

    if (!DomassistCustomEvent) {
      DomassistCustomEvent = canIuseNativeCustom() ? CustomEvent : IECustomEvent;
    }

    var els = find(selector);

    if (els.length) {
      if (params.bubbles !== false) {
        params.bubbles = true;
      }

      els.forEach(function (el) {
        var event = new DomassistCustomEvent(type, params);
        el.dispatchEvent(event);
      });
      return els;
    }
  }

  function removeClass(selector, cls) {
    if (Array.isArray(selector)) {
      return selector.forEach(function (item) {
        return removeClass(item, cls);
      });
    }

    var els = find(selector);

    if (els.length) {
      var clsArray = [].concat(cls);
      els.forEach(function (el) {
        clsArray.forEach(function (item) {
          el.classList.remove(item);
        });
      });
      return els;
    }
  }

  var setupReady = function setupReady(callbacks) {
    return function (callback) {
      callbacks.push(callback);

      function execute() {
        while (callbacks.length) {
          var fn = callbacks.shift();

          if (typeof fn === 'function') {
            fn();
          }
        }
      }

      function loaded() {
        document.removeEventListener('DOMContentLoaded', loaded);
        execute();
      }

      setTimeout(function () {
        if (document.readyState !== 'loading') {
          return execute();
        }
      }, 0);
      document.addEventListener('DOMContentLoaded', loaded);
    };
  };

  var ready = setupReady([]);

  function styles(selector, css) {
    if (Array.isArray(selector)) {
      selector.forEach(function (item) {
        return styles(item, css);
      });
    }

    var els = find(selector);

    if (els.length) {
      els.forEach(function (el) {
        Object.keys(css).forEach(function (key) {
          el.style[key] = css[key];
        });
      });
    }
  }

  /* global window */
  function attrobj(key, el) {
    var values = {};
    Object.keys(el.dataset).forEach(function (data) {
      if (data.match(new RegExp("^" + key)) && data !== key) {
        var optionName = data.replace(key, '');
        var isGlobal = false;

        if (optionName.match(/^Global/)) {
          optionName = optionName.replace('Global', '');
          isGlobal = true;
        }

        optionName = "" + optionName[0].toLowerCase() + optionName.slice(1);

        if (isGlobal) {
          values[optionName] = window[el.dataset[data]];
        } else {
          values[optionName] = el.dataset[data];
        }

        if (typeof values[optionName] === 'undefined' || values[optionName] === '') {
          values[optionName] = true;
        }
      }
    });
    return values;
  }

  var debounce = function debounce(func, wait, immediate) {
    var timeout;
    return function () {
      var context = this;
      var args = arguments; // eslint-disable-line prefer-rest-params

      var later = function later() {
        timeout = null;

        if (!immediate) {
          func.apply(context, args);
        }
      };

      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);

      if (callNow) {
        func.apply(context, args);
      }
    };
  };

  var Events = {
    In: 'scrolltriggers:inView',
    Out: 'scrolltriggers:outOfView',
    Pause: 'scrolltriggers:pause',
    Resume: 'scrolltriggers:resume',
    Bounds: 'scrolltriggers:bounds'
  };

  var ScrollTrigger =
  /*#__PURE__*/
  function () {
    function ScrollTrigger(el, options) {
      var _this = this;

      if (el.hasAttribute('data-scroll-init')) {
        return;
      }

      this.added = false;
      this.el = el;
      this.options = options;
      this.eventHandler = debounce(this.onScroll.bind(this), 10, true);
      this.dCalcBounds = debounce(this.calcBounds.bind(this), 10);
      this.paused = false;
      this.disabled = false;
      this.calcOffset(); // If images, once by default

      if (this.options.image || this.options.src || this.options.srcset) {
        this.options.once = true;
      }

      el.setAttribute('data-scroll-init', 'true');
      this.calcBounds();
      window.addEventListener('scroll', this.eventHandler);
      window.addEventListener('resize', this.dCalcBounds);
      on(this.el, Events.Pause, function () {
        _this.paused = true;
      });
      on(this.el, Events.Resume, function () {
        _this.paused = false;
      });
      /*
        Prevents a bug on Blink+Webkit in which scroll is always 0 until around
        400 milliseconds due to anchor scrolling features.
       */

      setTimeout(this.eventHandler, 400);
    }

    var _proto = ScrollTrigger.prototype;

    _proto.calcBounds = function calcBounds() {
      this.calcOffset(); // Element is hidden and not fixed

      var isAllowedToBeFixed = this.options.progress === true || typeof this.options.fixed !== 'undefined';

      if (!this.el.offsetParent && !isAllowedToBeFixed || this.added && this.options.once) {
        // Don't even bother calculating
        this.disabled = true;
        return;
      }

      this.disabled = false;
      var position = this.options.position || 'bottom';
      this.startEl = this.options.start ? findOne(this.options.start) : this.el;
      ScrollTrigger.checkElement(this.startEl, 'start', this.options.start);
      var rect = this.startEl.getBoundingClientRect();
      var scrollY = ScrollTrigger.getScrollY();
      var start = rect.top + scrollY + (this.options.offset || 0);
      this.start = ScrollTrigger.processPosition(position, start);

      if (this.options.end) {
        var endEl = findOne(this.options.end);
        var endRect = endEl.getBoundingClientRect();
        var end = endRect.top + scrollY;
        var endPosition = this.options.positionEnd || 'bottom';

        if (endPosition === 'auto') {
          endPosition = 'top';
        }

        this.end = ScrollTrigger.processPosition(endPosition, end);

        if (this.options.positionEnd === 'auto') {
          this.end -= this.el.offsetHeight;
        }

        ScrollTrigger.checkElement(endEl, 'end', this.options.end);
      }

      this.fire(Events.Bounds);
      this.eventHandler();
    };

    _proto.calcOffset = function calcOffset() {
      this.options.offset = this.options.offset ? this.options.offset : this.el.dataset.scrollOffset; // Half a screen above loading

      if (this.options.image || this.options.srcset || this.options.offset === 'auto') {
        this.options.offset = Math.max((document.documentElement.clientHeight, window.innerHeight || 0) / 2) * -1;
      } else {
        this.options.offset = parseInt(this.options.offset || 0, 10);
      }
    };

    _proto.inView = function inView() {
      var _this$options = this.options,
          className = _this$options.className,
          inView = _this$options.inView;

      if (className && this.el.classList) {
        addClass(this.el, className);
      }

      var image = this.options.image;
      var src = this.options.src;
      var srcset = this.options.srcset;

      if (image || src) {
        if (this.el.tagName === 'IMG') {
          this.el.setAttribute('src', image);
        } else if (this.el.tagName === 'IFRAME' || this.el.tagName === 'VIDEO') {
          this.el.setAttribute('src', src);
        } else {
          styles(this.el, {
            backgroundImage: "url(" + image + ")",
            backgroundRepeat: 'no-repeat'
          });
        }
      }

      if (srcset) {
        this.el.setAttribute('srcset', srcset);
      }

      if (typeof inView === 'function') {
        inView(this.el, this.options);
      }

      this.fire(Events.In);

      if (this.options.once) {
        this.disabled = true;
        window.removeEventListener('scroll', this.eventHandler);
        window.removeEventListener('resize', this.dCalcBounds);
      }

      this.added = true;
    };

    _proto.outOfView = function outOfView() {
      var _this$options2 = this.options,
          className = _this$options2.className,
          outOfView = _this$options2.outOfView;

      if (className && this.el.classList) {
        removeClass(this.el, className);
      }

      if (typeof outOfView === 'function') {
        outOfView(this.el, this.options);
      }

      this.fire(Events.Out);
      this.added = false;
    };

    _proto.fire = function fire$1(event) {
      fire(this.el, event, {
        detail: {
          instance: this,
          options: this.options
        }
      });
    };

    _proto.onScroll = function onScroll() {
      var scroll = ScrollTrigger.getScrollY();

      if (this.paused || this.disabled) {
        return;
      }

      if (this.options.progress) {
        var perc = scroll / (document.documentElement.scrollHeight - window.innerHeight);
        this.el.style.width = perc * 100 + "%";
      }

      if (scroll < this.start || this.end && scroll > this.end) {
        if (this.added) {
          this.outOfView();
        }

        return;
      }

      if (this.added) {
        return;
      }

      this.inView();
    };

    ScrollTrigger.checkElement = function checkElement(element, position, selector) {
      if (!element) {
        throw new Error(position + " element doesn't match any element with selector: \"" + selector + "\"");
      }
    };

    ScrollTrigger.getScrollY = function getScrollY() {
      return window.pageYOffset || document.documentElement.scrollTop;
    };

    ScrollTrigger.processPosition = function processPosition(position, currentValue) {
      if (position === 'top') {
        return currentValue;
      }

      if (position === 'middle') {
        currentValue -= window.innerHeight / 2;
      } else if (position === 'bottom') {
        currentValue -= window.innerHeight;
      } else {
        currentValue -= window.innerHeight * (parseInt(position, 10) / 100);
      }

      return currentValue;
    };

    return ScrollTrigger;
  }();

  var init = function init(items) {
    var instances = [];

    if (items && Array.isArray(items)) {
      items.forEach(function (item) {
        var els = find(item.el);

        if (els === null) {
          throw new Error('unknown element');
        }

        els.forEach(function (el) {
          delete item.el;
          instances.push(new ScrollTrigger(el, item));
        });
      });
    } else if (items) {
      throw new Error('please convert object to array');
    } else {
      var els = find('[data-scroll]');
      els.forEach(function (el) {
        var options = attrobj('scroll', el);

        if (options.progress !== null && typeof options.progress !== 'undefined') {
          options.progress = true;
        }

        options.className = options["class"];

        if (options.offset) {
          options.offset = parseInt(options.offset, 10);
        }

        if (typeof options.once !== 'undefined') {
          options.once = true;
        }

        instances.push(new ScrollTrigger(el, options));
      });
    }

    return instances;
  };

  if (document.readyState !== 'complete') {
    // Avoid image loading impacting on calculations
    document.addEventListener('readystatechange', function () {
      if (document.readyState === 'complete') {
        fire(window, 'resize');
      }
    });
  }

  ready(init);
  init.Events = Events;
  init.ScrollTrigger = ScrollTrigger;

  /* global window,document */

  var duration = 1000;

  var ease = function ease(t, b, c, d) {
    if ((t /= d / 2) < 1) return c / 2 * t * t * t * t + b; //eslint-disable-line

    return -c / 2 * ((t -= 2) * t * t * t - 2) + b;
  };

  var animate = function animate(startTime, start, end, callback) {
    if (callback === void 0) {
      callback = function callback() {};
    }

    var time = new Date().getTime();
    var difference = end - start;
    var goingUp = difference < 0;

    if (difference === 0) {
      return;
    }

    var to = Math.round(ease(time - startTime, start, difference, duration));

    if (!goingUp && to > end) {
      to = end;
    }

    if (goingUp && to < end) {
      to = end;
    }

    window.scrollTo(0, to);

    if (to === end) {
      setTimeout(callback);
      return;
    }

    if (to < 0) {
      return;
    }

    window.requestAnimationFrame(function () {
      return animate(startTime, start, end, callback);
    });
  };

  var scroll = function scroll(target, hash, offset, silent) {
    if (offset === void 0) {
      offset = 0;
    }

    if (silent === void 0) {
      silent = false;
    }

    fire(target, 'smoothscroll:start', {
      bubbles: true
    });
    var rect = target.getBoundingClientRect();
    var scrollY = window.pageYOffset || document.documentElement.scrollTop;
    var adjustedOffset = Math.round(rect.top + scrollY) + offset;
    var startTime = new Date();

    if (!target.hasAttribute('tabindex')) {
      target.tabIndex = '-1';
    }

    if (!silent) {
      window.history.pushState(null, 'Scroll', hash);
    }

    animate(startTime.getTime(), scrollY, adjustedOffset, function () {
      fire(target, 'smoothscroll:end', {
        bubbles: true
      });
    });
    target.focus();
  };

  var listenEvent = function listenEvent(el, offset) {
    if (el.dataset.smoothActive) {
      return;
    }

    el.dataset.smoothActive = true;
    el.addEventListener('click', function (e) {
      var hash = el.getAttribute('href');

      if (hash[0] !== '#') {
        return;
      }

      e.preventDefault();
      scroll(document.querySelector(hash), hash, offset);
    });
  };

  var init$1 = function init(query, offset) {
    if (query === void 0) {
      query = '[data-smooth]';
    }

    if (offset === void 0) {
      offset = 0;
    }

    if (!window.requestAnimationFrame) {
      return;
    }

    var els = query;

    if (typeof query === 'string') {
      els = document.querySelectorAll(query);
    }

    if (els instanceof Element) {
      els = [els];
    }

    for (var i = 0, c = els.length; i < c; i++) {
      var el = els[i];
      listenEvent(el, offset);
    }
  };

  window.addEventListener('DOMContentLoaded', function () {
    init$1();
  });

  function init$2(el) {
    if (!el) {
      el = find('[data-toc]');
      el.forEach(function (e) {
        return init$2(e);
      });
      return;
    }

    if (!el) {
      return;
    }

    var container = el.dataset.tocContainer ? findOne(el.dataset.tocContainer) || document.body : document.body;
    var selectors = el.dataset.toc.split(',').map(function (s) {
      return s.trim();
    });
    var tocItems = [];
    var offset = el.dataset.tocOffset ? parseInt(el.dataset.tocOffset, 10) : 1;
    var i = 1; // Building dict

    selectors.forEach(function (selector) {
      var items = find(selector, container);
      items.forEach(function (item) {
        // Keep the id if already there
        var index = item.id || "toc-" + i++;
        var text = item.dataset.tocTitle ? item.dataset.tocTitle.trim() : item.textContent.trim();
        var sanitizedClassName = selector.replace(/((:+[\w-\d]*)|[^A-z0-9-\s])/g, ' ').replace(/\s{2,}/g, ' ').trim();
        var className = "toc-" + sanitizedClassName; // Set it if none

        if (item.id !== index) {
          item.id = index;
        }

        tocItems.push({
          index: index,
          text: text,
          className: className
        });
      });
    });
    var html = '<ul>';
    var triggerOptions = []; // Building markup

    tocItems.forEach(function (item, j) {
      var nextEl = tocItems[j + 1];
      var options = {
        el: ".toc-li-" + j,
        fixed: 'true',
        start: "#" + item.index,
        position: 'top',
        positionEnd: 'top',
        className: 'toc-visible'
      };
      html += "\n<li class=\"toc-li-" + j + " " + item.className + "\"><a href=\"#" + item.index + "\">" + item.text + "</a></li>";

      if (nextEl) {
        options.end = "#" + nextEl.index;
      }

      triggerOptions.push(options);
    });
    html += '</ul>';
    el.innerHTML = html;
    var tocs = find('li', el);
    var anchors = find('a', el); // Setting up scroll triggers and smooth scroll

    init(triggerOptions);
    init$1(anchors, offset); // Pause scroll triggers while smoothscrolling

    on(document.body, 'smoothscroll:start', function () {
      fire(tocs, 'scrolltriggers:pause');
    });
    on(document.body, 'smoothscroll:end', function () {
      fire(tocs, 'scrolltriggers:resume');
      fire(window, 'scroll');
    });

    if (window.location.hash) {
      anchors.some(function (anchor) {
        var found = anchor.getAttribute('href') === window.location.hash;

        if (found) {
          setTimeout(function () {
            var element = findOne(window.location.hash);

            if (element) {
              // Silent scroll to element
              scroll(element, null, offset, true);
            }
          });
        }

        return found;
      });
    }
  }
  ready(init$2);

  return init$2;

}());
//# sourceMappingURL=toc.bundle.js.map
