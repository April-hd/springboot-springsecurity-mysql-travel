//页面初始化
var step1 = $("#step1");//第一步
var step2 = $("#step2");//第二步
var step3 = $("#step3");//第三步
var p2 = $("#p2");//第二步的进度条
var p3 = $("#p3");//第三步的进度条

//下单基本信息
var routeId = $("#routeId");//路线id
var price = document.getElementById("price").innerHTML;//路线价格
var reserve = $("#reserve");//日历id
var reserveTime = $("#reserveTime");//预定出发时间
var adult = $("#adult");//成年人数
var child = $("#child");//儿童人数
var totalPrice = $("#totalPrice");//总价格
var addFreeWalkOrder = $("#addFreeWalkOrder");//添加自由行按钮

$(function(){

    //页面初始化
    step2.css("display","none");
    step3.css("display","none");

    document.body.onbeforeunload = function(){
        return "要离开吗？";
    };

    $('[data-toggle="popover"]').popover();//成人提示框
    $("[data-toggle='tooltip']").tooltip();//儿童提示框
    $().alert();//警告框

    //日历
    reserve.datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn'),
        minDate: new Date()
    });

    //下单
    //总价
    adult.on("click",function(){
        var tp = adult.val()*price + child.val()*price*0.5;
        totalPrice.html(tp);
    });

    child.on("click",function(){
        var tp = adult.val()*price + child.val()*price*0.5;
        totalPrice.html(tp);
    });

    addFreeWalkOrder.on("click",function () {
        if (reserveTime.val() == null || reserveTime.val() == "") {
            alert("请选择出发时间");
        }else if (adult.val() == null || adult.val() == "" || adult.val() == 0){
            alert("成年人数不能为0");
        } else {
            $.ajax({
                type:"POST",
                url:"/travel/user/addFreeWalkOrder.ajax",
                data:{"routeId":routeId.val(),"reserveTime":reserveTime.val(),"adult":adult.val(),"child":child.val(),"totalPrice":document.getElementById("totalPrice").innerHTML},
                dataType:"json",
                success:function (data) {
                    if (data.loginResult == "false"){
                        location.href = "/login";//防止登录失效
                    } else {
                        if (data.addResult == "true") {
                            //下单成功
                            p2.css("width","33.3%");//进度条增加33.3%
                            step1.css("display","none");//隐藏第一步
                            step2.css("display","block");//显示第二步
                            if (data.newOrder != "notexist"){
                                var str = "<h2 class=\"page-header\" style=\"text-align: center;\">订单已生成，请支付</h2>";
                                str += "<div class=\"panel panel-default\">" +
                                    "<div class=\"panel-body\">" +
                                    "<div class=\"row\" style=\"padding: 10px;\" >" +
                                    "<h4>订单信息</h4>" +
                                    "<hr>" +
                                    "<div class=\"col-lg-4\">订单编号：" + data.newOrder.orderNum + "</div>" +
                                    "<div class=\"col-lg-3\">下单时间：" + data.newOrder.orderTime + "</div>" +
                                    "<div class=\"col-lg-2\">下单账号：" + data.newOrder.userInfo.username + "</div>" +
                                    "</div>" +
                                    "<div class=\"row\" style=\"padding: 10px;\" >" +
                                    "<h4>购买信息</h4>" +
                                    "<hr>" +
                                    "<div class=\"col-lg-3\">" + data.newOrder.route.name + "</div>" +
                                    "<div class=\"col-lg-2\">成人" + data.newOrder.adult + "人，儿童" + data.newOrder.child + "人</div>" +
                                    "<div class=\"col-lg-2\">共" + data.newOrder.totalPrice + "元</div>" +
                                    "<div class=\"col-lg-2\">出发时间：" + data.newOrder.reserveTime + "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>";
                                str += "<button class=\"btn btn-warning\" id=\"pay\" style=\"float: right;\">立即支付</button>";
                                step2.html(str);
                                $("#pay").on("click",function () {
                                    p3.css("width","33.4%");
                                    step2.css("display","none");
                                    step3.css("display","block");
                                });
                            }else {
                                alert("服务器错误");
                            }
                        }else if (data.addResult == "false"){
                            //下单失败
                            alert("下单失败");
                        }
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

});