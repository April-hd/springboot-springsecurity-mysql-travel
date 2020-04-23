$(function () {

    var comment_submit = $("#comment-submit");
    var routeId = $("#routeId");
    var comment_txt = $("#comment-txt");

    comment_submit.on("click",function () {
        if (comment_txt.val() == null || comment_txt.val() == "") {
            alert("请输入内容");
        }else {
            $.ajax({
                type:"POST",
                url:"/travel/user/leaveWord.ajax",
                data:{"routeId":routeId.val(),"txt":comment_txt.val()},
                // processData: false,
                // contentType: false,
                dataType:"json",
                success:function (data) {
                    if (data.loginResult == "false") {
                        location.href = "/login";
                    }else {
                        if (data.leaveWordResult == "true"){
                            alert("留言成功");
                            location.reload();
                        }else if (data.leaveWordResult == "false") {
                            alert("留言失败");
                        }
                    }

                },
                error:function () {
                    alert("服务器繁忙");
                }
            })
        }
    });

});