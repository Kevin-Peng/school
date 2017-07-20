/**
 * 公共js
 * common.js
 * 2014.04.17
 */

// Don't change this code
SFM = (typeof window.SFM === "undefined") ? {} : window.SFM;

var Commons = {

    // Softly Tip Box
    // How to use it :
    // Commons.tip('Tip text');          // default style
    // Commons.tip('Tip text', 'Type');  // Type1: success,
    // Type2: warning,
    // Type3: error,
    // Type4: info;
    'tip': function(text, type) {
        if (!text) return false;
        var typename = type || '';
        if ($('body > .softlyTipBox').length == 0) {
            $('body').append('<div class="softlyTipBox ' + typename + '"><p>' + text + '</p></div>');
            setTimeout(function() {
                $('body > .softlyTipBox').addClass('show');
            }, 10);

            setTimeout(function() {
                setTimeout(function() {
                    $('body > .softlyTipBox').fadeOut(200,function(){
                        $(this).remove();
                    });
                }, 300);
            }, 3000);
        }else{
            $('body > .softlyTipBox p').text(text);
        }
    },

    // Message Box
    // How to use it :
    // Commons.msgBox('Message', 'Title', 'Type');  // Type1: success,
    // Type2: warning,
    // Type3: error,
    // Type4: info;
    'msgBox': function(text, title, type) {
        if (!text) return false;
        var titletxt = title || '消息',
            typename = type || '';

        $('body').append('<div class="hintBox ' + typename + '"><div class="hint_hd">' + titletxt + '<a class="close" href="#">关闭</a></div><div class="hint_bd">' + text + '</div></div>');

        $('.hintBox .close, .hintBox .cancel').on('click', function(event) {
            event.preventDefault();
            $(this).parentsUntil('.hintBox').last().parent().remove();
        });

        //DIV居中
        ScreenCenterAlign('.hintBox');
    },

    // Confirm Box
    // How to use it :
    // Type1: Commons.confirmBox('Message', function() {});
    // Type2: Commons.confirmBox('Message', 'Title', function() {});
    'confirmBox': function(text, title, callback) {
        if (!text) return false;
        var titletxt = title || '消息';

        if (typeof(title) === 'function') {
            titletxt = '消息';
        }

        var htmlTpl = $('<div class="hintBox"><div class="hint_hd">' + titletxt + '<a class="close" href="#">关闭</a></div><div class="hint_bd">' + text + '</div><div class="hint_ft"><a class="btn confirm" href="#">确认</a> <a class="btn cancel" href="#">取消</a></div></div>');
        $('body').append(htmlTpl);

        $('.close, .cancel', htmlTpl).click(function(event) {
            event.preventDefault();
            $(this).parentsUntil('.hintBox').last().parent().remove();
        });

        $('.confirm', htmlTpl).click(function(event) {
            event.preventDefault();
            $(this).parentsUntil('.hintBox').last().parent().remove();
            if (typeof(title) === 'function') {
                title();
            } else {
                callback();
            }
        });

        //DIV居中
        ScreenCenterAlign('.hintBox');
    },

    // Loading Box
    // How to use it :
    // commonStart.loadingBox();          // will be close/remove loading box
    // commonStart.loadingBox('remove');  // remove loading box
    loadingBox: function (text, className) {
        var cName = className || '';
        if (text == 'remove') {
            $('.loadingBox').fadeOut(800);
            setTimeout(function () {
                $('.loadingBox').remove();
            }, 800);
        } else {
            var txt = text || 'Loading...';
            $('body').append('<div class="loadingBox ' + cName + '"><p>' + txt + '</p></div>');
        }
    }
}

$(function(){
    //header导航滚动固定
//    $(".nav_inner").each(function(){
//        var topmenu = $(this);
//        var topmenu_top = topmenu.offset().top;
//        reset_topmenu_top(topmenu, topmenu_top);
//        $(window).scroll(function() {
//            reset_topmenu_top(topmenu, topmenu_top);
//        });
//        function reset_topmenu_top(topmenu, topmenu_top) {
//            var document_scroll_top = $(document).scrollTop();
//            if (document_scroll_top > topmenu_top) {
//                topmenu.css({'position':'fixed','top':'0px'});
//            }
//            if (document_scroll_top <= topmenu_top) {
//                topmenu.attr('style',{'top':topmenu_top+'px'});
//            }
//        }
//    });
    //详细页滚动固定
    $(".read_order_wrap").each(function(){
        var topmenu = $(this);
        var topmenu_top = topmenu.offset().top;
        reset_topmenu_top(topmenu, topmenu_top);
        $(window).scroll(function() {
            reset_topmenu_top(topmenu, topmenu_top);
        });
        function reset_topmenu_top(topmenu, topmenu_top) {
            var document_scroll_top = $(document).scrollTop();
            if (document_scroll_top > topmenu_top) {
                topmenu.addClass("read_order_fixed");
            }
            if (document_scroll_top <= topmenu_top) {
                topmenu.removeClass("read_order_fixed");
            }
        }
    });
    //回到顶部
    showScroll();
    function showScroll(){
        $(window).scroll(function() {
            var scrollValue=$(window).scrollTop();
            scrollValue > 100 ? $(".toTop").addClass("gotop"):$(".toTop").removeClass("gotop");
        } );
        $('.toTop a').click(function(){
            $("html,body").animate({scrollTop:0},200);
        });
    }
    //header头部弹出层效果
    $(".mod_hover").hover(function(){
        $(this).addClass("hover_on");
    },function(){
        $(this).removeClass("hover_on");
    })

    //购物车页面效果
    $(".cs_wrapper li").click(function(){
        $(this).siblings("li").removeClass("current").end().addClass("current");
    })
    $(".invoice span").click(function(){
        $(this).siblings("span").removeClass("cur").end().addClass("cur");
    })
    $(".step_radio").click(function(){
        var _this = $(this);
        _this.siblings(".step_radio").removeClass("selected").end().addClass("selected");
    })

    $(".ship_radio_wrap .step_radio").click(function(){
        var _this = $(this);
        _this.siblings(".step_radio").removeClass("selected").end().addClass("selected");
        $(".the_bank").find(".step_radio").removeClass("selected");
        $(".selected_bank").find(".step_radio").removeClass("selected");
    })
    $(".the_bank .step_radio").click(function(){
        var _this = $(this);
        _this.siblings(".step_radio").removeClass("selected").end().addClass("selected");
        $(".ship_radio_wrap").find(".step_radio").removeClass("selected");
        $(".selected_bank").find(".step_radio").removeClass("selected");
    })

    $(".mod_radio .on_radio").click(function(){
        $(this).siblings(".on_radio").removeClass("selected").end().addClass("selected");
    })

    //选项卡
    var tabTitle = ".tabTit li";
    var tabContent = ".tabCon";
    $(tabTitle + ":first").addClass("current");
    $(tabContent).not(":first").hide();
    $(tabTitle).unbind("mouseover").bind("mouseover", function(){
        $(this).siblings("li").removeClass("current").end().addClass("current");
        var index = $(tabTitle).index( $(this) );
        $(tabContent).eq(index).siblings(tabContent).hide().end().fadeIn(200);
    });
    //设为默认地址
    $(".address_list li").live({
        "mouseover":function(){
            $(this).find(".setDefault").css({"display":"block"});
        },
        "mouseout":function(){
            $(this).find(".setDefault").css({"display":"none"});
        }
    });
    //end Toggle Content

    //提示框居中
    ScreenCenterAlign('.prompt_box');


    //address
    $('.address-list input[name="userAddress"]').click(function(){
        $(this).parents('li').addClass('selected').siblings().removeClass('selected');
    });

    //input show item
    $('.showitem').change(function(){
        var tswitch = $(this),
            tget = tswitch.attr('data-target');
        if ($(this).is(':checked')) {
            if (tget && tget.indexOf) {
                $("#"+tget).slideDown();
                $(this).parent().find(".on_checkbox").addClass("selected");
            } else {
                $(this).next().slideDown();
            }
        } else {
            if (tget && tget.indexOf) {
                $("#"+tget).slideUp();
                $(this).parent().find(".on_checkbox").removeClass("selected");
            } else {
                $(this).next().slideUp();
            }
        }
    });

    $(':radio.showform').click(function(){
        $(this).nextAll('.cform').slideDown();
    });
    $(':radio.hideform').click(function(){
        $(this).nextAll('.cform').slideUp();
    });

    //右栏弹出
    $(".fixed_sidebar").css("right","0px");

    //右栏li弹出效果
    $(".sidebar_cnt li").hover(function(){
        $(this).find("a").stop().addClass("selected");
        $(this).find("div").stop().addClass("sidebar_box");
    },function(){
        $(this).find("a").stop().removeClass("selected");
        $(this).find("div").stop().removeClass("sidebar_box");
    })
    function Divhover() {
        $(".sidebar_cnt li").hover(function(){
            $(this).find("a").stop().addClass("selected");
            $(this).find("div").stop().addClass("sidebar_box");
        },function(){
            $(this).find("a").stop().removeClass("selected");
            $(this).find("div").stop().removeClass("sidebar_box");
        })
    };
    //右栏客服中心
    $(".kefu .kefuOn").click(function(){
        $(this).parents(".fixed_sidebar").find(".code_box_mm").css("right","-500px");
        $(this).parents(".fixed_sidebar").find(".codeBox").css("right","-500px");
        $(this).parents(".fixed_sidebar").find(".kefu_box").css("right","36px");
    });
    $(".kefu_box .add").click(function(){
        $(this).parent().css("right","-500px");
        $(this).parents(".fixed_sidebar").find(".kefuBox").css("right","36px");
    });
    $(".kefu_box .kefu_close,.kefuBox .kefu_close").click(function(){
        $(this).parent().css("right","-225px");
    });
    //右栏二维码
    $(".code_box_mm").css("right","36px");
    $(".code_box_mm .code_close,.codeBox .code_close").click(function(){
       $(this).parent().css("right","-225px");
    });
    $(".code_box_mm .add").click(function(){
        $(this).parent().css("right","-150px");
        $(this).parents(".fixed_sidebar").find(".codeBox").css("right","36px");
    });
    $(".code .codeOn").click(function(){
        $(this).parents(".fixed_sidebar").find(".code_box_mm").css("right","36px");
        $(this).parents(".fixed_sidebar").find(".codeBox").css("right","-225px");
        $(this).parents(".fixed_sidebar").find(".kefu_box").css("right","-500px");
        $(this).parents(".fixed_sidebar").find(".kefuBox").css("right","-500px");
    });

    //右栏用户中心弹出
    $(".mpbtn_login").click(function() {
        $(this).find("a").addClass("selected");
        $(this).parents(".fixed_sidebar").find(".userBox").addClass("sidebarBox");
        $(this).find("div").removeClass("sidebar_box");
        $(this).unbind("hover");
    });
    $(".userBox .close").click(function(){
        $(this).parents(".fixed_sidebar").find(".mpbtn_login a").removeClass("selected");
        $(this).parents(".fixed_sidebar").find(".userBox").removeClass("sidebarBox");
        Divhover();
    });
    $('.userBox').mousedown(function(event) {
        event.stopPropagation();
    });
    $(document).mousedown(function() {
        $(".mpbtn_login a").removeClass("selected");
        $(".userBox").removeClass("sidebarBox");
        Divhover();
    });
    //右栏购物车弹出
    $(".mpbtn_shopping").click(function(){
        $(this).find(".shopping").stop().addClass("shopping_on");
        $(this).parents(".fixed_sidebar").find(".mod_shopping").stop().addClass("sidebarBox");
        $(this).removeClass("sidebarOn");
        $(this).unbind("hover");
    });
    $(".mod_shopping .close").click(function(){
        $(this).parents(".fixed_sidebar").find(".shopping").stop().removeClass("shopping_on");
        $(this).parents(".fixed_sidebar").find(".mod_shopping").stop().removeClass("sidebarBox");
        Divhover();
    });
    $('.mod_shopping').mousedown(function(event) {
        event.stopPropagation();
    });
    $(document).mousedown(function() {
        $(".shopping").stop().removeClass("shopping_on");
        $(".mod_shopping").stop().removeClass("sidebarBox");
        Divhover();
    })
    //右栏我浏览过弹出
    $(".mpbtn_read").click(function(){
        $(this).find(".read").stop().addClass("selected");
        $(this).parents(".fixed_sidebar").find(".mod_read").stop().addClass("sidebarBox");
        $(this).find("div").stop().removeClass("sidebar_box");
        $(this).unbind("hover");
    });
    $(".mod_read .close").click(function(){
        $(this).parents(".fixed_sidebar").find(".read").stop().removeClass("selected");
        $(this).parents(".fixed_sidebar").find(".mod_read").stop().removeClass("sidebarBox");
        Divhover();
    });
    $('.mod_read').mousedown(function(event) {
        event.stopPropagation();
    });
    $(document).mousedown(function() {
        $(".read").stop().removeClass("selected");
        $(".mod_read").stop().removeClass("sidebarBox");
        Divhover();
    })
    //
    $(".modBox_content li").hover(function(){
        $(this).find(".btn").show();
    },function(){
        $(this).find(".btn").hide();
    })

    //list价格选择
    $(".priceform .txt").click(function() {
        $(this).parent().find(".i").show();
        return false;
    })
    $("html").click(function() {
        $(".priceform .i").parent().find(".i").hide();
    });
    //list商品搜索选择
//    $(".type_order li").click(function(){
//        $(this).addClass('selected').siblings().removeClass('selected');
//        if ($(this).hasClass("selected")) {
//            $(this).find(".desc_only").addClass("up");
//        }
//    })
//    $(document).on("click", ".type_order li.selected", function(){
//        if ($(this).find(".desc_only").hasClass('down')) {
//            $(this).find(".desc_only").addClass('up').removeClass('down');
//        }else{
//            $(this).find(".desc_only").removeClass('up').addClass('down');
//        }
//    })

    //头部搜索
    $(".search-table .cur").click(function(){
        var ul = $(this).parent().find(".list");
        if(ul.css("display")=="none"){
            ul.slideDown();
        }else{
            ul.slideUp();
        }
    });
    $(".cur").click(function(){
        var _name = $(this).attr("name");
        if( $("[name="+_name+"]").length > 1 ){
            $("[name="+_name+"]").removeClass("select");
            $(this).addClass("select");
        } else {
            if( $(this).hasClass("select") ){
                $(this).removeClass("select");
            } else {
                $(this).addClass("select");
            }
        }
    });
    $(".search-table li").click(function(){
        var li=$(this).text(),
            search = $(this).parents(".search-table"),
            cur = search.find(".cur");
        cur.html(li);
        cur.attr("data-type", $(this).find("a").attr("data-type"));
        search.find(".list").hide();
        cur.removeClass("select");
    });
    //支付方式展开
    $('.togglecontent').click(function(){
        var tswitch = $(this),
            tget = tswitch.attr('data-target'),
            tsectxt = tswitch.attr('data-sec'),
            tdftxt = tswitch.attr('data-defualt'),
            tcon = $(this).attr('href');
        if (tswitch.children()) tswitch = tswitch.children();
        if (tcon && tcon.indexOf) {
            var tgitem = $(tcon);
            if (tgitem.css('display') =='none') {
                tgitem.slideDown();
                tswitch.text(tsectxt);
            } else {
                tgitem.slideUp();
                tswitch.text(tdftxt);
            }
        } else {
            $(this).next().slideToggle();
        }
        if ($(this).attr('href')) return false;
    });
    //end Toggle Content

    //飞到购物车效果
    $(".product_summary .btnCart").click(function(event){
        /*var t = event.timeStamp;
         var $startPosition = $(this),$targetPositon = $(".shopping s");
         var url = $("#preview img").attr("src");
         $("body").append('<div class="fly_item fly' + t + '" style="position: absolute;width: 30px;height: 30px;"><img width="100%" height="100%" src="' + url + '"/></div>');
         var num = parseInt($(".count_field input").val());
         var count = parseInt($("#shopCart span").text());
         count = count + num;
         //执行完成
         $("#shopCart span").text(count);
         var x1 = $startPosition.offset().left, y1 = $startPosition.offset().top;
         var x2 = $targetPositon.offset().left, y2 = $targetPositon.offset().top;
         fly($(".fly" + t),num,x1,x2,y1,y2);*/
    });
    function fly($elm,num,x1,x2,y1,y2){

        $elm.css({left: (x1 + 40),top: y1 - 30,opacity: 0}).animate({width: 30,height: 30,opacity: 1},100,function(){

            $(this).stop().css("border","2px solid #d91966").animate({top: y1-100,width: 50,height: 50},500,function(){
                $(this).stop().css("border","1px solid #d91966").animate({left: x2 + 0,top: y2 - 5,width:8,height:8},1000,function(){
                    $(this).fadeOut(200,function(){
                        $(this).remove();
                        $(".shopping .add_fly").stop().css("top","5px").fadeIn(200).text("+" + num).animate({top: "-30px",opacity:"1"},200,function(){
                            $(this).animate({top: "-40px",opacity:"0"}).fadeOut(200);
                        });
                    });
                });
            });

        });
    };
});


var ScreenCenterAlign = function(selector) {
    if (!selector) return;

    var divID = $(selector);
    var winHeight = $(window).height();
    var winWidth = $(window).width();
    var divHeight = divID.height();
    var divWidth = divID.width();
    var top = (winHeight - divHeight) / 2;
    var left = (winWidth - divWidth) / 2;
    divID.css({ top: top + "px", left: left + "px" });
}

//购物袋
SFM.ShoppCart = {
    init : function(){
        this.getCartInfo();
        this.delCartItem();
    },
    //获取购物车信息
    getCartInfo : function(){
        var _this = this;
        $.ajax({
            type: "get",
            dataType: "json",
            url: "/cart/newestCartItem?_" + new Date().getTime(),
            beforeSend: function(){
                SFM.TopCartViewRender.beforeSendAction();
                SFM.RightCartViewRender.beforeSendAction();
            },
            success: function(response){
                if(response.success){
                    if(response.data.cartVo != null && response.data.cartVo.cartItemVOs.length > 0){
                        SFM.TopCartViewRender.renderCartView(response);
                        SFM.RightCartViewRender.renderCartView(response);
                    }else{
                        SFM.TopCartViewRender.renderCartViewIfZero();
                        SFM.RightCartViewRender.renderCartViewIfZero();
                    }
                }else{
                    Commons.tip(response.msg);
                }
            }
        });
    },
    //删除
    delCartItem : function(){
        $(".mycart_popup").on("click",".delCartItem",function(){
            var itemId = $(this).data("id");
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/cartItem/" + itemId,
                success: function(response){
                    if(response.success){
                        Commons.tip("删除成功");
                        SFM.ShoppCart.getCartInfo();
                    }else{
                        Commons.tip(response.msg);
                    }
                }
            });
        });
        $(".mod_shopping").on("click",".delCartItem",function(){
            var itemId = $(this).data("id");
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/cartItem/" + itemId,
                success: function(response){
                    if(response.success){
                        Commons.tip("删除成功");
                        SFM.ShoppCart.getCartInfo();
                    }else{
                        Commons.tip(response.msg);
                    }
                }
            });
        });
    }
};



//右栏购物袋
SFM.RightCartViewRender = {
    renderCartView: function(response) {
        var count = response.data.cartVo.itemNum;

        $(".mpbtn_shopping").find(".cart_num").text(count);
		
        var html = '<div class="modBox_content"><ul></ul></div><div class="modBox_handler"><div class="inf clearfix"><span>数量共计：<em>' + count + '</em>件</span><span class="strong">￥' + response.data.cartVo.activityFee + '</span></div><a class="btn" title="去結算" href="/cart/list">去购物车结算</a></div>';

        $(".mod_shopping .modBox_mod").html(html);

        $.each(response.data.cartVo. cartItemVOs,function(i,product){
			var del = '';
			if(product.skuActivityFeeLong < product.skuTotalFeeLong){
				del = '<p><del class="price">￥' + product.skuPrice +'元&nbsp;×&nbsp;' + product.buyNum + '</del></p>';
			}
          	var li = '<li class="clearfix"><div class="pic"><a target="_blank" href="/product/' + product.productId + '"><img src="' + product.productImgUrl + '" alt="' + product.productName + '"></a></div><div class="desc"><h5><a class="a-black" href="/product/' + product.productId + '" title="'+product.productName+'">' + product.productName + '</a></h5>' + del + '<p><strong>￥' + product.skuActivityFee +'元</strong>&nbsp;×&nbsp;' + product.buyNum + '<a class="bluetit delCartItem" href="javascript:" data-id="' + product.id + '">[刪除]</a></p></div></li>';

          	$(".mod_shopping .modBox_content ul").append(li);

        });
    },
    renderCartViewIfZero: function() {
        $(".mpbtn_shopping").find(".cart_num").text(0);
    },
    beforeSendAction: function() {
        $(".mod_shopping .modBox_mod").html('<div class="mod_empty"><p>购物车为空</p><p>再去逛逛吧！</p></div>');
    }
};

//顶部购物袋
SFM.TopCartViewRender = {
    renderCartView: function(response) {
        var count = response.data.cartVo.itemNum;
        var activityFee = response.data.cartVo.activityFee;
        $(".bag-li .cart_hover").find("em").text(count);
        $(".bag-li .bag_precie").text( '￥'+ activityFee);
        var html = '<div class="mycart_box"><div class="relt clearfix"><p>数量共计：<i>' + count + '</i>件</p><p>金额共計：<strong class="price money">￥' + response.data.cartVo.activityFee + '</strong></p><a class="abs btn" title="去结算" href="/cart/list">去结算</a></div><ul class="list"></ul></div>';
        $(".mycart_popup").html(html);
        $.each(response.data.cartVo.cartItemVOs,function(i,product){
        	var del = '';
			if(product.skuActivityFeeLong < product.skuTotalFeeLong){
				del = '<p><del class="price">￥' + product.skuPrice +'元&nbsp;×&nbsp;' + product.buyNum + '</del></p>';
			}
            var li = '<li><div class="pic fl"><a target="_blank" href="/product/' + product.productId + '"><img src="' + product.productImgUrl + '" alt="' + product.productName + '"></a></div><div class="title fr"><p><a class="a-black" href="/product/' + product.productId + '" title="' + product.productName + '">' + product.productName + '</a></p><p><a style="color:#000" href="/product/' + product.productId + '">' + product.skuDesc + '</a></p>' + del + '<p class="other"><span class="money">￥' + product.skuActivityFee +'元</span>&nbsp;<i>×&nbsp;' + product.buyNum + '</i><a class="bluetit delCartItem" href="javascript:" data-id="' + product.id + '">[刪除]</a></p></div><div class="clear"></div></li>';
            
            $(".mycart_box .list").append(li);
        });
    },
    renderCartViewIfZero: function() {
        $(".bag-li .cart_hover").find("em").text(0);
        $(".bag-li .bag_precie").text( '￥0.00');
    },
    beforeSendAction: function() {
        $(".mycart_popup").html('<div class="tip">购物车暂无商品<br>快去挑选自己钟爱的商品吧~~</div>');
    }
};


SFM.LoginBox = {
    isLogin: false,
    init: function(){
        var $loginForm = $("#loginForm"),
        	$e_regForm = $("#e_userRegForm"),
        	$m_regForm = $("#m_userRegForm");
        this.bindClose($loginForm);
        this.blurForm($loginForm,$m_regForm);
        this.blurForm($loginForm,$e_regForm);

        this.bindLoginBtn($loginForm);
        this.bindRegBtn($m_regForm);
        this.bindRegBtn($e_regForm);
        this.bindTabs();

        this.bindGoReginPage($loginForm);
        this.bindGoLoginPage($m_regForm);
        this.bindGoLoginPage($e_regForm);
        this.bindRegisterFormEvents($m_regForm,"mobile");
        this.bindRegisterFormEvents($e_regForm,"email");
    },
    //打开
    open: function(){
        var $loginbox = $("#loginBox"),$loginbox_bg = $(".loginbox_bg");
        $loginbox.css("width",360).show();
        $loginbox_bg.show();
        $(".loginBox").css("left","0px").show();
        $(".reginBox").hide();
        $(".userRegForm")[0].reset();
        $(".userRegForm .errorMessage").hide();
        $(".userRegForm .info_wrong").hide();
        $('#loginForm .login_btn').unbind("dologin");
    },
    //关闭
    close: function(){
        var $loginbox = $("#loginBox"),$loginbox_bg = $(".loginbox_bg");
        $loginbox.hide();
        $loginbox_bg.hide();
    },
    //验证登录
    validatLoginForm: function($loginForm){
        var $userName = $loginForm.find("input[name='username']"),$password = $loginForm.find("input[name='password']");
        var _name = $userName.val(),_pwd = $password.val();
        var $nameTip = $loginForm.find(".name_error"),$pwdTip = $loginForm.find(".pwd_error");
        if(_name == ""){
            $nameTip.show().text("用户名不能为空");
            $userName.focus();
            return false;
        }else{
            $nameTip.hide();
        }
        if(_pwd == ""){
            $pwdTip.show().text("密码不能为空");
            $password.focus();
            return false;
        }else if(_pwd.length < 6 || _pwd.length > 16){
            $pwdTip.show().text("密码长度大于6位小于16位");
        }else{
            $pwdTip.hide();
        }
        return true;
    },
    //验证注册
    validatRegForm: function($reginForm){
        $reginForm.find("input").trigger("blur");
        return false;
    },
    //离开焦点
    blurForm: function($loginForm,$reginForm){
        var $userName = $loginForm.find("input[name='username']"),$password = $loginForm.find("input[name='password']");
        var $nameTip = $loginForm.find(".name_error"),$pwdTip = $loginForm.find(".pwd_error");
        var utils = new SFM.Utils();

        $userName.blur(function(){
            var _name = $(this).val();
            if(_name == ""){
                $nameTip.show().text("用户名不能为空");
            }else{
                $nameTip.hide();
            }
        });
        $password.blur(function(){
            var _pwd = $(this).val();
            if(_pwd == ""){
                $pwdTip.show().text("密码不能为空");
            }else if(_pwd.length < 6 || _pwd.length > 16){
                $pwdTip.show().text("密码长度大于6位小于16位");
            }else{
                $pwdTip.hide();
            }
        });
    },
    bindRegisterFormEvents : function(regForm,type) {
        var utils = SFM.Utils();
        regForm.find("input[name='username']").focus(function(){
            renderNormal($(this).parent());
        });

        regForm.find("input[name='username']").blur(function(){
            var userName = $(this).val();
            var $parent = $(this).parent();
            if(utils.isStringEmpty(userName)) {
                var errorMsg = (type == "mobile") ? "手机号不能为空" : "邮箱不能为空";
            	renderErrorMsg($parent, errorMsg);
            	return;
            }
            if(type == "mobile"){
                if(utils.validateMobile(userName)) {
                    var url = '/user/register/checkUserName';
                    var data = {username: userName};
                    checkAction(url, data, function() { renderLoading($parent); },function(response) {
                        if (response.success) {
                            renderSuccess($parent);    

                            //输入信息合法
                            $parent.find("input[name='username']").attr("data-status","1");
                        } else {
                            renderErrorMsg($parent, response.msg);
                        }
                    });
                } else {
                    var errorMsg = "手机号码格式不正确";  
                    renderErrorMsg($parent, errorMsg);
                    return;
                }
            }else{
                if(utils.validateEmail(userName)) {
                    var url = '/user/register/checkUserName';
                    var data = {username: userName};
                    checkAction(url, data, function() { renderLoading($parent); },function(response) {
                        if (response.success) {
                            renderSuccess($parent);    

                            //输入信息合法
                            $parent.find("input[name='username']").attr("data-status","1");
                        } else {
                            renderErrorMsg($parent, response.msg);
                        }
                    });
                } else {
                    var errorMsg = "邮箱格式不正确";  
                    renderErrorMsg($parent, errorMsg);
                    return;
                }
            }
        });

        //password focus + blur事件
        regForm.find("input[name='password']").focus(function() {
            renderNormal($(this).parent());
        });
        regForm.find("input[name='password']").blur(function(){
            var pwd = $.trim($(this).val());
            var $parent = $(this).parent();

            if (pwd.length >= 6 && pwd.length <= 16) {
                renderSuccess($parent);
                $(this).attr("data-status","1");
            } else {
                var errorMsg = "密码长度必须6到16位";
                renderErrorMsg($parent, errorMsg);
            }
        });
        //confirm password focus  + blur事件
        regForm.find("input[name='confirmPassword']").focus(function(){
            renderNormal($(this).parent());
        });
        regForm.find("input[name='confirmPassword']").blur(function(){
            var password = $.trim(regForm.find("input[name='password']").val());
            var confirmPassword = $.trim($(this).val());
            var $parent = $(this).parent();
			
            //alert("password:"+password+",confirmPassword:"+confirmPassword+","+(password == confirmPassword));
			if (confirmPassword.length >= 6 && confirmPassword.length <= 16) {
				if (password === confirmPassword) {
					renderSuccess($parent);
					$(this).attr("data-status",1);
				} else {
					var errorMsg = "密码不一致";
					renderErrorMsg($parent, errorMsg);
				}
			}else {
                var errorMsg = "密码长度必须6到16位";
                renderErrorMsg($parent, errorMsg);
            }
			
           
        });

        regForm.find("input[name='imageCode']").focus(function(){
            renderNormal($(this).parent());
        });

        regForm.find("input[name='imageCode']").blur(function(){
            var imageCode = $.trim($(this).val());
            var $parent = $(this).parent();

            var url = '/user/checkImageCode';
            var data = { imageCode: imageCode };
            checkAction(url, data, function() { renderLoading($parent); } , function(response) {
                if (response.success) {
                    renderSuccess($parent);    

                    //输入信息合法
                    $parent.find("input[name='imageCode']").attr("data-status",1);
                } else {
                    renderErrorMsg($parent, response.msg);
                }
            });
        });

        //校验码刷新
        regForm.find(".code-refresh").click(function() {
            var $parent = $(this).parent();
            refreshCode($parent);
        });
        regForm.find(".code-img").click(function() {
            var $parent = $(this).parent();
            refreshCode($parent);
        });

        function refreshCode($parent) {
            $parent.find("img").attr("src","");
            setTimeout(function() {
                $parent.find("img").attr("src","/user/imageCode?_"+new Date().getTime());
            },500);
        }


        function renderNormal($parent) {
            $parent.find("span").removeClass();
            $parent.find("span").hide();
            $parent.find(".errorMessage").hide();
            $parent.find("input").attr("data-status",0);
        }

        function renderLoading($parent) {
             var $span = $parent.find("span").removeClass();
            $span.show();
            $span.addClass("loading");
        }

        function renderSuccess($parent) {
            var $span = $parent.find("span").removeClass();
            $span.show();
            $span.addClass("info_right");
        }

        function renderErrorMsg($parent, errorMsg) {
            var $span = $parent.find("span").removeClass();
            $span.show();
            $span.addClass("info_wrong");

            $parent.find(".errorMessage").show();
            $parent.find(".errorMessage").html(errorMsg);
        }

        function checkAction(url, data, beforeSendFunction, callback) {
            var c = callback || function(){};
            $.ajax({
                url: url,
                data: data,
                type: 'POST',
                beforeSend: function() {
                    beforeSendFunction();
                },
                dataType: 'json',
                success : function(response) {
                    if(response.success){
                        c(response);
                    }else{
                        Commons.tip(response.msg);
                    }
                },
                error : function() {

                }
            });
        }
    },
    bindTabs: function(){
    	$(".reginBox").on("click",".form_tabs a",function(){
    		var form = $(this).attr("data-form");
    		$(".form_tabs a").removeClass("active");
    		$(this).addClass("active");
    		$(".reginBox .userRegForm").hide();
    		$("#" + form).fadeIn(200);
    	});
    },
    //绑定关闭
    bindClose: function($loginForm){
        $("#loginBox").on("click",".close",function(){
            SFM.LoginBox.close();
            $('#loginForm .login_btn').unbind("dologin");
        });
    },
    //登录按钮
    bindLoginBtn: function($loginForm){
        $loginForm.on("click",".login_btn",function(){
            if(SFM.LoginBox.validatLoginForm($loginForm)){
                var data = $loginForm.serialize();
                SFM.LoginBox.doLogin(data);
            }
        });
    },
    //注册按钮
    bindRegBtn: function($reginForm){
        //绑定注册按钮事件
        $reginForm.on("click",".btn-agree",function(){
            var $userName = $reginForm.find("input[name='username']");
            var $password = $reginForm.find("input[name='password']");
            var $confirmPassword = $reginForm.find("input[name='confirmPassword']");
            var $imageCode = $reginForm.find("input[name='imageCode']");
            $imageCode.attr("data-status","1");
            if ($userName.attr("data-status") != "1" ||
                $password.attr("data-status") != "1" ||
                $confirmPassword.attr("data-status") != "1" ||
                $imageCode.attr("data-status") != "1" ) {
                SFM.LoginBox.validatRegForm($reginForm);
            }else{
                var data = $reginForm.serialize();
                debugger
                var username = $userName.val();
                var pwd = $password.val();
                SFM.LoginBox.doReg(data,function(){
                    $(".reginBox .link_login").trigger("click");
                    $("#loginForm input[name='username']").val(username);
                    $("#loginForm input[name='password']").val(pwd);
                    $("#loginForm .login_btn").trigger("click");
                });
            }
        });
        
	
        $reginForm.find(".search-table li").click(function(){
	        var li = $(this).text(),
		        type = $(this).find("a").attr("data-type");
	        $reginForm.find(".search-table .cur").html(li);
	        $reginForm.find(".search-table .cur").attr("data-type", type);
	        $reginForm.find(".search-table .list").hide();
	        $(".cur").removeClass("select");
        	$reginForm.find("input[name='countryCode']").val(type);
        });
    },
    //登录
    doLogin: function(data){
        $.ajax({
//            url:"https://login.vmei.com/user/login",
            url:"/login",
            type: 'POST',
            dataType: "json",
            data: data,
            success: function(response) {
                if(response.success){
                    SFM.Stats().upload(16, response.data.uid);
                    SFM.LoginBox.close();
                    Commons.tip("登录成功");
                    SFM.LoginBox.isLogin = true;
                    SFM.LoginBox.replaceLogin(response.data.userNick);
                    $('#loginForm .login_btn').trigger("dologin",true);
                }else{
                    Commons.tip(response.msg);
                }
            }
        });
    },
    replaceLogin: function(userNick){
        var html = '<li><ul><li class="clearfix">您好，' + userNick + '</li><li class="line"><span>|</span></li></ul></li><li class="mod_hover"><a class="my" href="/my/account">我的帐户<i class="arrow"></i></a><ul class="pull_list"><li><a href="/my/point">我的积分</a></li><li><a href="/my/order">我的订单</a></li><li><a href="/my/valuation">我的评论</a></li><li><a href="/my/affiliate">我的分成</a></li><li><a href="/user/logout">退出</a></li></ul></li><li class="line"><span>|</span></li><li><a href="#" title="积分兑换">积分兑换</a></li><li class="line"><span>|</span></li><li><a href="#" title="我要推荐">我要推荐</a></li><li class="line"><span>|</span></li>';
        $(".topbar_right .login_warp").replaceWith(html);
        SFM.ShoppCart.getCartInfo();
        //header头部弹出层效果
        $(".mod_hover").hover(function(){
            $(this).addClass("hover_on");
        },function(){
            $(this).removeClass("hover_on");
        });

    },
    //注册
    doReg: function(data,callback){
        var c = callback || function(){};
        $.ajax({
            url:"/register?ajax=true",
            type: 'POST',
            dataType: "json",
            data: data,
            success: function(response) {
                if(response.success){
                    SFM.Stats().upload(15, response.data.uid);
                    Commons.tip("注册成功");
                    c();
                }else{
                    Commons.tip(response.msg);
                }
            }
        });
    },
    //跳转注册
    bindGoReginPage: function($loginForm){
        $loginForm.on("click",".link_regin",function(){
            $(".loginBox").css("left", "0px").fadeOut(200, function () {
                $(this).css("left", "500px");
                $("#loginBox .hd h4").text("注册");
                $("#loginBox").animate({"width": 480,"margin-top": "-240px","margin-left": "-240px"},200);
                $(".reginBox").show().animate({left: 0}, 300);
                
                $(".reginBox .code-img").attr("src","/user/imageCode?_"+new Date().getTime());
            });
        });
    },
    //跳转登录
    bindGoLoginPage: function($reginForm){
        $reginForm.on("click",".link_login",function(){
            $(".reginBox").css("left", "0px").fadeOut(200, function () {
                $(this).css("left", "500px");
                $("#loginBox .hd h4").text("登录");
                $("#loginBox").animate({"width": 360,"margin-top": "-160px","margin-left": "-190px"},200);
                $(".loginBox").show().animate({left: 0}, 300);
            });
        });
    }
};




//list筛选
$(window).load(function() {
    SFM.LoginBox.init();
    SFM.ShoppCart.init();

    $(".filter_attrs").each(function() {
        if ($(this).outerHeight() >= 70) {
            var filterListHeight = $(this).outerHeight();
            if (filterListHeight == 70) {
                $(this).parent().find(".showMore").hide();
            } else {
                $(this).parent().find(".showMore").show();
            }
            $(this).css('height', 70);
            $(this).parent().css("height","70px");
        }
        var moreLink = $(this).next('.showMore');
        moreLink.attr("data-filter-length",filterListHeight+"px");
        moreLink.click(function() {
            if($(this).parent().find('ul').hasClass("filter_on")){
                $(this).parent().find('ul').removeClass("filter_on").css({height: "70px"});
                $(this).parent().css({height: "70px"});
                $(this).text("展开>>");
            }else{
                var height = $(this).attr("data-filter-length");

                $(this).prev('ul').addClass("filter_on").css('height', height);
                $(this).parent().css('height',height);
                $(this).text("<<收起");
            }
        });
    });
    //
});

//daluzai-1.3 page加入购物车弹出插件
function getBrowser(get_ver){var get_borwser=navigator.userAgent;var res='unknow';var ver='unknow';var is_ie=get_borwser.indexOf('MSIE');var is_firefox=get_borwser.indexOf('Firefox');var is_opera=get_borwser.indexOf('Opera');var is_chrome=get_borwser.indexOf('Chrome');var is_safari=get_borwser.indexOf('Safari');if(is_ie!==-1){res='ie';}
else if(is_firefox!==-1){res='firefox'}
else if(is_opera!==-1){res='opera'}
else if(is_chrome!==-1){res='chrome'}
else if(is_safari!==-1){res='safari'}
    if(get_ver===true){if(res=='ie'){ver=parseFloat(get_borwser.substring(is_ie+5,get_borwser.indexOf(";",is_ie)));}else{var explode=get_borwser.split("/");ver=parseFloat(explode[3]);}
        res=res+ver}
    return res;}
function getRandom(countRandom){var res=Math.round(Math.random()*countRandom);return res;}
var moveAlertBox=function(get_id,obj_expired,timed,type){var set_id=get_id;var e=obj_expired;var t=timed;var k;var c=0;if(type==0){move='width';}else{move='height';}
    this.show=function(){$('#'+set_id).css('display','block');k=setInterval(show_event,17);}
    this.hide=function(){$('#'+set_id).bind("click",function(){k=setInterval(hide_event,17);})}
    function guideFun(get_obj,i){guide_obj.attr('className',guide_hideStyle);get_obj.attr('className',guide_showStyle);main_obj.css('display','none');main_obj.attr('className',main_hideStyle);main_obj.each(function(j){if(j==i){$(this).fadeIn(300,function(){$(this).attr('className',main_showStyle);})}})}}
var outBox=function(box_Id){var rand_num=getRandom(1000);var get_browser=getBrowser(true);var mask_case='mask_case_for_daluzai'+rand_num;var mask_obj=new mask(mask_case);var ww=$(document).width();var wh=$(document).height();var gw=$(window).width();var gh=$(window).height();this.openBox=function(box_show_style,mask_style,is_center){$('#'+box_Id).fadeIn(600,function(){$(this).attr('className',box_show_style);})
    mask_obj.addMask(mask_style);if(is_center===true){var bw=(gw/2)-$('#'+box_Id).width()/2;var bh=(gh/2)-$('#'+box_Id).height()/2;$('#'+box_Id).css({'top':bh,'left':bw});if(get_browser==='ie6'){var is_position='absolute';}else{var is_position='fixed';}}
    $('#'+box_Id).css({'position':is_position,'z-index':1000});$('#'+mask_case).click(function(){quitBox_event();})}
    this.quitBox=function(){quitBox_event();}
    function quitBox_event(){$('#'+box_Id).fadeOut(600,function(){mask_obj.delMask();})}}
var onEnterFrame=function(){var key;var events;this.startFlash=function(fn){events=fn;key=setInterval(fnFlash,1);}
    this.endFlash=function(){stopFlash();}
    function stopFlash(){if(typeof(key)=='undefined'){alert('Can not find key!');}else{clearInterval(key);}}
    function fnFlash(){eval(events);}}
var mask=function(mask_case){this.addMask=function(mask_style){$(document.body).append('<div id="'+mask_case+'"></div>');var ww=$(document).width();var wh=$(document).height();var gw=$(window).width();var gh=$(window).height();$('#'+mask_case).css({'width':'100%','height':wh,'position':'absolute','z-index':999,'top':0,'left':0});if(mask_style!==''&&mask_style!=='undefined'){$('#'+mask_case).addClass(mask_style);}}
    this.delMask=function(){$('#'+mask_case).fadeOut(600,function(){$(this).empty().remove();})}};