# Right-to-Left (RTL)

## Table of Contents

- [How to Determine if UEF LTI Launch is in RTL](#how-to-determine-if-uef-lti-launch-is-in-rtl)
- [Mixed Mode Behavior in UEF](#mixed-mode-behavior-in-uef)
- [Rendering Content in RTL](#rendering-content-in-rtl)
  - [RTL Specific Attributes](#rtl-specific-attributes)
  - [RTL Specific Classes/Styles](#rtl-specific-classes-(styles))
  - [RTL Specific Tags](#rtl-specific-tags)

## How to Determine if UEF LTI Launch is in RTL

There are a few components that will check to see if it should be rendered in RTL or LTR, but it is possible to check if the LTI launch is in RTL by checking the LTI launch's locale. If a custom locale is being used, it should be prefixed with a valid locale (i.e. en_SA).

## Mixed Mode Behavior in UEF

In certain cases, a course locale may be a forced locale that differs from the user's configured locale. For example, a course locale may be in Arabic while the user's configured locale is English. For consistency with Learn Ultra, in these scenarios, your integration should defer to using the user's locale to determine if the content should be displayed in RTL. Using the previous mentioned example, this would mean that your integration would display the content using the English locale, but in a right-to-left text direction.

## Rendering Content in RTL

There are a few ways to render content in RTL, each section below details some usage of attributes, classes/styles, and tags that can be used within UEF.

### RTL Specific Attributes

* [dir](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/dir)
  ```js
  ...
  props: {
    ...
    dir: isRtl ? 'rtl' : 'ltr'
    ...
  }
  ...
  ```

### RTL Specific Classes (Styles)

* [direction](https://developer.mozilla.org/en-US/docs/Web/CSS/direction)
  ```js
  ...
  props: {
    ...
    style: {
      ...
      direction: isRtl ? 'rtl' : 'ltr'
      ...
    }
    ...
  }
  ...
  ```

### RTL Specific Tags

* Bidirectional Isolate Element - [bdi](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdi)
  ```js
  {
    tag: 'bdi',
    props: ...
    children: 'الرجل القوي إيان'
  } ```
* Bidirectional Text Override Element - [bdo](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/bdo)
  ```js
  {
    tag: 'bdo',
    props: ...
    children: 'الرجل القوي إيان'
  }
  ```
