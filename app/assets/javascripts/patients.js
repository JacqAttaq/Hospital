
$(document).on('click', 'search-submit' function(){
  console.log("test")
  var facility_id = $(this).attr("facility_id");
  var search = $(".search-patient").val()
  $.ajax({
    type: 'GET',
    url: '/facility/'+ facility_id +'/patients/' + '/search_results'
    dataType: 'script'
    data: {q: search}
  });
});

$(document).on('click', 'update-deactivate', function(){
  facility_id = $("facility_id");
  patient_id = $("patient_id");
  $.ajax({
    type: 'PATCH'
    url: 'facilities/' + facility_id + '/patients/' + patient_id + 'deactivated_patient',
    dataType: 'script'
  })


})

$(document).on('click','.update-wait',function(){
  var facility_id = $("facility_id");
  var patient_id = $("patient_id");
  $.ajax({
    type: 'PATCH',
    url:'facilities/'+ facility_id +'/patients/' + patient_id + '/wait_patient',
    dataType: 'script'
  })
})

$(document).on('click','.update-check',function(){
  var facility_id = $(this).attr("facility_id");
  var patient_id = $(this).attr("patient_id");
  console.log ("a;linfe")
  $.ajax({
    type: 'PATCH',
    url: '/patients/' + patient_id + '/check_patient',
    dataType: 'script'
  })
})

$(document).on('click','.update-leave',function(){
  var facility_id = $(this).attr("facility_id");
  var patient_id = $(this).attr("patient_id");
  console.log ("a;linfe")
  $.ajax({
    type: 'PATCH',
    url: 'facilities/'+facility_id +'/patients/' + patient_id + '/leave_patient',
    dataType: 'script'
  })
})