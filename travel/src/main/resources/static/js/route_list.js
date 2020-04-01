$("th,td").addClass("text-center");

//添加
var newRouteNum = $("#newRouteNum");
var newRouteName = $("#newRouteName");
var newRoutePrice = $("#newRoutePrice");
var newRouteTime = $("#newRouteTime");
var newRouteSeason = $("#newRouteSeason");
var newRouteDesc = $("#newRouteDesc");
var newRouteHeat = $("#newRouteHeat");
var newRouteStatus = $("#newRouteStatus");
var newRouteHref = $("#newRouteHref");
var addRoute = $("#addRoute");

//修改
var updateObj;
var rId = $("#rId");
var rNum = $("#rNum");
var rName = $("#rName");
var rPrice = $("#rPrice");
var rTime = $("#rTime");
var rSeason = $("#rSeason");
var rHeat = $("#rHeat");
var rDesc = $("#rDesc");
var rStatus = $("#rStatus");
var close = $("#close");
var updateRoute = $("#updateRoute");

//删除
var deleteObj;
var routeId = $("#routeId");
var routeNum = $("#routeNum");
var deleteRoute = $("#deleteRoute");

function changePageSize() {
    var pageSize = $("#changePageSize").val();
    location.href = "/manage/route/findAllRoute?page=1&size="
        + pageSize;
}


$(function () {

    //添加
    newRouteNum.on("blur",function () {
        if (newRouteNum.val() == null || newRouteNum.val() == "") {
            validateTip(newRouteNum.next(),{"color":"red"},imgNo + "路线编号不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/route/findNewRouteNumIsUsed.ajax",
                data:{"newRouteNum":newRouteNum.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newRouteNum.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newRouteNum.next(),{"color":"red"},imgNo + "该路线编号已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newRouteName.on("blur",function () {
        if (newRouteName.val() == null || newRouteName.val() == "") {
            validateTip(newRouteName.next(),{"color":"red"},imgNo + "路线名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/route/findNewRouteNameIsUsed.ajax",
                data:{"newRouteName":newRouteName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(newRouteName.next(),{"color":"green"},imgYes + "可以使用",true);
                    }else if (data.selectResult == "false"){
                        validateTip(newRouteName.next(),{"color":"red"},imgNo + "该路线名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    newRoutePrice.on("blur",function () {
        if (newRoutePrice.val() == null || newRoutePrice.val() == ""){
            validateTip(newRoutePrice.next(),{"color":"red"},imgNo + "路线价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            if (newRoutePrice.val().match(regPos)){
                validateTip(newRoutePrice.next(),{"color":"green"},imgYes,true);
            } else {
                validateTip(newRoutePrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }
        }
    });

    newRouteTime.on("blur",function () {
        if (newRouteTime.val() == null || newRouteTime.val() == ""){
            validateTip(newRouteTime.next(),{"color":"red"},imgNo + "路线天数不能为空",false);
        }else {
            var partern = /^[0-9]*[1-9][0-9]*$/;//正整数
            if (newRouteTime.val().match(partern)){
                validateTip(newRouteTime.next(),{"color":"green"},imgYes,true);
            } else {
                validateTip(newRouteTime.next(),{"color":"red"},imgNo + "请输入正整数",false);
            }
        }
    });

    newRouteSeason.on("blur",function () {
        if (newRouteSeason.val() == null || newRouteSeason.val() == ""){
            validateTip(newRouteSeason.next(),{"color":"red"},imgNo + "路线季节不能为空",false);
        }else {
            validateTip(newRouteSeason.next(),{"color":"green"},imgYes,true);
        }
    });

    newRouteStatus.on("blur",function () {
        if (newRouteStatus.val() == null || newRouteStatus.val() == ""){
            validateTip(newRouteStatus.next(),{"color":"red"},imgNo + "路线状态不能为空",false);
        }else {
            validateTip(newRouteStatus.next(),{"color":"green"},imgYes,true);
        }
    });

    addRoute.on("click",function () {
        if (newRouteNum.attr("validateStatus") != "true") {
            newRouteNum.blur();
        }else if (newRouteName.attr("validateStatus") != "true") {
            newRouteName.blur();
        }else if (newRoutePrice.attr("validateStatus") != "true") {
            newRoutePrice.blur();
        }else if (newRouteTime.attr("validateStatus") != "true") {
            newRouteTime.blur();
        }else if (newRouteSeason.attr("validateStatus") != "true"){
            newRouteSeason.blur();
        }else if (newRouteStatus.attr("validateStatus") != "true"){
            newRouteStatus.blur();
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/route/addRoute.ajax",
                data:{"num":newRouteNum.val(),"name":newRouteName.val(),"price":newRoutePrice.val(),"time":newRouteTime.val(),"season":newRouteSeason.val(),"routeDesc":newRouteDesc.val(),"status":newRouteStatus.val(),"href":newRouteHref.val()},
                dataType:"json",
                success:function (data) {
                    if (data.addResult == "true") {
                        alert("添加成功");
                    }else if (data.addResult == "false"){
                        alert("添加失败");
                    }
                    location.reload();
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    //修改
    $(".updateRoute").on("click",function () {
        updateObj = $(this);
        rId.val(updateObj.attr("routeId"));
        rNum.val(updateObj.attr("routeNum"));
        rName.val(updateObj.attr("routeName"));
        rPrice.val(updateObj.attr("routePrice"));
        rTime.val(updateObj.attr("routeTime"));
        rSeason.val(updateObj.attr("routeSeason"));
        rHeat.val(updateObj.attr("routeHeat"));
        rDesc.val(updateObj.attr("routeDesc"));
        rStatus.val(updateObj.attr("routeStatus"));
        rNum.blur();
        rName.blur();
        rPrice.blur();
        rTime.blur();
        rSeason.blur();
        rStatus.blur();
    });

    rNum.on("blur",function () {
        if (rNum.val() == null || rNum.val() == "") {
            validateTip(rNum.next(),{"color":"red"},imgNo + "路线编号不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/route/findRNumIsUsed.ajax",
                data:{"rId":rId.val(),"rNum":rNum.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(rNum.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(rNum.next(),{"color":"red"},imgNo + "该路线编号已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    rName.on("blur",function () {
        if (rName.val() == null || rName.val() == "") {
            validateTip(rName.next(),{"color":"red"},imgNo + "路线名不能为空",false);
        }else {
            $.ajax({
                type:"POST",
                url:"/manage/route/findRNameIsUsed.ajax",
                data:{"rId":rId.val(),"rName":rName.val()},
                dataType:"json",
                success:function (data) {
                    if (data.selectResult == "true") {
                        validateTip(rName.next(),{"color":"green"},"",true);
                    }else if (data.selectResult == "false"){
                        validateTip(rName.next(),{"color":"red"},imgNo + "该路线名已被使用...请更换",false);
                    }
                },
                error:function () {
                    alert("服务器繁忙");
                }
            });
        }
    });

    rPrice.on("blur",function () {
        if (rPrice.val() == null || rPrice.val() == "") {
            validateTip(rPrice.next(),{"color":"red"},imgNo + "路线价格不能为空",false);
        }else {
            var regPos = /^\d+(\.\d+)?$/; //非负浮点数
            if (rPrice.val().match(regPos)){
                validateTip(rPrice.next(),{"color":"green"},"",true);
            } else {
                validateTip(rPrice.next(),{"color":"red"},imgNo + "请输入正数或正浮点数",false);
            }
        }
    });

    rTime.on("blur",function () {
        if (rTime.val() == null || rTime.val() == "") {
            validateTip(rTime.next(),{"color":"red"},imgNo + "路线天数不能为空",false);
        }else {
            var partern = /^[0-9]*[1-9][0-9]*$/;//正整数
            if (rTime.val().match(partern)){
                validateTip(rTime.next(),{"color":"green"},"",true);
            } else {
                validateTip(rTime.next(),{"color":"red"},imgNo + "请输入正整数",false);
            }
        }
    });

    rSeason.on("blur",function () {
        if (rSeason.val() == null || rSeason.val() == "") {
            validateTip(rSeason.next(),{"color":"red"},imgNo + "路线季节不能为空",false);
        }else {
            validateTip(rSeason.next(),{"color":"green"},"",true);
        }
    });

    rStatus.on("blur",function () {
        if (rStatus.val() == null || rStatus.val() == "") {
            validateTip(rStatus.next(),{"color":"red"},imgNo + "路线状态不能为空",false);
        }else {
            validateTip(rStatus.next(),{"color":"green"},"",true);
        }
    });

    updateRoute.on("click",function () {

        if (rNum.attr("validateStatus") != "true"){
            rNum.blur();
        } else if (rName.attr("validateStatus") != "true"){
            rName.blur();
        } else if (rPrice.attr("validateStatus") != "true"){
            rPrice.blur();
        } else if (rTime.attr("validateStatus") != "true"){
            rTime.blur();
        }else if (rSeason.attr("validateStatus") != "true"){
            rSeason.blur();
        }else if (rStatus.attr("validateStatus") != "true"){
            rStatus.blur();
        } else {

            $.ajax({
                type:"POST",
                url:"/manage/route/updateRoute.ajax",
                data:{"id":rId.val(),"num":rNum.val(),"name":rName.val(),"price":rPrice.val(),"time":rTime.val(),"season":rSeason.val(),"heat":rHeat.val(),"routeDesc":rDesc.val(),"status":rStatus.val()},
                dataType:"json",
                success:function (data) {
                    close.click();
                    if (data.updateResult == "true"){
                        alert("修改成功");
                    } else if (data.updateResult == "false"){
                        alert("修改失败");
                    }
                    location.reload();
                },
                error:function () {
                    alert("服务器繁忙");
                }
            })

        }

    });

    //删除
    $(".deleteRoute").on("click",function () {
        deleteObj = $(this);
        routeId.html(deleteObj.attr("routeId"));
        routeNum.html(deleteObj.attr("routeNum"));
    });

    deleteRoute.on("click",function () {
        $.ajax({
            type:"GET",
            url:"/manage/route/deleteRoute.ajax",
            data:{"routeId":document.getElementById("routeId").innerText},
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
    })

})