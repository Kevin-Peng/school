try {
    SFM.Stats().init("from_b2c");
    SFM.PageLoad().updatePageLoadEndTimestamp();

    SFM.Stats().upload(30,url('path'));
    if (url('path') === '/') {
        SFM.Stats().upload(40,null);
    }
    //test
}catch(e) {
    console.log(e);
}
$(function() {
    var footEvent = (function(root) {
        root.list = {
            init:function(){
                this.nav();
                this.other();
            },
           nav : function(){
                var timer = "";
                var _topNav =$(".topNav");
                var _topNavLi =_topNav.find(" > ul > li");
                if(_topNavLi.size()==0){
                	$(".naviSecond").hide();
                	return;
                }
                if(_topNavLi.find("div.L2").size()==0){
                	//循环往第一级导航追加第二级内容
                	_topNavLi.each(function() {
                        var _this = $(this);
                        var _tag =_this.attr("class");
                        _this.append($("#"+_tag).html());
                        $("#"+_tag).remove();
                    });
                	$(".naviSecond").hide();
                }else{
                	$(".naviSecond").remove();
                }
                
                var _bd = $(".topNav .brandAll");
                _topNavLi.hover(function(){
                	var _this=$(this);
                	if(_topNav.hasClass("navDelay")){
                		timer = setTimeout(function(){
                			_this.addClass("liHover");
                			_topNav.removeClass("navDelay");
                		},100);
                	}else{
                		_this.addClass("liHover");
                		_topNav.removeClass("navDelay");
                	}
                },function(){
                	var _this=$(this);
                	_this.removeClass("liHover");
                	clearTimeout(timer);
                	_bd.find(".col:first-child").addClass("sign").siblings().removeClass('sign');
                	_bd.siblings(".brandcont").hide().siblings(".brandHot").show();
                	
                });
                
                _bd.on('click', 'span', function(){
                	var _this = $(this);
                	var _tags = _this.attr('data-tag');
                	_this.addClass('sign').siblings().removeClass('sign');
                	$("."+_tags).show().siblings('.brandcont').hide();
                });
               
                _topNav.mouseleave(function(){
                    $(this).addClass("navDelay");
                });
                
            },
            other : function(){
                //-------app下载宣传banner------------------
                //if ($('.mod_appbanner').length == 0) return;

                //if (commonStart.ua(/iPhone|iPad/)) {
                if ($.cookie && $.cookie('VMEIappbannerState') == 'hide') {
                    hideBanner($('.mod_appbanner .float_close'));
                    $('.closed').hide();
                }
                // show app banner mod
                $('.mod_appbanner').removeAttr('style');
                //}


                $('.mod_appbanner .float_close').on('click', function() {
                    hideBanner($(this));
                });

                $('.open_appbanner').on('click', function() {
                    $(this).removeClass('active');
                    $(this).parent().find('.closed').show();

                    if ($.cookie && $.cookie('VMEIappbannerState')) {
                        $.cookie('VMEIappbannerState', null);
                    }
                });

                function hideBanner(control) {
                    // control.parent().slideUp().addClass('closed');
                    control.parent().parent().prev('.open_appbanner').addClass('active');
                    control.parents(".mod_appbanner").find(".closed").hide();

                    if ($.cookie) {
                        $.cookie('VMEIappbannerState', "hide", {expires: 30});
                    }
                }
            }
        }
        return root

    }(footEvent || {}))

    footEvent.list.init();
});