$("th,td").addClass("text-center");

//添加
var newDesName = $("#newDesName");
var newDesDesc = $("#newDesDesc");
var newDesHref = $("#newDesHref");
var newDesStatus = $("#newDesStatus");
var newImgFile = $("#newImgFile");
var newPreviewFile = $("#newPreviewImg");
var addDestination = $("#addDestination");

//修改
var updateObj;
var desId = $("#desId");
var desName = $("#desName");
var desDesc = $("#desDesc");
var desHref = $("#desHref");
var desStatus = $("#desStatus");
var updateImgUrl = $("#updateImgUrl");
var updatePreviewImg = $("#updatePreviewImg");
var close = $("#close");
var updateDestination = $("#updateDestination");

//删除
var deleteObj;
var destinationId = $("#destinationId");
var destinationName = $("#destinationName");
var deleteDestination = $("#deleteDestination");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/destination/findAllDestination?page=1&size="
        + pageSize;
}

$(function () {

    //添加
    newDesName.on("blur",function () {
        if (newDesName.val() == null || newDesName.val() == "") {
            validateTip(newDesName.next(),{"color":"red"},imgNo + "目的地名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/destination/findNewDesNameIsUsed.ajax",
                data:{"newDesName":newDesName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newDesName.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newDesName.next(),{"color":"red"},imgNo + "该目的地名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newDesDesc.on("blur",function () {
        if (newDesDesc.val() == null || newDesDesc.val() == ""){
            validateTip(newDesDesc.next(),{"color":"red"},imgNo + "目的地描述不能为空",false);
        }else {
            validateTip(newDesDesc.next(),{"color":"green"},imgYes,true);
        }
    });

    newDesStatus.on("blur",function () {
        if (newDesStatus.val() == null || newDesStatus.val() == ""){
            validateTip(newDesStatus.next(),{"color":"red"},imgNo + "目的地状态不能为空",false);
        }else {
            validateTip(newDesStatus.next(),{"color":"green"},imgYes,true);
        }
    });

    newImgFile.on("change",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            newPreviewFile.attr("src","");
        }else {
            var src = window.URL.createObjectURL(this.files[0]);
            newPreviewFile.attr("src",src);
        }
    });

    newImgFile.on("blur",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "请选择图片",false);
        }else if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("newImgFile").value)){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片格式不正确",false);
        }else if(fileObj.size > 10485760) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片不能大于10MB",false);
        }else {
            validateTip(newImgFile.next(), {"color": "green"}, imgYes, true);
        }
    });

    addDestination.on("click",function () {
        if (newDesName.attr("validateStatus") != "true") {
            newDesName.blur();
        }else if (newDesDesc.attr("validateStatus") != "true") {
            newDesDesc.blur();
        }else if (newDesStatus.attr("validateStatus") != "true"){
            newDesStatus.blur();
        }else if (newImgFile.attr("validateStatus") != "true"){
            newImgFile.blur();
        }else {
            var fd = new FormData();
            fd.append("name",newDesName.val());
            fd.append("destiDesc",newDesDesc.val());
            fd.append("href",newDesHref.val());
            fd.append("status",newDesStatus.val());
            var fileObj = document.getElementById("newImgFile").files[0];
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/destination/addDestination.ajax",
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
    $(".updateDestination").on("click",function () {
        updateObj = $(this);
        desId.val(updateObj.attr("destinationId"));
        desName.val(updateObj.attr("destinationName"));
        desDesc.val(updateObj.attr("destinationDesc"));
        desStatus.val(updateObj.attr("destinationStatus"));
        document.getElementById("desUrl").setAttribute("src",updateObj.attr("destinationUrl"));
        desHref.val(updateObj.attr("destinationHref"));
        desName.blur();
        desDesc.blur();
        desStatus.blur();
    });

    desName.on("blur",function () {
        if (desName.val() == null || desName.val() == "") {
            validateTip(desName.next(),{"color":"red"},imgNo + "目的地名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/destination/findDesNameIsUsed.ajax",
                data:{"desId":desId.val(),"desName":desName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(desName.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(desName.next(),{"color":"red"},imgNo + "该目的地名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    desDesc.on("blur",function () {
        if (desDesc.val() == null || desDesc.val() == "") {
            validateTip(desDesc.next(),{"color":"red"},imgNo + "目的地描述不能为空",false);
        }else {
            validateTip(desDesc.next(),{"color":"green"},"",true);
        }
    });

    desStatus.on("blur",function () {
        if (desStatus.val() == null || desStatus.val() == "") {
            validateTip(desStatus.next(),{"color":"red"},imgNo + "目的地状态不能为空",false);
        }else {
            validateTip(desStatus.next(),{"color":"green"},"",true);
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

    updateDestination.on("click",function () {
        if (desName.attr("validateStatus") != "true"){
            desName.blur();
        } else if (desDesc.attr("validateStatus") != "true"){
            desDesc.blur();
        } else {

            var fd = new FormData();
            fd.append("id",desId.val());
            fd.append("name",desName.val());
            fd.append("destiDesc",desDesc.val());
            fd.append("status",desStatus.val());
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
                url:"/manage/destination/updateDestination.ajax",
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
    $(".deleteDestination").on("click",function () {
        deleteObj = $(this);
        destinationId.html(deleteObj.attr("destinationId"));
        destinationName.html(deleteObj.attr("destinationName"));
    });

    deleteDestination.on("click",function () {

        $.ajax({
            type:"GET",
            url:"/manage/destination/deleteDestination.ajax",
            data:{"desId":document.getElementById("destinationId").innerText},
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

    });

})