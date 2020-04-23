$("th,td").addClass("text-center");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/syslog/findAll?page=1&size="
        + pageSize;
}