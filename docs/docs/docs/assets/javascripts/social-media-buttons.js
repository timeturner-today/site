window.addEventListener('load', function() {

  function bindSocialClick(selector, url) {
    var element = document.querySelector(selector);
    if (!element) {return;}

    element.addEventListener('click', function() {
      var left = (screen.width - 570) / 2;
      var top = (screen.height - 570) / 2;
      var params = "menubar=no,toolbar=no,status=no,width=570,height=570,top=" + top + ",left=" + left;
      window.open(url,"NewWindow",params);
    });
  }

  var pageUrl = encodeURIComponent(document.URL);

  bindSocialClick('.social-media-buttons .instagram', 'https://www.instagram.com/sharer/sharer.php?u=' + pageUrl);
  bindSocialClick('.social-media-buttons .facebook', 'https://www.facebook.com/sharer/sharer.php?u=' + pageUrl);
  bindSocialClick('.social-media-buttons .twitter',  'https://twitter.com/intent/tweet?url=' + pageUrl + '&text=' + encodeURIComponent('TimeTurner.Today'));
  bindSocialClick('.social-media-buttons .linkedin', 'https://www.linkedin.com/shareArticle?mini=true&url=' + pageUrl);
  bindSocialClick('.follow-us-on-twitter',           'https://twitter.com/intent/follow?screen_name=todaytimeturner');
  bindSocialClick('.follow-us-on-twitter.english',   'https://twitter.com/intent/follow?screen_name=todaytimeturner');

});
