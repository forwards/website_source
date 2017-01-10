// based on http://codepen.io/zchee/pen/ogzvZZ
(function() {
  'use strict';

  var section = document.querySelectorAll("div.article-entry h2, div.article-entry h3");
  var sections = {};
  var i = 0;

  Array.prototype.forEach.call(section, function(e) {
    sections[e.id] = e.offsetTop - 82;
  });
  
  var element = document.querySelector("div.article-entry h2");
  document.querySelector('a[href*=' + element.id + ']').setAttribute('class', 'active');

  window.onscroll = function() {
    var scrollPosition = document.documentElement.scrollTop || document.body.scrollTop;

    for (var i in sections) {
      if (sections[i] <= scrollPosition) {
        document.querySelector('.active').setAttribute('class', ' ');
        document.querySelector('a[href*=' + i + ']').setAttribute('class', 'active');
      }
    }
  };
})();
