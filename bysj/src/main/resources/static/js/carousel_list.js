$("th,td").addClass("text-center");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/carousel/findAllCarousel?page=1&size="
        + pageSize;
}

//添加
var newChinese = $("#newChinese");
var newEnglish = $("#newEnglish");
var newCarDesc = $("#newCarDesc");
var newImgFile = $("#newImgFile");
var newPreviewImg = $("#newPreviewImg");
var addCarousel = $("#addCarousel");

//删除
var deleteObj;
var carouselId = $("#carouselId");
var carouselName = $("#carouselName");
var deleteCarousel = $("#deleteCarousel");

//修改
var updateObj;
var cId = $("#cId");
var cChinese = $("#cChinese");
var cEnglish = $("#cEnglish");
var cDesc = $("#cDesc");
var updatePreviewImg = $("#updatePreviewImg");
var updateImgUrl = $("#updateImgUrl");
var updateCarousel = $("#updateCarousel");

$(function () {

    //添加
    newChinese.on("blur",function () {
        if (newChinese.val() == null || newChinese.val() == "") {
            validateTip(newChinese.next(),{"color":"red"},imgNo + "中文名不能为空",false);
        }else {
            validateTip(newChinese.next(),{"color":"green"},"",true);
        }
    });

    newEnglish.on("blur",function () {
        if (newEnglish.val() == null || newEnglish.val() == "") {
            validateTip(newEnglish.next(),{"color":"red"},imgNo + "英文名不能为空",false);
        }else {
            validateTip(newEnglish.next(),{"color":"green"},"",true);
        }
    });

    newCarDesc.on("blur",function () {
        if (newCarDesc.val() == null || newCarDesc.val() == "") {
            validateTip(newCarDesc.next(),{"color":"red"},imgNo + "图片描述不能为空",false);
        }else {
            validateTip(newCarDesc.next(),{"color":"green"},"",true);
        }
    });

    newImgFile.on("change",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            newPreviewImg.attr("src","");
        }else {
            var src = window.URL.createObjectURL(this.files[0]);
            newPreviewImg.attr("src",src);
        }
    });

    newImgFile.on("blur",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "请选择图片",false);
        }else if (fileObj.size > 10485760) {
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片不能大于10MB",false);
        }else {
            validateTip(newImgFile.next(),{"color":"green"},"",true);
        }
    });

    addCarousel.on("click",function () {
        if (newChinese.attr("validateStatus") != "true"){
            newChinese.blur();
        } else if (newEnglish.attr("validateStatus") != "true") {
            newEnglish.blur();
        }else if (newCarDesc.attr("validateStatus") != "true"){
            newCarDesc.blur();
        } else if (newImgFile.attr("validateStatus") != "true") {
            newImgFile.blur();
        }else {
            var fd = new FormData();
            fd.append("chinese",newChinese.val());
            fd.append("english",newEnglish.val());
            fd.append("carDesc",newCarDesc.val());
            var fileObj = document.getElementById("newImgFile").files[0];
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/carousel/addCarousel.ajax",
                data:fd,
                processData:false,
                contentType:false,
                dataType:"json",
                success:function (data) {
                    if (data.addResult == "true"){
                        alert("添加成功");
                        location.reload();
                    }else if (data.addResult == "false"){
                        alert("添加失败");
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    //删除
    $(".deleteCarousel").on("click",function () {
        deleteObj = $(this);
        carouselId.html(deleteObj.attr("carouselId"));
        carouselName.html(deleteObj.attr("carouselName"));
    });

    deleteCarousel.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/carousel/deleteCarousel.ajax",
            data:{"carouselId":document.getElementById("carouselId").innerText},
            dataType:"json",
            success:function (data) {
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
        });
    });

    //修改
    $(".updateCarousel").on("click",function () {
        updateObj = $(this);
        cId.val(updateObj.attr("carouselId"));
        cChinese.val(updateObj.attr("carouselChinese"));
        cEnglish.val(updateObj.attr("carouselEnglish"));
        cDesc.val(updateObj.attr("carouselDesc"));
        document.getElementById("cUrl").setAttribute("src",updateObj.attr("carouselUrl"))
        cChinese.blur();
        cEnglish.blur();
        cDesc.blur();
    });

    cChinese.on("blur",function () {
        if (cChinese.val() == null || cChinese.val() == "") {
            validateTip(cChinese.next(),{"color":"red"},imgNo + "中文名不能为空",false);
        }else {
            validateTip(cChinese.next(),{"color":"green"},"",true);
        }
    });

    cEnglish.on("blur",function () {
        if (cEnglish.val() == null || cEnglish.val() == "") {
            validateTip(cEnglish.next(),{"color":"red"},imgNo + "英文名不能为空",false);
        }else {
            validateTip(cEnglish.next(),{"color":"green"},"",true);
        }
    });

    cDesc.on("blur",function () {
        if (cDesc.val() == null || cDesc.val() == "") {
            validateTip(cDesc.next(),{"color":"red"},imgNo + "简介不能为空",false);
        }else {
            validateTip(cDesc.next(),{"color":"green"},"",true);
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

    updateCarousel.on("click",function() {
        if (cChinese.attr("validateStatus") != "true"){
            cChinese.blur();
        } else if (cEnglish.attr("validateStatus") != "true"){
            cEnglish.blur();
        } else if (cDesc.attr("validateStatus") != "true"){
            cDesc.blur();
        } else {

            var fd = new FormData();
            fd.append("id",cId.val());
            fd.append("chinese",cChinese.val());
            fd.append("english",cEnglish.val());
            fd.append("carDesc",cDesc.val());
            var fileObj = document.getElementById("updateImgUrl").files[0];
            if (fileObj != null){
                if (fileObj.size > 10485760){
                    alert("图片不能大于10MB");
                } else if (fileObj.size > 0) {
                    fd.append("file",fileObj);
                }
            }
            $.ajax({
                type:"POST",
                url:"/manage/carousel/updateCarousel.ajax",
                data:fd,
                processData:false,
                contentType:false,
                dataType:"json",
                success:function (data) {
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