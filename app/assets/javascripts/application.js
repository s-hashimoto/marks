// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks

//文字入力のリアルタイムカウント。
$(function(){
    $('#post_title').bind('keydown keyup keypress change',function(){
        var thisValueLength = $(this).val().length;
        $('.count1').html(thisValueLength);
    });
    $('#post_description').bind('keydown keyup keypress change',function(){
        var thisValueLength = $(this).val().length;
        $('.count2').html(thisValueLength);
    });
});
$(function(){
    // 「id="jQueryPush"」がクリックされた場合
    $(".hide_notice").click(function(){
        // 「id="jQueryBox"」の表示、非表示を切り替える
        $(".notice").toggle();
    });
});
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '100480733623729',
      xfbml      : true,
      version    : 'v2.3'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
