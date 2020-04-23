$("th,td").addClass("text-center");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/bookhotel/findAllBookHotel?page=1&size="
        + pageSize;
}