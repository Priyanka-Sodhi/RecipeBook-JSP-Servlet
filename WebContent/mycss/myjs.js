/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Panda Eye move
$(document).on( "mousemove", function( event ) {
  var dw = $(document).width() / 15;
  var dh = $(document).height() / 15;
  var x = event.pageX/ dw;
  var y = event.pageY/ dh;
  $('.eye-ball1').css({
    width : x,
    height : y
  });
  $('.eye-ball2').css({
    width : x,
    height : y
  });
});


