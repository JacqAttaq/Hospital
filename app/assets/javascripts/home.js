$(document).on(function(){
  $(".validate-test").blur(function(){
    if($(".validate-test").val() != "")
       console.log("Remove disabled");
 
      $(".submit-info").removeClass('disabled')
  });
  

//   $('ul.property_list > li').hide();
//   $('li.section_1').show();
//   console.log("Code loaded");

// $("ul.link_list > li > a").click(function(){
//   $("ul.property_list> li").hide();
//   console.log("in the middle of the list");
//   var property_list = $(this).attr("med_num");
//   $("li.section_" + property_list).show();
// });

// doc



})