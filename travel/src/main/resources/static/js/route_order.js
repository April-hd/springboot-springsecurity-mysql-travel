var routeId = $("#routeId");
var price = document.getElementById("price").innerHTML;
var reserve = $("#reserve");
var reserveTime = $("#reserveTime");
var adult = $("#adult");
var child = $("#child");
var totalPrice = $("#totalPrice");
var newDate = new Date();
var today = newDate.toJSON();
var order = $("#order");

$(function(){

    $('[data-target="#myScrollspy"]').scrollspy({ target: '#myScrollspy' });//滚动条
    $('[data-toggle="popover"]').popover();//成人提示框
    $("[data-toggle='tooltip']").tooltip();//儿童提示框
    $().alert();//警告框

    //总价
    adult.on("click",function(){
        var tp = adult.val()*price + child.val()*price*0.5;
        totalPrice.html(tp);
    });

    child.on("click",function(){
        var tp = adult.val()*price + child.val()*price*0.5;
        totalPrice.html(tp);
    });

    //日历
    reserve.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn'),
        minDate: new Date(today)
    });

    //下单发送ajax请求
    order.on("click",function () {
        if (reserveTime.val() == null || reserveTime.val() == "") {
            alert("请选择出发时间");
        }else if (adult.val() == null || adult.val() == "" || adult.val() == 0){
            alert("成年人数不能为0");
        } else {
            $.ajax({
                type:"POST",
                url:"/travel/user/order.ajax",
                data:{"routeId":routeId.val(),"reserveTime":reserveTime.val(),"adult":adult.val(),"child":child.val(),"totalPrice":document.getElementById("totalPrice").innerHTML},
                dataType:"json",
                success:function (data) {
                    if (data.loginResult == "false"){
                        location.href = "/login";
                    } else {
                        if (data.orderResult == "true") {
                            alert("预定成功，是否立即支付？");
                        }else if (data.orderResult == "false"){
                            alert("预定失败");
                        }
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    })

})