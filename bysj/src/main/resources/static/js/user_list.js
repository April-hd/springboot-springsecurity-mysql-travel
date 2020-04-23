//表格中的th,td都设置为文本居中
$("th,td").addClass("text-center");

var updateObj;
var uid = $("#uid");
var uname = $("#uname");
var uphone = $("#uphone");
var uemail = $("#uemail");
var close = $("#close");
var updateUserInfo = $("#updateUserInfo");

var forbidenObj;
var forbiden_id = $("#forbiden-id");
var forbiden_user = $("#forbiden-user");
var forbiden_confirm = $("#forbiden-confirm");
var openObj;
var open_id = $("#open-id");
var open_user = $("#open-user");
var open_confirm = $("#open-confirm");


function changePageSize() {
    var pageSize = $("#changePageSize").val();

    location.href = "/manage/user/findAllUser?page=1&size="
        + pageSize;
}

$(function () {

    //禁用用户
    $(".forbiden-user").on("click",function () {
        forbidenObj = $(this);
        forbiden_id.val(forbidenObj.attr("userId"));
        forbiden_user.html(forbidenObj.attr("username"));
    });

    forbiden_confirm.on("click",function(){
        $.ajax({
            type:"GET",
            url:"/manage/user/forbidById.json",
            data:{"id":forbiden_id.val()},
            dataType:"json",
            success:function (data) {
                if (data.forbidResult == "true") {
                    alert("禁用成功");
                }else if (data.forbidResult == "false") {
                    alert("禁用失败");
                }
                location.reload();
            },
            error:function () {
                alert("服务器繁忙");
            }
        })
    });

    //启用用户
    $(".open-user").on("click",function () {
        openObj = $(this);
        open_id.val(openObj.attr("userId"));
        open_user.html(openObj.attr("username"));
    });

    open_confirm.on("click",function(){
        $.ajax({
            type:"GET",
            url:"/manage/user/openById.json",
            data:{"id":open_id.val()},
            dataType:"json",
            success:function (data) {
                if (data.openResult == "true") {
                    alert("启用成功");
                }else if (data.openResult == "false") {
                    alert("启用失败");
                }
                location.reload();
            },
            error:function () {
                alert("服务器繁忙");
            }
        })
    });

    //修改用户信息
    $(".updateUserInfo").on("click",function () {
        updateObj = $(this);
        uid.val(updateObj.attr("userId"));
        uname.val(updateObj.attr("username"));
        uphone.val(updateObj.attr("phoneNum"));
        uemail.val(updateObj.attr("email"));
        uphone.blur();
        uemail.blur();
    });

    //修改用户信息时判断电话号码是否已被注册
    uphone.on("blur",function () {
        if (uphone.val() == null || uphone.val() == "") {
            validateTip(uphone.next(),{"color":"red"},imgNo + "电话号码不能为空",false);
        }else {
            //判断手机号码是否符合格式
            var patrn=/^(13[0-9]|15[0-9]|18[0-9])\d{8}$/;
            if(uphone.val().match(patrn)){
                $.ajax({
                    type:"POST",
                    url:"/manage/user/findPhoneNumIsUsed.ajax",
                    data:{"userId":uid.val(),"phoneNum":uphone.val()},
                    dataType:"json",
                    success:function (data) {
                        if (data.selectResult == "true"){
                            validateTip(uphone.next(),{"color":"green"},"",true)
                        } else if (data.selectResult == "false"){
                            validateTip(uphone.next(),{"color":"red"},imgNo + "该电话号码已被注册...请更换",false)
                        }
                    },
                    error:function () {
                        // alert("服务器错误，请检查参数是否合理...");
                    }
                })
            }else{
                validateTip(uphone.next(),{"color":"red"},imgNo + " 您输入的手机号码格式不正确",false);
            }
        }
    });

    //修改用户信息时判断电子邮箱是否已被注册
    uemail.on("blur",function () {
        if (uemail.val() == null || uemail.val() == "") {
            validateTip(uemail.next(),{"color":"red"},imgNo + "电子邮箱不能为空",false);
        }else {
            //判断邮箱是否符合格式
            var patrn = /^[a-z0-9]+([._\\\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;//邮箱正则表达式
            if (uemail.val().match(patrn)) {
                $.ajax({
                    type:"POST",
                    url:"/manage/user/findEmailIsUsed.ajax",
                    data:{"userId":uid.val(),"email":uemail.val()},
                    dataType:"json",
                    success:function (data) {
                        if (data.selectResult == "true"){
                            validateTip(uemail.next(),{"color":"green"},"",true)
                        } else if (data.selectResult == "false"){
                            validateTip(uemail.next(),{"color":"red"},imgNo + "该电子邮箱已被注册...请更换",false)
                        }
                    },
                    error:function () {
                        alert("服务器繁忙");
                    }
                })
            }else {
                validateTip(uemail.next(),{"color":"red"},imgNo + "您输入的电子邮箱格式不正确",false);
            }

        }
    });

    updateUserInfo.on("click",function () {

        if (uphone.attr("validateStatus") != "true"){
            uphone.blur();
        } else if (uemail.attr("validateStatus") != "true"){
            uemail.blur();
        } else {
            $.ajax({
                type:"POST",
                url:"/manage/user/updateUserInfo.ajax",
                data:{"userId":uid.val(),"phoneNum":uphone.val(),"email":uemail.val()},
                dataType:"json",
                success:function (data) {
                    close.click();
                    if (data.updateResult == "true"){
                        alert("修改成功");
                    }
                    if (data.updateResult == "false") {
                        alert("修改失败");
                    }
                    location.reload();
                },
                error:function () {
                    alert("服务器繁忙")
                }
            });
        }

    });

})