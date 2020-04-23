//入口函数，都是等待DOM节点加载完毕才来加载下面的函数，所以变量如果用$符来获取的话，要写到入口函数里，不然不报错，方法也失效哦
$(function () {

   $(".faq-tabbable").find("li").each(function () {
       var a = $(this).find("a:first")[0];
       if ($(a).attr("href") == location.pathname){
           $(this).addClass("active");
       } else {
           $(this).removeClass("active");
       }
   });

    $(".carousel-inner .item:eq(0)").addClass("active");

});