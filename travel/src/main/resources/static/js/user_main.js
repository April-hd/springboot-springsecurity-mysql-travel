$(function () {

    //执行结果
    var result = $("#result");

    // 完善个人信息
    var userId = $("#userId");
    var intro = $("#intro");
    var website = $("#website");
    var updateUserInfo = $("#updateUserInfo");

    //修改密码
    var oldpwd = $("#oldpwd");
    var newpwd = $("#newpwd");
    var connewpwd = $("#connewpwd");
    var updatepwd = $("#updatepwd");

    //修改头像
    var imgFile = $("#imgFile");
    var previewImg = $("#previewImg");
    var updateHeaderImg = $("#updateHeaderImg");

    //完善个人信息
    updateUserInfo.on("click",function () {
        //下面这一行是个坑，不能写外面，点击的时候才去set gender，写在外面在页面节点加载的时候就被set上去了，就无法get到了
        var gender = $("input[name='gender']:checked");
        $.ajax({
            type:"POST",
            url:"/travel/user/perfect.ajax",
            data:{"userId":userId.val(),"gender":gender.val(),"intro":intro.val(),"website":website.val()},
            dataType:"json",
            success:function (data) {
                if (data.loginResult == "false"){
                    location.href = "/login";
                } else {
                    if (data.updateResult == "true") {
                        alert("修改成功");
                        location.reload();
                    }else if (data.updateResult == "false"){
                        alert("修改失败");
                    }
                }
            },
            error:function () {
                alert("服务器繁忙");
            }
        });
    });

    //修改密码
    oldpwd.on("blur",function () {
        if (oldpwd.val() == null || oldpwd.val() == "") {
            validateTip(oldpwd.next(),{"color":"red"},imgNo + "请输入旧密码",false);
        }else {
            validateTip(oldpwd.next(),{"color":"green"},"",true);
        }
    });

    newpwd.on("blur",function () {
        // 密码（6-24位，包括字母，数字，特殊字符[.$@!%*#?&]）
        var pattern = /^[a-zA-Z0-9.$@!%*#?&]{6,24}$/;
        if (newpwd.val() == null || newpwd.val() == "") {
            validateTip(newpwd.next(),{"color":"red"},imgNo + "请输入新密码",false);
        }else if (newpwd.val().match(pattern)){
            validateTip(newpwd.next(),{"color":"green"},"",true);
        } else {
            validateTip(newpwd.next(),{"color":"red"},imgNo + "密码组成（6-24位，包括字母，数字，特殊字符[.$@!%*#?&]）",false);
        }
    });

    connewpwd.on("blur",function () {
        if (connewpwd.val() == null || connewpwd.val() == "") {
            validateTip(connewpwd.next(),{"color":"red"},imgNo + "请确认新密码",false);
        }else {
            validateTip(connewpwd.next(),{"color":"green"},"",true);
        }
    });

    updatepwd.on("click",function () {
        if (oldpwd.attr("validateStatus") != "true") {
            oldpwd.blur();
        } else if (newpwd.attr("validateStatus") != "true"){
            newpwd.blur();
        } else if (connewpwd.attr("validateStatus") != "true") {
            connewpwd.blur();
        } else if (newpwd.val() != connewpwd.val()){
            alert("两次密码不一致");
        } else {
            $.ajax({
                type:"POST",//修改密码时发送post请求
                url:"/travel/user/updatepwd.ajax",//请求路径
                data:{"oldpwd":oldpwd.val(),"newpwd":newpwd.val()},//发送参数
                dataType:"json",//返回数据类型
                success:function (data) {//data:返回数据(json对象)
                    if (data.loginResult == "false") {
                        location.href = "/login";
                    }else {
                        result.css("display","block");
                        if (data.updateResult == "true"){
                            //修改成功
                            result.css("border","2px solid #42c02e");
                            result.html("修改成功，请重新登录账号，3秒后将跳转到登录页面");
                            setTimeout(function () {
                                location.href = "/login";
                            },3000);
                        }else if (data.updateResult == "false") {
                            //原密码错误
                            result.css("border","2px solid #42c02e");
                            result.html("原密码错误");
                            setTimeout(function () {
                                result.fadeOut(1000);
                            },1000)
                        }else if (data.updateResult == "error") {
                            alert("服务器繁忙");
                        }
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }

    });

    //修改头像
    imgFile.on("change",function () {
        var fileObj = document.getElementById("imgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            previewImg.attr("src","");
        }else if (!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("imgFile").value)){
            alert("图片不符合jpg|jpeg|png|JPG|JPEG|PNG格式，请重新选择");
            previewImg.attr("src","");
        }else {
            src = window.URL.createObjectURL(this.files[0]);
            previewImg.attr("src",src);
        }
    });

    updateHeaderImg.on("click",function () {
        //1.js获取文件对象
        var fileObj = document.getElementById("imgFile").files[0];
        //2.判断文件是否为空
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择图片");
            return;
        }else if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("imgFile").value)){
            alert("图片不符合jpg|jpeg|png|JPG|JPEG|PNG格式，请重新选择");
            return;
        }else if (fileObj.size > 10485760) {
            alert("选择图片不能超过10MB");
            return;
        }
        //3.创建FormData对象，模拟表单数据
        var formFile = new FormData();
        //4.注入文件对象
        formFile.append("file",fileObj);
        //5.发送Ajax请求
        $.ajax({
            type:"POST",
            url:"/travel/user/updateHeaderImg.ajax",
            data:formFile,
            dataType:"json",
            cache:false,//不缓存
            processData:false,//不处理传的数据，默认会处理，由于FormData已经处理好了，就不用再去处理了
            contentType:false,//
            success:function (data) {
                if (data.loginResult == "false"){
                    //登录失效的处理
                    location.href = "/login";
                }else {
                    if (data.updateResult == "true") {
                        alert("上传成功");
                        location.reload();
                    }else if (data.updateResult == "false"){
                        alert("上传失败");
                    }
                }
            },
            error:function () {
                alert("服务器繁忙");
            }
        });
    })

})