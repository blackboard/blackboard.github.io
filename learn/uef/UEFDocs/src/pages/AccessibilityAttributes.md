# [Accessibility Attributes](https://developer.mozilla.org/en-US/docs/Web/Accessibility)

## Table of Contents

- [aria-activedescendant](#aria-activedescendant)
- [aria-atomic](#aria-atomic)
- [aria-autocomplete](#aria-autocomplete)
- [aria-busy](#aria-busy)
- [aria-checked](#aria-checked)
- [aria-colcount](#aria-colcount)
- [aria-colindex](#aria-colindex)
- [aria-colspan](#aria-colspan)
- [aria-controls](#aria-controls)
- [aria-current](#aria-current)
- [aria-describedby](#aria-describedby)
- [aria-details](#aria-details)
- [aria-disabled](#aria-disabled)
- [aria-dropeffect](#aria-dropeffect)
- [aria-errormessage](#aria-errormessage)
- [aria-expanded](#aria-expanded)
- [aria-flowto](#aria-flowto)
- [aria-grabbed](#aria-grabbed)
- [aria-haspopup](#aria-haspopup)
- [aria-hidden](#aria-hidden)
- [aria-invalid](#aria-invalid)
- [aria-keyshortcuts](#aria-keyshortcuts)
- [aria-label](#aria-label)
- [aria-labelledby](#labelledby-colcount)
- [aria-level](#aria-level)
- [aria-live](#aria-live)
- [aria-modal](#aria-modal)
- [aria-multiline](#aria-multiline)
- [aria-multiselectable](#aria-multiselectable)
- [aria-orientation](#aria-orientation)
- [aria-owns](#aria-owns)
- [aria-placeholder](#aria-placeholder)
- [aria-posinset](#aria-posinset)
- [aria-pressed](#aria-pressed)
- [aria-readonly](#aria-readonly)
- [aria-relevant](#aria-relevant)
- [aria-required](#aria-required)
- [aria-roledescription](#aria-roledescription)
- [aria-rowcount](#aria-rowcount)
- [aria-rowindex](#aria-rowindex)
- [aria-rowspan](#aria-rowspan)
- [aria-selected](#aria-selected)
- [aria-setsize](#aria-setsize)
- [aria-sort](#aria-sort)
- [aria-valuemax](#aria-valuemax)
- [aria-valuemin](#aria-valuemin)
- [aria-valuenow](#aria-valuenow)
- [aria-valuetext](#aria-valuetext)

### aria-activedescendant

Identifies the currently active element when DOM focus is on a composite widget, textbox, group, or application.

### aria-atomic

Indicates whether assistive technologies will present all, or only parts of, the changed region based on the change notifications defined by the [aria-relevant](#aria-relevant) attribute.

### aria-autocomplete

Indicates whether inputting text could trigger display of one or more predictions of the user[s intended value for an input and specifies how predictions would be
presented if they are made.

### aria-busy

Indicates an element is being modified and that assistive technologies MAY want to wait until the modifications are complete before exposing them to the user.

### aria-checked

Indicates the current "checked" state of checkboxes, radio buttons, and other widgets.

See [aria-pressed](#aria-pressed) and [aria-selected](#aria-selected).

### aria-colcount

Defines the total number of columns in a table, grid, or treegrid.

See [aria-colindex](#aria-colindex).

### aria-colindex

Defines an element's column index or position with respect to the total number of columns within a table, grid, or treegrid.

See [aria-colcount](#aria-colcount) and [aria-colspan](#aria-colspan).

### aria-colspan

Defines the number of columns spanned by a cell or gridcell within a table, grid, or treegrid.

See [aria-colindex](#aria-colindex) and [aria-rowspan](#aria-rowspan).

### aria-controls

Identifies the element (or elements) whose contents or presence are controlled by the current element.

See [aria-owns](#aria-owns).

### aria-current

Indicates the element that represents the current item within a container or set of related elements.

### aria-describedby

Identifies the element (or elements) that describes the object.

See [aria-labelledby](#aria-labelledby)

### aria-details

Identifies the element that provides a detailed, extended description for the object.

See [aria-describedby](#aria-describedby).

### aria-disabled

Indicates that the element is perceivable but disabled, so it is not editable or otherwise operable.

See [aria-hidden](#aria-hidden) and [aria-readonly](#aria-readonly).

### aria-dropeffect

Indicates what functions can be performed when a dragged object is released on the drop target.

**Deprecated** in ARIA 1.1

### aria-errormessage

Identifies the element that provides an error message for the object.

See [aria-invalid](#aria-invalid) and [aria-describedby](#aria-describedby).

### aria-expanded

Indicates whether the element, or another grouping element it controls, is currently expanded or collapsed.

### aria-flowto

Identifies the next element (or elements) in an alternate reading order of content which, at the user's discretion, allows assistive technology to override the general default of reading in document source order.

### aria-grabbed

Indicates an element's "grabbed" state in a drag-and-drop operation.

**Deprecated** in ARIA 1.1

### aria-haspopup

Indicates the availability and type of interactive popup element, such as menu or dialog, that can be triggered by an element.

### aria-hidden

Indicates whether the element is exposed to an accessibility API.

See [aria-disabled](#aria-disabled).

### aria-invalid

Indicates the entered value does not conform to the format expected by the application.

See [aria-errormessage](#aria-errormessage).

### aria-keyshortcuts

Indicates keyboard shortcuts that an author has implemented to activate or give focus to an element.

### aria-label

Defines a string value that labels the current element.

See [aria-labelledby](#aria-labelledby).

### aria-labelledby

Identifies the element (or elements) that labels the current element.

See [aria-describedby](#aria-describedby).

### aria-level

Defines the hierarchical level of an element within a structure.

### aria-live

Indicates that an element will be updated, and describes the types of updates the user agents, assistive technologies, and user can expect from the live region.

### aria-modal

Indicates whether an element is modal when displayed.

### aria-multiline

Indicates whether a text box accepts multiple lines of input or only a single line.

### aria-multiselectable

Indicates that the user may select more than one item from the current selectable descendants.

### aria-orientation

Indicates whether the element[s orientation is horizontal, vertical, or unknown/ambiguous.

### aria-owns

Identifies an element (or elements) in order to define a visual, functional, or contextual parent/child relationship between DOM elements where the DOM hierarchy cannot be used to represent the relationship.

See [aria-controls](#aria-controls).

### aria-placeholder

Defines a short hint (a word or short phrase) intended to aid the user with data entry when the control has no value. A hint could be a sample value or a brief description of the expected format.

### aria-posinset

Defines an element's number or position in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM.

See [aria-setsize](#aria-setsize).

### aria-pressed

Indicates the current "pressed" state of toggle buttons.

See [aria-checked](#aria-checked) and [aria-selected](#aria-selected).

### aria-readonly

Indicates that the element is not editable, but is otherwise operable.

See [aria-disabled](#aria-disabled).

### aria-relevant

Indicates what notifications the user agent will trigger when the accessibility tree within a live region is modified.

See [aria-atomic](#aria-atomic).

### aria-required

Indicates that user input is required on the element before a form may be submitted.

### aria-roledescription

Defines a human-readable, author-localized description for the role of an element.

### aria-rowcount

Defines the total number of rows in a table, grid, or treegrid.

See [aria-rowindex](#aria-rowindex).

### aria-rowindex

Defines an element[s row index or position with respect to the total number of rows within a table, grid, or treegrid.

See [aria-rowcount](#aria-rowcount) and [aria-rowspan](#aria-rowspan).

### aria-rowspan

Defines the number of rows spanned by a cell or gridcell within a table, grid, or treegrid.

See [aria-rowindex](#aria-rowindex) and [aria-colspan](#aria-colspan).

### aria-selected

Indicates the current "selected" state of various widgets.

See [aria-checked](#aria-checked) and [aria-pressed](#aria-pressed).

### aria-setsize

Defines the number of items in the current set of listitems or treeitems. Not required if all elements in the set are present in the DOM.

See [aria-posinset](#aria-posinset).

### aria-sort

Indicates if items in a table or grid are sorted in ascending or descending order.

### aria-valuemax

Defines the maximum allowed value for a range widget.

### aria-valuemin

Defines the minimum allowed value for a range widget.

### aria-valuenow

Defines the current value for a range widget.

See [aria-valuetext](#aria-valuetext).

### aria-valuetext

Defines the human readable text alternative of aria-valuenow for a range widget.
