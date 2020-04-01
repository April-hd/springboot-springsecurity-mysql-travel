$("th,td").addClass("text-center");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/order/findAllOrder?page=1&size="
        + pageSize;
}