function validateTip(element,css,tipString,status){
    element.css(css);
    element.attr("placeholder",tipString);
    element.attr("validateStatus",status);
}
$(function () {

    var username = $("#username");
    var password = $("#password");
    var submit = $("#submit");
    var error = $("#error");

    username.on("blur",function () {
        if (username.val() == null || username.val() == ""){
            validateTip(username,{"border":"2px solid red"},"用户名不能为空",false);
        } else {
            validateTip(username,{"border":"2px solid #ea6f5a"},"",true);
        }
    });

    password.on("blur",function () {
        if (password.val() == null || password.val() == ""){
            validateTip(password,{"border":"2px solid red"},"密码不能为空",false);
        } else {
            validateTip(password,{"border":"2px solid #ea6f5a"},"",true);
        }
    });

    submit.on("click",function () {
        if (username.attr("validateStatus") != "true"){
            username.blur();
        } else if (password.attr("validateStatus") != "true"){
            password.blur();
        } else {
            $.ajax({
                type:"POST",
                url:"/login.do",
                data:{"username":username.val(),"password":password.val()},
                dataType:"json",
                success:function (data) {
                    if (data.loginResult == "true"){
                        location.href = "/travel";
                    }else if (data.loginResult == "forbid") {
                        error.show();
                        error.css("border","2px solid #ea6f5a");
                        error.html("账号已被禁用");
                        setTimeout(function () {
                            error.fadeOut(1000);
                        },1000);
                    }else if (data.loginResult == "false"){
                        error.show();
                        error.css("border","2px solid #ea6f5a");
                        error.html("用户名或密码错误");
                        setTimeout(function () {
                            error.fadeOut(1000);
                        },1000);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

});