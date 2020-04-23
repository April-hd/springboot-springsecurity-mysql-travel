//日期的时间控制
var live = $("#live");
var leave = $("#leave");

//ajax根据目的名查询酒店
var destName = $("#destName");
var search = $("#search");
var h_detail = $("#h-detail");

$(function () {

    //日历
    live.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn'),
        minDate: new Date()
    });

    leave.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn')
    });

    live.on('dp.change',function(e) {
        leave.data('DateTimePicker').minDate(new Date(e.date + 24*60*60*1000));
    });

    search.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/travel/hotel/findHotelsByDestName.ajax",
            data:{"destName":destName.val()},
            dataType:"json",
            success:function (data) {
                var str = "";
                if (null != data && "" != data){
                    $.each(data,function (index,hotel) {
                        str += "<div class=\"row h-item\">" +
                            "<div class=\"col-lg-3\">" +
                            "<img src=\"" + hotel.url + "\" class=\"img-rounded\">" +
                            "</div>" +
                            "<div class=\"col-lg-9\">" +
                            "<div class=\"h-info\">" +
                            "<h4>" + hotel.name + "</h4>" +
                            "<p>" + hotel.english + "</p>" +
                            "<p>" + hotel.hotelDesc + "</p>" +
                            "<p>位置：" + hotel.location + "</p>" +
                            "<p>价格：" + hotel.price + "</p>" +
                            '<button hotelId=\"' + hotel.id + '\"' + 'hotelPrice=\"' + hotel.price + '\"' + "class=\"btn btn-warning book-hotel\">立即预定</button>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "<hr>";
                    });
                    h_detail.html(str);
                    $(".book-hotel").on("click",function () {
                        if ($("#liveTime").val() == null || $("#liveTime").val() == ""){
                            alert("请填写居住日期");
                        } else if ($("#leaveTime").val() == null || $("#leaveTime").val() == "") {
                            alert("请填写离开日期");
                        } else if ($("#peopleCount").val() == null || $("#peopleCount").val() == "") {
                            alert("请填写居住人数");
                        } else {
                            var hPrice = $(this).attr("hotelPrice");
                            var dateSpan,days;
                            var Date1 = Date.parse($("#liveTime").val());
                            var Date2 = Date.parse($("#leaveTime").val());
                            dateSpan = Date2 - Date1;
                            dateSpan = Math.abs(dateSpan);
                            days = Math.floor(dateSpan / (24 * 3600 * 1000));
                            $.ajax({
                                type:"POST",
                                url:"/travel/user/bookHotel.ajax",
                                data:{"hotelId":$(this).attr("hotelId"),"liveTime":$("#liveTime").val(),"leaveTime":$("#leaveTime").val(),"peopleCount":$("#peopleCount").val(),"price":days*hPrice},
                                dataType:"json",
                                success:function (data) {
                                    if (data.loginResult == "false") {
                                        location.href = "/login";
                                    }else {
                                        if (data.addResult == "true") {
                                            alert("添加成功");
                                        }else if (data.addResult == "false") {
                                            alert("添加失败");
                                        }
                                    }
                                },
                                error:function () {
                                    alert("服务器繁忙");
                                }
                            });
                        }
                    });
                } else{
                    str += "<p style='text-align: center;'>未查询到与" + destName.val() + "相关的酒店数据，请重新输入</p>";
                    h_detail.html(str);
                }

            },
            error:function () {
                alert("服务器繁忙");
            }
        })
    });
})
