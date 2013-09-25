$(document).ready(function() {
    // console.log("hats")
  $("#create_submit").on('submit', function(event) {
    if ( $('#password').val() == $('#password_confirmation').val() ) {
      console.log("passwords match");
    } else {
      alert("Yo, u gotta typo in ur passwordz!");
      event.preventDefault();
      $("#password_confirmation").val("");
      $("#password").focus();
      $("#password").val("");
    }
  });

  $(".post_vote").on('click', function(event) {
    event.preventDefault();

    var url = $(this).attr('href');
    console.log(url);
    $.get(url,function(response){
      console.log(response);

      $("#post_id_"+response.post_id).text("Score: "+response.vote_count);
      
    });
  });

});
