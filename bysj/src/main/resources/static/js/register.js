function validateTip(element,css,tipString,status){
    element.css(css);
    element.attr("placeholder",tipString);
    element.attr("validateStatus",status);
}
$(function () {
    var username = $("#username");
    var password = $("#password");
    var confirmPassword = $("#confirmPassword");
    var phoneNum = $("#phoneNum");
    var email = $("#email");
    var submit = $("#submit");
    var result = $("#result");

    username.on("blur",function () {
        if (username.val() == null || username.val() == ""){
            validateTip(username,{"border":"2px solid red"},"用户名不能为空",false);
        } else {
            var pattern = /^[a-zA-Z0-9_-]{5,16}$/;//用户名正则表达式，只能由字母数字_-，4-16位
            if (username.val().match(pattern)) {
                $.ajax({
                    type:"POST",
                    url:"/register/findUsernameIsUsed.ajax",
                    data:{"username":username.val()},
                    dataType:"json",
                    success:function (data) {
                        if (data.selectResult == "true"){
                            validateTip(username,{"border":"2px solid #ea6f5a"},"",true);
                            result.css("border","none");
                            result.html("");
                        }else if (data.selectResult == "false") {
                            validateTip(username,{"border":"2px solid red"},"该用户名已被使用，请更换...",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("该用户名已被使用，请更换...");
                        }else if (data.selectResult == "error"){
                            validateTip(username,{"border":"2px solid red"},"服务器繁忙",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("服务器繁忙");
                        }
                    },
                    error:function () {
                        alert("服务器繁忙");
                    }
                });
            }else {
                validateTip(username,{"border":"2px solid red"},"命名不规范",false);
                result.css("border","2px solid #ea6f5a");
                result.html("用户名由字母、数字、_-组成，在5-16位之间");
            }
        }
    });

    password.on("blur",function () {
        // 密码（6-24位，包括字母，数字，特殊字符[.$@!%*#?&]）
        var pattern = /^[a-zA-Z0-9.$@!%*#?&]{6,24}$/;
        if (password.val() == null || password.val() == ""){
            validateTip(password,{"border":"2px solid red"},"密码不能为空",false);
        } else if (password.val().match(pattern)){
            validateTip(password,{"border":"2px solid #ea6f5a"},"",true);
            result.css("border","none");
            result.html("");
        } else {
            validateTip(password,{"border":"2px solid red"},"密码组成（6-24位，包括字母，数字，特殊字符[.$@!%*#?&]）",false);
            result.css("border","2px solid #ea6f5a");
            result.html("密码组成（6-24位，包括字母，数字，特殊字符[.$@!%*#?&]）");
        }
    });

    confirmPassword.on("blur",function () {
        if (confirmPassword.val() == null || confirmPassword.val() == ""){
            validateTip(confirmPassword,{"border":"2px solid red"},"请确认密码",false);
        } else if (password.val() != confirmPassword.val()){
            validateTip(confirmPassword,{"border":"2px solid red"},"两次密码不一致",false);
            result.css("border","2px solid #ea6f5a");
            result.html("两次密码不一致");
        } else {
            validateTip(confirmPassword,{"border":"2px solid #ea6f5a"},"",true);
            result.css("border","none");
            result.html("");
        }
    });

    phoneNum.on("blur",function () {
        if (phoneNum.val() == null || phoneNum.val() == ""){
            validateTip(phoneNum,{"border":"2px solid red"},"电话号码不能为空",false);
        } else {
            var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;//电话号码正则表达式
            if (phoneNum.val().match(patrn)) {
                $.ajax({
                    type:"POST",
                    url:"/register/findPhoneNumIsUsed.ajax",
                    data:{"phoneNum":phoneNum.val()},
                    dataType:"json",
                    success:function (data) {
                        if (data.selectResult == "true"){
                            validateTip(phoneNum,{"border":"2px solid #ea6f5a"},"",true);
                            result.css("border","none");
                            result.html("");
                        }else if (data.selectResult == "false") {
                            validateTip(phoneNum,{"border":"2px solid red"},"该电话号码已被使用，请更换...",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("该电话号码已被使用，请更换...");
                        }else if (data.selectResult == "error"){
                            validateTip(phoneNum,{"border":"2px solid red"},"服务器繁忙",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("服务器繁忙");
                        }
                    },
                    error:function () {
                        alert("服务器繁忙");
                    }
                });
            }else {
                validateTip(phoneNum,{"border":"2px solid red"},"电话号码格式不正确",false);
                result.css("border","2px solid #ea6f5a");
                result.html("电话号码格式不正确");
            }
        }
    });

    email.on("blur",function () {
        if (email.val() == null || email.val() == ""){
            validateTip(email,{"border":"2px solid red"},"电子邮箱不能为空",false);
        } else {
            var patrn = /^[a-z0-9]+([._\\\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;//邮箱正则表达式
            if (email.val().match(patrn)) {
                $.ajax({
                    type:"POST",
                    url:"/register/findEmailIsUsed.ajax",
                    data:{"email":email.val()},
                    dataType:"json",
                    success:function (data) {
                        if (data.selectResult == "true"){
                            validateTip(email,{"border":"2px solid #ea6f5a"},"",true);
                            result.css("border","none");
                            result.html("");
                        }else if (data.selectResult == "false") {
                            validateTip(email,{"border":"2px solid red"},"该电子邮箱已被使用，请更换...",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("该电子邮箱已被使用，请更换...");
                        }else if (data.selectResult == "error"){
                            validateTip(email,{"border":"2px solid red"},"",false);
                            result.css("border","2px solid #ea6f5a");
                            result.html("服务器繁忙");
                        }
                    },
                    error:function () {
                        alert("服务器繁忙");
                    }
                });
            }else {
                validateTip(email,{"border":"2px solid red"},"邮箱格式不正确",false);
                result.css("border","2px solid #ea6f5a");
                result.html("邮箱格式不正确");
            }
        }
    });

    submit.on("click",function () {
        if (username.attr("validateStatus") != "true"){
            username.blur();
        } else if (password.attr("validateStatus") != "true"){
            password.blur();
        } else if (confirmPassword.attr("validateStatus") != "true"){
            confirmPassword.blur();
        } else if (password.val() != confirmPassword.val()) {
            result.css("border","2px solid #ea6f5a");
            result.html("两次密码不一致，请重新确认");
        } else if (phoneNum.attr("validateStatus") != "true") {
            phoneNum.blur();
        } else if (email.attr("validateStatus") != "true") {
            email.blur();
        } else {
            $.ajax({
                type:"POST",
                url:"/register.do",
                data:{"username":username.val(),"password":password.val(),"phoneNum":phoneNum.val(),"email":email.val()},
                dataType:"json",
                success:function (data) {
                    if (data.registerResult == "true"){
                        result.css("border","2px solid #ea6f5a");
                        result.html("注册成功，3秒后将自动进入首页...");
                        setTimeout(function () {
                            location.href = "/travel";
                        },3000);
                    }else if (data.registerResult == "false") {
                        result.css("border","2px solid #ea6f5a");
                        result.html("注册失败");
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

})