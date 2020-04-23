$("th,td").addClass("text-center");

//添加
var newFoodName = $("#newFoodName");
var newFoodPrice = $("#newFoodPrice");
var newFoodDesc = $("#newFoodDesc");
var newImgFile = $("#newImgFile");
var newPreviewImg = $("#newPreviewImg");
var addFood = $("#addFood");

//修改
var updateObj;
var fId = $("#fId");
var fName = $("#fName");
var fPrice = $("#fPrice");
var fDesc = $("#fDesc");
var updateImgUrl = $("#updateImgUrl");
var updatePreviewImg = $("#updatePreviewImg");
var close = $("#close");
var updateFood = $("#updateFood");

//删除
var deleteObj;
var foodId = $("#foodId");
var foodName = $("#foodName");
var deleteFood = $("#deleteFood");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/food/findAllFood?page=1&size="
        + pageSize;
}


$(function () {

    //添加
    newFoodName.on("blur",function () {
        if (newFoodName.val() == null || newFoodName.val() == "") {
            validateTip(newFoodName.next(),{"color":"red"},imgNo + "美食名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/food/findNewFoodNameIsUsed.ajax",
                data:{"newFoodName":newFoodName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newFoodName.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newFoodName.next(),{"color":"red"},imgNo + "该美食名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newFoodPrice.on("blur",function () {
        if (newFoodPrice.val() == null || newFoodPrice.val() == ""){
            validateTip(newFoodPrice.next(),{"color":"red"},imgNo + "美食价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            if (newFoodPrice.val().match(regPos)){
                validateTip(newFoodPrice.next(),{"color":"green"},imgYes,true);
            } else {
                validateTip(newFoodPrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }
        }
    });

    newFoodDesc.on("blur",function () {
        if (newFoodDesc.val() == null || newFoodDesc.val() == ""){
            validateTip(newFoodDesc.next(),{"color":"red"},imgNo + "美食描述不能为空",false);
        }else {
            validateTip(newFoodDesc.next(),{"color":"green"},imgYes,true);
        }
    });

    newImgFile.on("change",function () {
       var fileObj = document.getElementById("newImgFile").files[0];
       if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
           newPreviewImg.attr("src","");
       }else {
           var src = window.URL.createObjectURL(this.files[0]);
           newPreviewImg.attr("src",src);
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

    addFood.on("click",function () {
        if (newFoodName.attr("validateStatus") != "true") {
            newFoodName.blur();
        }else if (newFoodPrice.attr("validateStatus") != "true"){
            newFoodPrice.blur();
        } else if (newFoodDesc.attr("validateStatus") != "true") {
            newFoodDesc.blur();
        }else if (newImgFile.attr("validateStatus") != "true"){
            newImgFile.blur();
        }else {
            var fd = new FormData();
            fd.append("name",newFoodName.val());
            fd.append("price",newFoodPrice.val());
            fd.append("foodDesc",newFoodDesc.val());
            var fileObj = document.getElementById("newImgFile").files[0];
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/food/addFood.ajax",
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
    $(".updateFood").on("click",function () {
        updateObj = $(this);
        fId.val(updateObj.attr("foodId"));
        fName.val(updateObj.attr("foodName"));
        fPrice.val(updateObj.attr("foodPrice"));
        fDesc.val(updateObj.attr("foodDesc"));
        document.getElementById("fUrl").setAttribute("src",updateObj.attr("foodUrl"));
        fName.blur();
        fPrice.blur();
        fDesc.blur();
    });

    fName.on("blur",function () {
        if (fName.val() == null || fName.val() == "") {
            validateTip(fName.next(),{"color":"red"},imgNo + "美食名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/food/findFNameIsUsed.ajax",
                data:{"fId":fId.val(),"fName":fName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(fName.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(fName.next(),{"color":"red"},imgNo + "该美食名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    fPrice.on("blur",function () {
        if (fPrice.val() == null || fPrice.val() == "") {
            validateTip(fPrice.next(),{"color":"red"},imgNo + "美食价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            if (fPrice.val().match(regPos)) {
                validateTip(fPrice.next(),{"color":"green"},"",true);
            }else {
                validateTip(fPrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }

        }
    });

    fDesc.on("blur",function () {
        if (fDesc.val() == null || fDesc.val() == "") {
            validateTip(fDesc.next(),{"color":"red"},imgNo + "美食描述不能为空",false);
        }else {
            validateTip(fDesc.next(),{"color":"green"},"",true);
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

    updateFood.on("click",function () {

        if (fName.attr("validateStatus") != "true"){
            fName.blur();
        }else if (fPrice.attr("validateStatus") != "true"){
            fPrice.blur();
        }else if (fDesc.attr("validateStatus") != "true"){
            fDesc.blur();
        }else {

            var fd = new FormData();
            fd.append("id",fId.val());
            fd.append("name",fName.val());
            fd.append("price",fPrice.val());
            fd.append("foodDesc",fDesc.val());
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
                url:"/manage/food/updateFood.ajax",
                data:fd,
                processData:false,
                contentType:false,
                dataType:"json",
                success:function (data) {
                    close.click();
                    if (data.updateResult == "true"){
                        alert("修改成功");
                    } else if (data.updateResult == "false"){
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
    $(".deleteFood").on("click",function () {
        deleteObj = $(this);
        foodId.html(deleteObj.attr("foodId"));
        foodName.html(deleteObj.attr("foodName"));
    });

    deleteFood.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/food/deleteFood.ajax",
            data:{"foodId":document.getElementById("foodId").innerText},
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
