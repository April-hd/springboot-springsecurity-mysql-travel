//用户的选择
var selectedMonth = "";
var selectedPrice = "";
var selectedDay = "";
var selectedDest = "";

$("#month").find("input[type='radio']").each(function(){
    $(this).on("click",function(){
        $("#selectedMonth").html($(this).val());
        selectedMonth = document.getElementById("selectedMonth").innerHTML;
        changeAjax();
    });
});

$("#price").find("input[type='radio']").each(function(){
    $(this).on("click",function(){
        $("#selectedPrice").html($(this).val());
        selectedPrice = document.getElementById("selectedPrice").innerHTML;
        changeAjax();
    });
});

$("#day").find("input[type='radio']").each(function(){
    $(this).on("click",function(){
        $("#selectedDay").html($(this).val());
        selectedDay = document.getElementById("selectedDay").innerHTML;
        changeAjax();
    });
});

$("#dest").find("input[type='radio']").each(function(){
    $(this).on("click",function(){
        $("#selectedDest").html($(this).val());
        selectedDest = document.getElementById("selectedDest").innerHTML;
        changeAjax();
    });
});

function changeAjax(){
    $.ajax({
        type:"post",
        url:"/travel/freeWalk/fuzzyQuery.ajax",
        data:{"month":selectedMonth,"price":selectedPrice,"day":selectedDay,"dest":selectedDest},
        dataType:"json",
        success:function(data){
            var str = "";
            if (null != data && "" != data) {
                $.each(data,function (index,route) {
                    str += "<div class=\"panel panel-default\">\n" +
                        "<div class=\"panel-body\">\n" +
                        "<div class=\"row\">\n" +
                        "<div class=\"col-lg-3\"><img src=\"../../images/路线.jpg\"><a href=\"\" >" + route.name + "</a></div>" +
                        "<div class=\"col-lg-2\"><img src=\"../../images/日历.jpg\"><span>游玩时间：" + route.time + "天</span></div>" +
                        "<div class=\"col-lg-2\"><img src=\"../../images/太阳.jpg\"><span>季节：" + route.season + "月</span></div>" +
                        "<div class=\"col-lg-2\"><img src=\"../../images/价格.jpg\"><span>价格：" + route.price + "元</span></div>";
                    if (route.status == 1){
                        str += "<div class=\"col-lg-3\"><a target=\"_blank\" href=\"" + route.href + "?routeId=" + route.id + "\" class=\"btn btn-warning\">查看路线</a>" +
                            "<a target=\"_blank\" href=\"/travel/user/addFreeWalkOrder?routeId=" + route.id + "\" class=\"btn btn-success\" >立即预定</a></div>";
                    } else if (route.status == 0){
                        str += "<div class=\"col-lg-3\"><button class=\"btn btn-warning\" disabled=\"disabled\">暂未开通</button>" +
                            "<a target=\"_blank\" href=\"/travel/user/addFreeWalkOrder?routeId=" + route.id + "\" class=\"btn btn-success\" >立即预定</a></div>";
                    }
                    str +=      "</div>" +
                        "<hr>" +
                        "<div class=\"row\">";
                    $.each(route.routePhotoList,function (index1,routePhoto) {
                        str +=  "<div class=\"col-xs-6 col-md-3\">\n" +
                            "<a href=\"#\" class=\"thumbnail\">\n" +
                            "<img style=\"height: 163px;\" src=\"" + routePhoto.url + "\" alt=\"...\">\n" +
                            "</a>\n" +
                            "</div>";
                    });
                    str +=      "</div>" +
                        "</div>" +
                        "</div>";
                });
                $("#detail").html("");//清空前一次查询的数据
                $("#detail").html(str);//将新查询的数据嵌入进去
            }else {
                str += "<p style='text-align: center;'>亲，没有符合该条件的路线哦，尝试下其他的选择吧</p>"
                $("#detail").html(str);
            }
        },
        error:function(){
            alert(selectedMonth+","+selectedPrice+","+selectedDest);
        }
    });
};