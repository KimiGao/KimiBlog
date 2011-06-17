$(document).ready(function(){
  $("#message_form").submit(function(){
    var str;
    var name  = $("#message_name").val() 
    if(name.length > 30 || name.length < 2){
      str = "昵称长度需在2到30之间";
      show_error(str)
      return false;
    }
    var email = $("#message_email").val()
    var email_test = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/
    if(email == ""){
      str = "邮箱不能为空"
      show_error(str)
      return false
    }else if(!email_test.test(email)){
      str = "请输入有效的邮箱"
      show_error(str)
      return false
    }

    var message = $("textarea#message_content").val();
    if(message == ""){
      str = "请输入留言内容";
      show_error(str);
      return false
    }else if(message.length > 150){
      str = "留言内容不能超过150字";
      show_error(str);
      return false
    }
  }) 

  function show_error(str){
    $("#error").text(str);
    $("#error").slideDown();
    
  }
})
