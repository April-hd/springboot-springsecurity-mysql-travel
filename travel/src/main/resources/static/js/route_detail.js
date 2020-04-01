var newImgFile = $("#newImgFile");
var newPreviewImg = $("#newPreviewImg");
var routeId = $("#routeId");
var uploadImg = $("#uploadImg");

$(function () {

    newImgFile.on("change",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0){
            newPreviewImg.attr("src","");
        } else {
            var src = window.URL.createObjectURL(this.files[0]);
            newPreviewImg.attr("src",src);
        }
    });

    uploadImg.on("click",function () {
        var fileObj = document.getElementById("newImgFile").files[0];
        if (typeof (fileObj) == "undefined" || fileObj.size <= 0) {
            alert("请选择图片");
        }else if(!/\.(jpg|jpeg|png|JPG|JPEG|PNG)$/.test(document.getElementById("newImgFile").value)){
            alert("图片格式不正确");
        }else if (fileObj.size > 10485760) {
            alert("图片不能大于10MB");
        }else {
            var fd = new FormData();
            fd.append("routeId",routeId.val());
            fd.append("file",fileObj);
            $.ajax({
                type:"POST",
                url:"/manage/route/uploadImg.ajax",
                data:fd,
                processData:false,
                contentType:false,
                dataType:"json",
                success:function (data) {
                    if (data.addResult == "true"){
                        location.reload();
                    } else {
                        alert("上传失败");
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

})