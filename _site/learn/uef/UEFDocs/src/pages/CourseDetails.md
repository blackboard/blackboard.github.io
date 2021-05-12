# Extending Course Outline's "Details & Actions"

The Ultra Extension Framework allows an integration to add content
into the "Details & Action" section of the course outline panel.  The
integration is allowed to render any supported content; however, it
is recommended to use the provided style classes to match your content
with the existing actions design.

## Registration
In order to render a Course Detail portal, you need to register with the
Ultra Extension Framework.  This can be accomplished by sending the
`'course:detail:register'` message to the framework.  See
[[ICourseDetailsRegistrationRequest]] for additional information.

Once the request has been made, the Ultra Extension Framework will
respond with [[ICourseDetailsRegistrationResponse]].  If successful,
the provided ID will be used for subsequent portal messages.

### Registration ID
Unlike other registrations in Ultra Extension Framework, the course
details area allows you to register multiple times.  Therefore, it is
important to ensure that you respond only to portal events that have
the appropriate `selectorData`.  The data is required to match your
registration id.

## Course Detail Class Names
With the course detail's portal there are additional special class names
that will only work when applied to elements rendering in this portal.

### `<div>` elements
| className | Description |
| uef--course-details--element | Groups the name and link text to render vertically. |
| uef--course-details--image | Provides a container for an action's 'img' container. |
| uef--course-details--name | Styles the name label of the action. |
| uef--course-details--content | A container to help format the link area. |
| uef--course-details--link | Used to make the bottom detail text look like a link. |
| uef--course-details--container | A container which can wrap the button.  Providing a boundary so other content can be added. |

### 'button' elements
| className | Description |
| uef--button--course-details | Styles the button to look like the other action buttons. |


## Standard Structure
In addition to the class name properties the integration provides,
you will need to match the structure.  The following example shows how
to match the existing item's look and feel.

```javascript
{
  tag: 'button',
  props: {
    className: 'uef--button--course-details',
    onClick: {
        callbackId: 'integration-name-callback-1'
    }
  },
  children: [
    {
      tag: 'div',
      props: {
        className: 'uef--course-details--image'
      },
      children: [
        {
          tag: 'img',
          props: {
            alt: "Integration Action's Image",
            src: 'https://www.blackboard.com/themes/custom/blackboard/images/Blackboard-Logo.png',
            height: 24,
            width: 24
          },
        },
        {
          tag: 'div',
          props: {
            className: 'uef--course-details--element'
          },
          children: [
            {
              tag: 'div',
              props: {
                className: 'uef--course-details--name'
              },
              children: "Interaction Action's Label"
            },
            {
              tag: 'div',
              props: {
                className: 'uef--course-details--content'
              },
              children: [
                {
                  tag: 'div',
                  props: {
                    className: 'uef--course-details--link'
                  },
                  children: "Interaction Action's detail"
                }
              ]
            }
          ]
        }
      ]
    },
  ]
}
```
