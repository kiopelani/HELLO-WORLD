$(document).ready(function(){
console.log('(my body is) ready!')

$("#bart-form").on('submit', function(e){
  e.preventDefault();

  bartAjaxRequest = $.ajax({
    url: "/bart",
    type: "post",
    data: $(this).serialize()
  });

  bartAjaxRequest.done(function(server_data){


    $("#bart-box").html(server_data.responseText)




    console.log(server_data)
  });

  bartAjaxRequest.fail(function(server_data){
    console.log('failed!')
    console.log(server_data.responseText)
    $("#bart-box").html(server_data.responseText)
  })


})

})