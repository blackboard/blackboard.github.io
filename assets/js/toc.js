import { find, findOne, on, fire, ready } from 'domassist';
import scrollTriggers from 'scroll-triggers';
import { init as init$1, scroll } from 'smooth-scroller';

function init(el) {
  if (!el) {
    el = find('[data-toc]');
    el.forEach(function (e) {
      return init(e);
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

  scrollTriggers(triggerOptions);
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
ready(init);

export default init;
//# sourceMappingURL=toc.js.map
