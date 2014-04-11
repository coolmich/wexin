$(function(){
  jQuery.validator.setDefaults({
    debug: true,
    success: "valid"
  });
  $('#new_msg').validate({
    rules: {
      msg_phone: {
        required: true,
        phoneUS: true
      }
    }
  });
});