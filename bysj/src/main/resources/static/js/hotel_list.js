$("th,td").addClass("text-center");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/hotel/findAllHotel?page=1&size="
        + pageSize;
}

//添加
var newHotelName = $("#newHotelName")
var newHotelEnglish = $("#newHotelEnglish")
var newHotelDesc = $("#newHotelDesc")
var newHotelLocation = $("#newHotelLocation")
var newHotelPrice = $("#newHotelPrice")
var newHotelDestId = $("#newHotelDestId")
var newImgFile = $("#newImgFile");
var newPreviewImg = $("#newPreviewImg");
var addHotel = $("#addHotel");

//删除
var deleteObj;
var hotelId = $("#hotelId");
var hotelName = $("#hotelName");
var deleteHotel = $("#deleteHotel");

//修改
var updateObj;
var hId = $("#hId");
var hName = $("#hName");
var hEnglish = $("#hEnglish");
var hDesc = $("#hDesc");
var hLocation = $("#hLocation");
var hPrice = $("#hPrice");
var hDestId = $("#hDestId");
var updateImgUrl = $("#updateImgUrl");
var updatePreviewImg = $("#updatePreviewImg");
var updateHotel = $("#updateHotel");

$(function () {

    //添加
    newHotelName.on("blur",function () {
        if (newHotelName.val() == null || newHotelName.val() == ""){
            validateTip(newHotelName.next(),{"color":"red"},imgNo + "酒店名不能为空",false);
        } else {
            validateTip(newHotelName.next(),{"color":"green"},"",true);
        }
    });

    newHotelEnglish.on("blur",function () {
        if (newHotelEnglish.val() == null || newHotelEnglish.val() == ""){
            validateTip(newHotelEnglish.next(),{"color":"red"},imgNo + "英文名不能为空",false);
        } else {
            validateTip(newHotelEnglish.next(),{"color":"green"},"",true);
        }
    });

    newHotelDesc.on("blur",function () {
        if (newHotelDesc.val() == null || newHotelDesc.val() == ""){
            validateTip(newHotelDesc.next(),{"color":"red"},imgNo + "酒店描述不能为空",false);
        } else {
            validateTip(newHotelDesc.next(),{"color":"green"},"",true);
        }
    });

    newHotelLocation.on("blur",function () {
        if (newHotelLocation.val() == null || newHotelLocation.val() == ""){
            validateTip(newHotelLocation.next(),{"color":"red"},imgNo + "酒店地址不能为空",false);
        } else {
            validateTip(newHotelLocation.next(),{"color":"green"},"",true);
        }
    });

    newHotelPrice.on("blur",function () {
        if (newHotelPrice.val() == null || newHotelPrice.val() == ""){
            validateTip(newHotelPrice.next(),{"color":"red"},imgNo + "酒店价格不能为空",false);
        } else {
            validateTip(newHotelPrice.next(),{"color":"green"},"",true);
        }
    });

    newHotelDestId.on("blur",function () {
        if (newHotelDestId.val() == null || newHotelDestId.val() == ""){
            validateTip(newHotelDestId.next(),{"color":"red"},imgNo + "酒店所属目的地不能为空",false);
        } else {
            validateTip(newHotelDestId.next(),{"color":"green"},"",true);
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
        } else if (fileObj.size > 10485760){
            validateTip(newImgFile.next(),{"color":"red"},imgNo + "图片不能大于10MB",false);
        } else {
            validateTip(newImgFile.next(),{"color":"green"},"",true);
        }
    });

    addHotel.on("click",function () {
        if (newHotelName.attr("validateStatus") != "true"){
            newHotelName.blur();
        } else if (newHotelEnglish.attr("validateStatus") != "true"){
            newHotelEnglish.blur();
        } else if (newHotelDesc.attr("validateStatus") != "true") {
            newHotelDesc.blur();
        } else if (newHotelLocation.attr("validateStatus") != "true") {
            newHotelLocation.blur();
        } else if (newHotelPrice.attr("validateStatus") != "true"){
            newHotelPrice.blur();
        } else if (newImgFile.attr("validateStatus") != "true"){
            newImgFile.blur();
        } else if (newHotelDestId.attr("validateStatus") != "true"){
            newHotelDestId.blur();
        } else {
            var fd = new FormData();
            fd.append("name",newHotelName.val());
            fd.append("english",newHotelEnglish.val());
            fd.append("hotelDesc",newHotelDesc.val());
            fd.append("location",newHotelLocation.val());
            fd.append("price",newHotelPrice.val());
            fd.append("destId",newHotelDestId.val());
            var fileObj = document.getElementById("newImgFile").files[0];
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/hotel/addHotel.ajax",
                data:fd,
                processData:false,
                contentType:false,
                dataType:"json",
                success:function (data) {
                    if (data.addResult == "true"){
                        alert("添加成功");
                        location.reload();
                    } else if (data.addResult == "false"){
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
    $(".deleteHotel").on("click",function () {
        deleteObj = $(this);
        hotelId.html(deleteObj.attr("hotelId"));
        hotelName.html(deleteObj.attr("hotelName"));
    })

    deleteHotel.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/hotel/deleteHotel.ajax",
            data:{"hotelId":document.getElementById("hotelId").innerText},
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
    hName.on("blur",function () {
        if (hName.val() == null || hName.val() == ""){
            validateTip(hName.next(),{"color":"red"},imgNo + "酒店名不能为空",false);
        } else {
            validateTip(hName.next(),{"color":"green"},"",true);
        }
    });

    hEnglish.on("blur",function () {
        if (hEnglish.val() == null || hEnglish.val() == ""){
            validateTip(hEnglish.next(),{"color":"red"},imgNo + "英文名不能为空",false);
        } else {
            validateTip(hEnglish.next(),{"color":"green"},"",true);
        }
    });

    hDesc.on("blur",function () {
        if (hDesc.val() == null || hDesc.val() == ""){
            validateTip(hDesc.next(),{"color":"red"},imgNo + "酒店描述不能为空",false);
        } else {
            validateTip(hDesc.next(),{"color":"green"},"",true);
        }
    });

    hLocation.on("blur",function () {
        if (hLocation.val() == null || hLocation.val() == ""){
            validateTip(hLocation.next(),{"color":"red"},imgNo + "酒店地址不能为空",false);
        } else {
            validateTip(hLocation.next(),{"color":"green"},"",true);
        }
    });

    hPrice.on("blur",function () {
        if (hPrice.val() == null || hPrice.val() == ""){
            validateTip(hPrice.next(),{"color":"red"},imgNo + "酒店价格不能为空",false);
        } else {
            validateTip(hPrice.next(),{"color":"green"},"",true);
        }
    });

    hDestId.on("blur",function () {
        if (hDestId.val() == null || hDestId.val() == ""){
            validateTip(hDestId.next(),{"color":"red"},imgNo + "酒店所属目的地不能为空",false);
        } else {
            validateTip(hDestId.next(),{"color":"green"},"",true);
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

    $(".updateHotel").on("click",function () {
        updateObj = $(this);
        hId.val(updateObj.attr("hotelId"));
        hName.val(updateObj.attr("hotelName"));
        hEnglish.val(updateObj.attr("hotelEnglish"));
        hDesc.val(updateObj.attr("hotelDesc"));
        hLocation.val(updateObj.attr("hotelLocation"));
        hPrice.val(updateObj.attr("hotelPrice"));
        document.getElementById("hUrl").setAttribute("src",updateObj.attr("hotelUrl"));
        hDestId.val(updateObj.attr("hotelDestId"));
        hName.blur();
        hEnglish.blur();
        hDesc.blur();
        hLocation.blur();
        hPrice.blur();
        hDestId.blur();
    });

    updateHotel.on("click",function () {
        if (hName.attr("validateStatus") != "true"){
            hName.blur();
        } else if (hEnglish.attr("validateStatus") != "true") {
            hEnglish.blur();
        } else if (hDesc.attr("validateStatus") != "true") {
            hDesc.blur();
        } else if (hLocation.attr("validateStatus") != "true") {
            hLocation.blur();
        } else if (hPrice.attr("validateStatus") != "true") {
            hPrice.blur();
        } else if (hDestId.attr("validateStatus") != "true") {
            hDestId.blur();
        } else {
            var fd = new FormData();
            fd.append("id",hId.val());
            fd.append("name",hName.val());
            fd.append("english",hEnglish.val());
            fd.append("hotelDesc",hDesc.val());
            fd.append("location",hLocation.val());
            fd.append("price",hPrice.val());
            fd.append("destId",hDestId.val());
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
                url:"/manage/hotel/updateHotel.ajax",
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