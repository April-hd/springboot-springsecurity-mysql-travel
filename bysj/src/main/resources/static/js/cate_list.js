$("th,td").addClass("text-center");

//添加
var newCateName = $("#newCateName");
var newCateLocation = $("#newCateLocation");
var newCateDesc = $("#newCateDesc");
var newCateDestId = $("#newCateDestId");
var newImgFile = $("#newImgFile");
var newPreviewImg = $("#newPreviewImg");
var addCate = $("#addCate");

//修改
var updateObj;
var cId = $("#cId");
var cName = $("#cName");
var cLocation = $("#cLocation");
var cDesc = $("#cDesc");
var cDestId = $("#cDestId");
var updateImgUrl = $("#updateImgUrl");
var updatePreviewImg = $("#updatePreviewImg");
var close = $("#close");
var updateCate = $("#updateCate");

//删除
var deleteObj;
var cateId = $("#cateId");
var cateName = $("#cateName");
var deleteCate = $("#deleteCate");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/cates/findAllCate?page=1&size="
        + pageSize;
}

$(function () {

    //添加
    newCateName.on("blur",function () {
        if (newCateName.val() == null || newCateName.val() == "") {
            validateTip(newCateName.next(),{"color":"red"},imgNo + "美食店名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/cate/findNewCateNameIsUsed.ajax",
                data:{"newCateName":newCateName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newCateName.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newCateName.next(),{"color":"red"},imgNo + "该美食店名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newCateLocation.on("blur",function () {
        if (newCateLocation.val() == null || newCateLocation.val() == ""){
            validateTip(newCateLocation.next(),{"color":"red"},imgNo + "美食店地址不能为空",false);
        }else {
            validateTip(newCateLocation.next(),{"color":"green"},imgYes,true);
        }
    });

    newCateDesc.on("blur",function () {
        if (newCateDesc.val() == null || newCateDesc.val() == ""){
            validateTip(newCateDesc.next(),{"color":"red"},imgNo + "美食店描述不能为空",false);
        }else {
            validateTip(newCateDesc.next(),{"color":"green"},imgYes,true);
        }
    });

    newCateDestId.on("blur",function () {
        if (newCateDestId.val() == null || newCateDestId.val() == ""){
            validateTip(newCateDestId.next(),{"color":"red"},imgNo + "美食店所属目的地不能为空",false);
        }else {
            validateTip(newCateDestId.next(),{"color":"green"},imgYes,true);
        }
    });

    newImgFile.on("change",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            newPreviewImg.attr("src","");
        } else {
            var src = window.URL.createObjectURL(this.files[0]);
            newPreviewImg.attr("src",src);
        }
    });

    newImgFile.on("blur",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "请选择图片",false);
        } else if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("newImgFile").value)){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片格式不正确",false);
            // newPreviewFile.attr("src","");
        } else if (fileObj.size > 10485760) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片不能大于10MB",false);
        } else {
            validateTip(newImgFile.next(),{"color":"green"},imgYes,true);
        }
    });

    addCate.on("click",function () {
        if (newCateName.attr("validateStatus") != "true") {
            newCateName.blur();
        }else if (newCateLocation.attr("validateStatus") != "true"){
            newCateLocation.blur();
        } else if (newCateDesc.attr("validateStatus") != "true") {
            newCateDesc.blur();
        }else if (newCateDestId.attr("validateStatus") != "true") {
            newCateDestId.blur();
        }else if (newImgFile.attr("validateStatus") != "true"){
            newImgFile.blur();
        } else {
            var fd = new FormData();
            fd.append("name",newCateName.val());
            fd.append("location",newCateLocation.val());
            fd.append("catesDesc",newCateDesc.val());
            fd.append("destId",newCateDestId.val());
            var fileObj = document.getElementById("newImgFile").files[0];
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/cate/addCate.ajax",
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
    $(".updateCate").on("click",function () {
        updateObj = $(this);
        cId.val(updateObj.attr("cateId"));
        cName.val(updateObj.attr("cateName"));
        cLocation.val(updateObj.attr("cateLocation"));
        cDesc.val(updateObj.attr("catesDesc"));
        cDestId.val(updateObj.attr("cateDestId"));
        document.getElementById("cUrl").setAttribute("src",updateObj.attr("cateUrl"));
        cName.blur();
        cLocation.blur();
        cDesc.blur();
        cDestId.blur();
    });

    cName.on("blur",function () {
        if (cName.val() == null || cName.val() == "") {
            validateTip(cName.next(),{"color":"red"},imgNo + "美食店名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/cate/findCNameIsUsed.ajax",
                data:{"cId":cId.val(),"cName":cName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(cName.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(cName.next(),{"color":"red"},imgNo + "该美食店名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    cLocation.on("blur",function () {
        if (cLocation.val() == null || cLocation.val() == "") {
            validateTip(cLocation.next(),{"color":"red"},imgNo + "美食店地址不能为空",false);
        }else {
            validateTip(cLocation.next(),{"color":"green"},"",true);
        }
    });

    cDesc.on("blur",function () {
        if (cDesc.val() == null || cDesc.val() == "") {
            validateTip(cDesc.next(),{"color":"red"},imgNo + "美食店描述不能为空",false);
        }else {
            validateTip(cDesc.next(),{"color":"green"},"",true);
        }
    });

    cDestId.on("blur",function () {
        if (cDestId.val() == null || cDestId.val() == "") {
            validateTip(cDestId.next(),{"color":"red"},imgNo + "美食店所属目的地不能为空",false);
        }else {
            validateTip(cDestId.next(),{"color":"green"},"",true);
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

    updateCate.on("click",function () {

        if (cName.attr("validateStatus") != "true"){
            cName.blur();
        }else if (cLocation.attr("validateStatus") != "true"){
            cLocation.blur();
        }else if (cDesc.attr("validateStatus") != "true"){
            cDesc.blur();
        }else if (cDestId.attr("validateStatus") != "true"){
            cDestId.blur();
        }else {

            var fd = new FormData();
            fd.append("id",cId.val());
            fd.append("name",cName.val());
            fd.append("location",cLocation.val());
            fd.append("catesDesc",cDesc.val());
            fd.append("destId",cDestId.val());
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
                url:"/manage/cate/updateCate.ajax",
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
            });

        }

    });

    //删除
    $(".deleteCate").on("click",function () {
        deleteObj = $(this);
        cateId.html(deleteObj.attr("cateId"));
        cateName.html(deleteObj.attr("cateName"));
    });

    deleteCate.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/cate/deleteCate.ajax",
            data:{"cateId":document.getElementById("cateId").innerText},
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