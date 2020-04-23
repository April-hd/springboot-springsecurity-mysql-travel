$("th,td").addClass("text-center");

var updateObj;
var rid = $("#rid");
var rname = $("#rname");
var rdesc = $("#rdesc");
var close = $("#close");
var updateRole = $("#updateRole");

$(function () {

    $(".updateRole").on("click",function () {
        updateObj = $(this);
        rid.val(updateObj.attr("roleId"));
        rname.val(updateObj.attr("roleName"));
        rdesc.val(updateObj.attr("roleDesc"));
        rdesc.blur();
    });

    rdesc.on("blur",function () {
        if (rdesc.val() == null || rdesc.val() == "") {
            validateTip(rdesc.next(),{"color":"red"},imgNo + "角色描述不能为空",false);
        }else {
            validateTip(rdesc.next(),{"color":"green"},"",true);
        }
    });

    updateRole.on("click",function () {

        if (rdesc.attr("validateStatus") != "true"){
            rdesc.blur();
        }else {

            $.ajax({
                type:"POST",
                url:"/manage/role/updateRole.ajax",
                data:{"roleId":rid.val(),"roleDesc":rdesc.val()},
                dataType:"json",
                success:function (data) {
                    close.click();
                    if (data.updateResult == "true") {
                        alert("修改成功");
                    }else if (data.updateResult == "false"){
                        alert("修改失败");
                    }
                    location.reload();
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });

        }

    });

})