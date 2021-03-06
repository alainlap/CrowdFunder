// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.numeric
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function() {

  $(".dollar_amount").numeric();

  // automatically kill alerts after 5 seconds
  setTimeout( function() {
      $('.alert-box').fadeOut('2000'); 
    }, 3000);

  $('.dollar_amount').keyup(function(){
    var amount = $('.dollar_amount').val();
    var project = window.location.pathname.replace('/projects/', "");
    if (amount != 0) {
      $.ajax({
        url: "/updatetiers",
        dataType: "script",
        data: {amount: amount,
              project: project},
        success: ""
      });
    } else {
      $('.tierselect').html('');
    }
  });


  $('body').on('click', '.tier_return', function (){
      //reset tiers
      $('.tier_return').removeAttr('style').removeClass('selected');
      $('.tiernumber').css('color','#8dc4f0');
      //select clicked tier
      $(this).removeAttr('style').removeClass('selected');
      $(this).css('background-color','#04a600').addClass('selected');
      $(this).find('.tiernumber').css('color','#06ff00');
  });


});

