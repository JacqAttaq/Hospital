$(document).ready(function(){

  $(".validate-test").blur(function(){
    if($(".validate-test").val() != ""){
      $(".submit-info").removeClass('disabled');
    }
  }); 
});