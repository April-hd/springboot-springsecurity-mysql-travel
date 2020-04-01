$(function () {

    $(".faq-tabbable").find("a").each(function () {
        var a = $(this);
        if ($(a).attr("href") == location.pathname){
            $(this).addClass("active");
        } else {
            $(this).removeClass("active");
        }
    });

});