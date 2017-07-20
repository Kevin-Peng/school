/**
* 首页js
* Home.js
* 2014.04.17
*/
jQuery(function(){
	//首页左右滚动效果设置
//    jQuery(".home_today").slide({mainCell:".commodity",autoPage:true,effect:"leftLoop",scroll:3,vis:3,interTime:6000});
//    jQuery(".slideBox").hover(function() {
//            jQuery(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
//        },
//        function() {
//            jQuery(this).find(".prev,.next").fadeOut()
//        });
    jQuery(".slideBox").slide({
        titCell: ".triggers",
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        autoPage: true,
        trigger: "click",
        startFun: function(i) {
            var curLi = jQuery(".slideBox .bd li").eq(i);
            if ( !! curLi.attr("_src")) {
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
            }
        }
    });
    jQuery(".home_tuan").hover(function(){ jQuery(this).find(".prev,.next").stop(true,true).fadeTo("show",0.2) },function(){ jQuery(this).find(".prev,.next").fadeOut() });
    jQuery(".home_tuan").slide({ mainCell:".tuan_inner",effect:"fold", autoPlay:true, delayTime:600, trigger:"click"});
    $(".focusBox .close").click(function(){
        $(this).parent().hide();
    })
    //header导航滚动固定
    $(".category_hd").each(function(){
        var topmenu = $(this);
        var topmenu_top = topmenu.offset().top;
        reset_topmenu_top(topmenu, topmenu_top);
        $(window).scroll(function() {
            reset_topmenu_top(topmenu, topmenu_top);
        });
        function reset_topmenu_top(topmenu, topmenu_top) {
            var document_scroll_top = $(document).scrollTop();
            if (document_scroll_top > topmenu_top) {
                topmenu.addClass("category-fixed");
                topmenu.parent().parent().find(".categoryCon").addClass("categoryCon-fixed");
            }
            if (document_scroll_top <= topmenu_top) {
                topmenu.removeClass("category-fixed");
                topmenu.parent().parent().find(".categoryCon").removeClass("categoryCon-fixed");

            }
        }
    });
    //

    //
    $(".category_hd li").hover(function(){
        if($(this).hasClass("selected")){
            $(this).removeClass("hover");
        }else{
            $(this).addClass("hover");
        }
    },function(){
        $(this).removeClass("hover");
    });
    $(".category_bd .commodity li,.list_brands .product_list li").hover(function(){
        $(this).addClass("selected");
    },function(){
        $(this).removeClass("selected");
    })
    $(".category_hd li").hover(function(){
        var target = $(this).data("category");
        $(this).siblings("li").end().addClass("selected");
        $(this).siblings("li").removeClass("selected").parents(".home_activities").find(".categoryCon .category_box").removeClass("show");
        if($(this).hasClass("selected")){
            $(".categoryCon .category_box[data-category='"+target+"']").addClass("show");
        }
    });

    $(".category_box").hover(function(){
       $(this).addClass("show");
    },function(){
       $(this).removeClass("show");
    })

    $(window).bind("scroll",function(){
        $(".category_hd li").removeClass("selected");
    });


    //
    $(".category_hd li").click(function(){
        var target = $(this).data("category");
        $('html,body').animate({scrollTop: $('#'+target).offset().top - 88}, 1000);
    });

});
