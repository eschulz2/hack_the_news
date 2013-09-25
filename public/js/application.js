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

});
