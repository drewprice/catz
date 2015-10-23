$(document).ready(function(){
  if ($('.alert')) {
    window.setTimeout(function(){
      $('.alert').slideUp(function(){
        $(this).remove();
      });
    }, 4000);
  }
});
