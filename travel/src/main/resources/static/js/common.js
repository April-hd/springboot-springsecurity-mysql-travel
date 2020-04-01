var imgYes = "<img width='15px' src='../../images/y.png' />";
var imgNo = "<img width='15px' src='../../images/n.png' />";

//错误信息提示
function validateTip(element,css,tipString,status) {

    element.css(css);
    element.html(tipString);
    element.prev().attr("validateStatus",status);

}