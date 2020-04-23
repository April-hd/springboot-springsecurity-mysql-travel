$("th,td").addClass("text-center");

var deleteObj;
var leaveId = $("#leaveId");
var close = $("#close");
var deleteLeaveWord = $("#deleteLeaveWord");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/leaveWord/findAllLeaveWord?page=1&size="
        + pageSize;
}

$(function () {

    $(".deleteLeaveWord").on("click",function () {

        deleteObj = $(this);
        leaveId.html(deleteObj.attr("leaveId"));

    });

    deleteLeaveWord.on("click",function () {

        $.ajax({
            type:"GET",
            url:"/manage/leaaveWord/deleteLeaaveWord.ajax",
            data:{"leaveWordId":document.getElementById("leaveId").innerText},
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