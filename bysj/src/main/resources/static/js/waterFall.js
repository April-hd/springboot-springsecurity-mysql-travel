//1.编写插件开发基本方法
;
(function($) {
    $.fn.waterFall = function(){
        //2.声明一个对象，用来给每个图片何子设置属性
        var defaults = {
            //间距
            gap:15
        };
        //3.通过$.extend()方法进行扩展
        defaults = $.extend(defaults);
        //4.找到每个图片盒子元素
//					console.log($(this));
        var $this = $(this)//items元素
        var item = $this.children();
//					console.log(item);
        //5.算出瀑布流的列数
        //列数=父容器的宽度除以图片盒子的宽度
        var itemwidth = item.width()//图片盒子的宽度
        var itemheight = 0;//图片盒子高度默认为0
        var column = Math.floor($(this).width()/itemwidth);
        //7.寻找一行中，高度最小那一列的位置，以及这一列的高度值
        var arrHeight = [];//这个数组将来要保存每一列的高度值

        //6.遍历每个图片盒子，对其设置定位的top值和left值
        item.each(function(index,element){
            //7.1获取第一行的高速
            itemheight = $(element).height();

//						console.log(index);
//						console.log(element);
            //6.1县确定第一行的图片盒子排列
            if(index < column){
                $(element).css({
                    top:0,
                    left:(itemwidth + defaults.gap) * index
                })

                //7.2把第一行中的每个图片盒子的高度，保存到数组中去
                arrHeight[index] = itemheight;
//							console.log(arrHeight);

            } else {
                //代表其他行
                //7.3计算数组中最小值以及对应的索引值
                function getMin(arr){
                    var min = {};
                    min.index = 0;// 最小值的索引值
                    min.value = arr[min.index];//最小高度值

                    //遍历数组中的每一项，获取数组中最小值以及对应的索引值
                    for (var i=0;i<arr.length;i++) {
                        if(arr[i] < min.value) {
                            min.value = arr[i];
                            min.index = i;
                        }
                    }
                    return min;
                }

                var min_value = getMin(arrHeight).value;
                var min_index = getMin(arrHeight).index;
//							console.log(arrHeight);
//							console.log(min_index);
//							console.log(min_value);
                //7.4设置下一行的top值和left值
                $(element).css({
                    top: min_value + defaults.gap,
                    left:(itemwidth + defaults.gap) * min_index
                });
                //7.5更新最小列的值
                arrHeight[min_index] += itemheight + defaults.gap
            }
        })

        //8.获取最大列的高度(吧最大列高度值赋值给父容器：items)
        function getMax(arr){
            var max = {}
            max.index = 0;
            max.value = arr[max.index];

            for(var i = 0;i<arr.length;i++){
                if(arr[i]>max.value){
                    max.value = arr[i];
                    max.index = i;
                }
            }
            return max;
        }
        var max_value = getMax(arrHeight).value;
        var max_index = getMax(arrHeight).index;
        //8.1 把最大列高度值赋给父容器: items
        $this.height(max_value);
    }
})(jQuery)

//页面加载完毕执行该函数
window.onload = function(){
    $(".items").waterFall();
}