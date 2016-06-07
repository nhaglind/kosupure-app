// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .
$.fn.extend({
  rippleBtn: function() {

    function aniEnd(obj, fn) {
      $(obj).on("animationend", fn);
    }

    return this.each(function() {

      var me = $(this);

      me.on("mousedown", function(e) {

        var x = e.pageX,
          y = e.pageY;

        x = x - me.offset().left;
        y = y - me.offset().top;

        var ripple = $("<span class='ripple'></span>");
        ripple.css({
          left: x - 2,
          top: y - 2
        });
        me.append(ripple);
        aniEnd(ripple, function() {
          ripple.remove();
        });

      });

    });

  }
})

$(".btn").rippleBtn();
