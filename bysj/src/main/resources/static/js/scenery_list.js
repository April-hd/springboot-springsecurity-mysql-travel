$("th,td").addClass("text-center");

//日历
var newOpenTime = $("#newOpenTime");
var updateOpenTime = $("#updateOpenTime");
var newDate = new Date();
var today = newDate.toJSON();

//添加
var newSceName = $("#newSceName");
var newSceLocation = $("#newSceLocation");
var newSceLevel = $("#newSceLevel");
var newSceOpenTime = $("#newSceOpenTime");
var newScePrice = $("#newScePrice");
var newSceDestId = $("#newSceDestId");
var newImgFile = $("#newImgFile");
var newPreviewFile = $("#newPreviewImg");
var addScenery = $("#addScenery");

//修改
var updateObj;
var sceId = $("#sceId");
var sceName = $("#sceName");
var sceLocation = $("#sceLocation");
var sceLevel = $("#sceLevel");
var sceOpenTime = $("#sceOpenTime");
var scePrice = $("#scePrice");
var sceDestId = $("#sceDestId");
var updateImgUrl = $("#updateImgUrl");
var updatePreviewImg = $("#updatePreviewImg");
var close = $("#close");
var updateScenery = $("#updateScenery");

//删除
var deleteObj;
var sceneryId = $("#sceneryId");
var sceneryName = $("#sceneryName");
var deleteScenery = $("#deleteScenery");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/scenery/findAllScenery?page=1&size="
        + pageSize;
}

$(function () {

    //日历
    newOpenTime.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn'),
        minDate: new Date(today)
    });

    updateOpenTime.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn')
    });

    //添加
    newSceName.on("blur",function () {
        if (newSceName.val() == null || newSceName.val() == "") {
            validateTip(newSceName.next(),{"color":"red"},imgNo + "景点名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/scenery/findNewSceNameIsUsed.ajax",
                data:{"newSceName":newSceName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newSceName.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newSceName.next(),{"color":"red"},imgNo + "该景点名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newSceLocation.on("blur",function () {
        if (newSceLocation.val() == null || newSceLocation.val() == ""){
            validateTip(newSceLocation.next(),{"color":"red"},imgNo + "景点地址不能为空",false);
        }else {
            validateTip(newSceLocation.next(),{"color":"green"},imgYes,true);
        }
    });

    newSceOpenTime.on("blur",function () {
        if (newSceOpenTime.val() == null || newSceOpenTime.val() == ""){
            validateTip(newSceOpenTime.next(),{"color":"red"},imgNo + "景点开放时间不能为空",false);
        }else {
            validateTip(newSceOpenTime.next(),{"color":"green"},"",true);
        }
    });

    newScePrice.on("blur",function () {
        if (newScePrice.val() == null || newScePrice.val() == ""){
            validateTip(newScePrice.next(),{"color":"red"},imgNo + "景点价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            // var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
            if (newScePrice.val().match(regPos)) {
                validateTip(newScePrice.next(),{"color":"green"},imgYes,true);
            }else {
                validateTip(newScePrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }
        }
    });

    newSceDestId.on("blur",function () {
        if (newSceDestId.val() == null || newSceDestId.val() == ""){
            validateTip(newSceDestId.next(),{"color":"red"},imgNo + "景点所属目的地不能为空",false);
        }else {
            validateTip(newSceDestId.next(),{"color":"green"},imgYes,true);
        }
    });

    newImgFile.on("change",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            newPreviewFile.attr("src","");
        } else {
            var src = window.URL.createObjectURL(this.files[0]);
            newPreviewFile.attr("src",src);
        }
    });

    newImgFile.on("blur",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "请选择图片",false);
        }else if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("newImgFile").value)){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片格式不正确",false);
        }else if (fileObj.size > 10485760) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片不能大于10MB",false);
        }else {
            validateTip(newImgFile.next(),{"color":"green"},imgYes,true);
        }
    });

    addScenery.on("click",function () {
       if (newSceName.attr("validateStatus") != "true"){
           newSceName.blur();
       }else if (newSceLocation.attr("validateStatus") != "true"){
           newSceLocation.blur();
       }else if (newSceOpenTime.attr("validateStatus") != "true"){
           newSceOpenTime.blur();
       }else if (newScePrice.attr("validateStatus") != "true") {
           newScePrice.blur();
       }else if (newSceDestId.attr("validateStatus") != "true") {
           newSceDestId.blur();
       }else if (newImgFile.attr("validateStatus") != "true"){
           newImgFile.blur();
       }else {
           var fd = new FormData();
           fd.append("name",newSceName.val());
           fd.append("location",newSceLocation.val());
           fd.append("level",newSceLevel.val());
           fd.append("openTime",newSceOpenTime.val());
           fd.append("price",newScePrice.val());
           fd.append("destId",newSceDestId.val());
           var fileObj = document.getElementById("newImgFile").files[0];
           fd.append("file",fileObj);
           $.ajax({
               type:"POST",
               url:"/manage/scenery/addScenery.ajax",
               data:fd,
               processData:false,
               contentType:false,
               dataType:"json",
               success:function (data) {
                   if (data.addResult == "true") {
                       alert("添加成功");
                   }else if (data.addResult == "false"){
                       alert("添加失败");
                   }
                   location.reload();
               },
               error:function () {
                   alert("服务器繁忙");
               }
           });
       }
    });

    //修改
    $(".updateScenery").on("click",function () {
        updateObj = $(this);
        sceId.val(updateObj.attr("sceneryId"));
        sceName.val(updateObj.attr("sceneryName"));
        sceLocation.val(updateObj.attr("sceneryLocation"));
        sceLevel.val(updateObj.attr("sceneryLevel"));
        sceOpenTime.val(updateObj.attr("sceneryOpenTime"));
        scePrice.val(updateObj.attr("sceneryPrice"));
        sceDestId.val(updateObj.attr("sceneryDestId"));
        document.getElementById("sceUrl").setAttribute("src",updateObj.attr("sceneryUrl"));
        sceName.blur();
        sceLocation.blur();
        scePrice.blur();
        sceOpenTime.blur();
        sceDestId.blur();
    });

    sceName.on("blur",function () {
        if (sceName.val() == null || sceName.val() == "") {
            validateTip(sceName.next(),{"color":"red"},imgNo + "风景名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/scenery/findSceNameIsUsed.ajax",
                data:{"sceId":sceId.val(),"sceName":sceName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(sceName.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(sceName.next(),{"color":"red"},imgNo + "该风景名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    sceLocation.on("blur",function () {
        if (sceLocation.val() == null || sceLocation.val() == "") {
            validateTip(sceLocation.next(),{"color":"red"},imgNo + "景点地址不能为空",false);
        }else {
            validateTip(sceLocation.next(),{"color":"green"},"",true);
        }
    });

    sceOpenTime.on("blur",function () {
        if (sceOpenTime.val() == null || sceOpenTime.val() == "") {
            validateTip(sceOpenTime.next(),{"color":"red"},imgNo + "景点开放时间不能为空",false);
        }else {
            validateTip(sceOpenTime.next(),{"color":"green"},"",true);
        }
    });

    scePrice.on("blur",function () {
        if (scePrice.val() == null || scePrice.val() == "") {
            validateTip(scePrice.next(),{"color":"red"},imgNo + "景点价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            // var regNeg = /^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$/; //负浮点数
            if (scePrice.val().match(regPos)) {
                validateTip(scePrice.next(),{"color":"green"},"",true);
            }else {
                validateTip(scePrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }
        }
    });

    sceDestId.on("blur",function () {
        if (sceDestId.val() == null || sceDestId.val() == "") {
            validateTip(sceDestId.next(),{"color":"red"},imgNo + "景点所属目的地不能为空",false);
        }else {
            validateTip(sceDestId.next(),{"color":"green"},"",true);
        }
    });

    updateImgUrl.on("change",function () {
        var fileObj = document.getElementById("updateImgUrl").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            updatePreviewImg.attr("src","");
        } else {
            var src = window.URL.createObjectURL(this.files[0]);
            updatePreviewImg.attr("src",src);
        }
    });

    updateScenery.on("click",function () {
        if (sceName.attr("validateStatus") != "true") {
            sceName.blur();
        }else if (sceLocation.attr("validateStatus") != "true"){
            sceLocation.blur();
        }else if (sceOpenTime.attr("validateStatus") != "true"){
            sceOpenTime.blur();
        }else if (scePrice.attr("validateStatus") != "true"){
            scePrice.blur();
        }else if (sceDestId.attr("validateStatus") != "true"){
            sceDestId.blur();
        }else {

            var fd = new FormData();
            fd.append("id",sceId.val());
            fd.append("name",sceName.val());
            fd.append("location",sceLocation.val());
            fd.append("level",sceLevel.val());
            fd.append("openTime",sceOpenTime.val());
            fd.append("price",scePrice.val());
            fd.append("destId",sceDestId.val());
            var fileObj = document.getElementById("updateImgUrl").files[0];
            if (fileObj != null){
                if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("updateImgUrl").value)){
                    alert("图片格式不正确");
                    return;
                } else if (fileObj.size > 10485760){
                    alert("图片不能大于10MB");
                    return;
                } else if (fileObj.size > 0) {
                    fd.append("file",fileObj);
                }
            }
            $.ajax({
                type:"POST",
                url:"/manage/scenery/updateScenery.ajax",
                data:fd,
                processData:false,
                contentType:false,
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
            })
        }
    });

    //删除
    $(".deleteScenery").on("click",function () {
        deleteObj = $(this);
        sceneryId.html(deleteObj.attr("sceneryId"));
        sceneryName.html(deleteObj.attr("sceneryName"));
    });

    deleteScenery.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/scenery/deleteScenery.ajax",
            data:{"sceneryId":document.getElementById("sceneryId").innerText},
            dataType:"json",
            success:function (data) {
                close.click();
                if (data.delResult == "true") {
                    alert("删除成功");
                }else if (data.delResult == "false"){
                    alert("删除失败");
                }
                location.reload();
            },
            error:function () {
                alert("服务器繁忙");
            }
        })
    })

})