$(document).ready(function(){
  window.setTimeout(function(){
    hideAlert();
  }, 4000);

  $(window).keydown(function(e){
    if (e.keyCode == 39) clickMoar();
    if (e.keyCode == 32) clickLike();
    if (e.keyCode == 76) clickLike();
  })
});


function clickMoar(){
  $('#moar').click()
}

function clickLike() {
  $('#likable').click()
}

function hideAlert() {
  $('.alert').slideUp(function(){
    $(this).remove();
  });
}
