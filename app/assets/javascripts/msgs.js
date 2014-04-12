$(function(){

  $.validator.setDefaults({
    errorPlacement: function(error, element) { error.appendTo( element.parent() ); },
    onkeyup: false
  });

  $('#new_msg').validate({
    rules: {
      "msg[phone]": {required: true, phoneUS: true},
      "msg[content]": {required: true}
    },messages:{
      'start':{
        required: "Must pick a starting time"
      }
    },
    onkeyup: false
  });


});

