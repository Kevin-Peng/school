(function(){
    SFM = (typeof window.SFM === "undefined") ? {} : window.SFM;
    SFM.Money = function() {
        var Utils = SFM.Utils();
        return {
            getMoney: function(money, point) {
                if(point == undefined) {
                    point = 2;
                }
                return Utils.getNumber(money).toFixed(point);
            }
        }
    },
    SFM.Utils = function() {
        var validationUtils = {
            validateEmail : function(_s) {
                var emailRegex = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                return emailRegex.test(_s);
            },
            validateMobile : function(_s) {
                var hkMobileRegex = /(^5|^6|^8|^9)[0-9]{7}$/;
                //var mainlandMobileRegex = /^1(3[0-9]|5[0-35-9]|8[0236-9]|14[57])[0-9]{8}$/;
                //弱化手机号码匹配,保证11位号码即可
                var mainlandMobileRegex = /^1[0-9]{10}$/;
                return mainlandMobileRegex.test(_s) || hkMobileRegex.test(_s);
            },
            validatePostCode : function(_s){
                /*var postCode= /^[1-9][0-9]{5}$/;
                return postCode.test(_s);*/
                return true;
            },
            validateInteger : function(_s) {
                return typeof _s === 'number' && _s%1 === 0
            },
            isNumbers : function(str){
            	return /^[0-9]*$/.test(str);
            },
            isShortNumber: function(str){
            	return /^[0-9]{4,6}-[0-9]+$/.test(str);
            }
        };

        var stringUtils = {
            isStringEmpty : function(_s) {
                if(typeof _s === 'undefined' || _s == null || _s == '') {
                    return true;
                } else {
                    return false;
                }
            }
        };

        var NumberUtils = {
            getNumber: function(num) {
                if(num === undefined || num === '') {
                    return 0;
                }
                num = Number(num);
                if(isNaN(num)) {
                    return 0;
                }
                return num;
            }
        };


        return {
            validateEmail : validationUtils.validateEmail,
            validateMobile : validationUtils.validateMobile,
            isStringEmpty : stringUtils.isStringEmpty,
            validateInteger : validationUtils.validateInteger,
            validatePostCode : validationUtils.validatePostCode,
            getNumber : NumberUtils.getNumber,
            isNumbers: validationUtils.isNumbers,
            isShortNumber: validationUtils.isShortNumber
        };
    };

    SFM.DateUtils = function(){
        var DateFormat = {
            dateFormat: function(w, r, a) {
                var c = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
                p = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
                v = /[^-+\dA-Z]/g,
                t = function(m, d) {
                    m = String(m);
                    d = d || 2;
                    while (m.length < d) {
                        m = "0" + m;
                    }
                    return m;
                };
                if (arguments.length == 1 && Object.prototype.toString.call(w) == "[object String]" && !/\d/.test(w)) {
                    r = w;
                    w = undefined;
                }
                w = w ? new Date(w) : new Date;
                if (isNaN(w)) {
                    throw SyntaxError("invalid date");
                }
                r = String(this.masks[r] || r || this.masks["default"]);
                if (r.slice(0, 4) == "UTC:") {
                    r = r.slice(4);
                    a = true;
                }
                var x = a ? "getUTC": "get",
                u = w[x + "Date"](),
                l = w[x + "Day"](),
                q = w[x + "Month"](),
                g = w[x + "FullYear"](),
                h = w[x + "Hours"](),
                e = w[x + "Minutes"](),
                j = w[x + "Seconds"](),
                f = w[x + "Milliseconds"](),
                n = a ? 0 : w.getTimezoneOffset(),
                b = {
                    d: u,
                    dd: t(u),
                    ddd: this.i18n.dayNames[l],
                    dddd: this.i18n.dayNames[l + 7],
                    m: q + 1,
                    mm: t(q + 1),
                    mmm: this.i18n.monthNames[q],
                    mmmm: this.i18n.monthNames[q + 12],
                    yy: String(g).slice(2),
                    yyyy: g,
                    h: h % 12 || 12,
                    hh: t(h % 12 || 12),
                    H: h,
                    HH: t(h),
                    M: e,
                    MM: t(e),
                    s: j,
                    ss: t(j),
                    l: t(f, 3),
                    L: t(f > 99 ? Math.round(f / 10) : f),
                    t: h < 12 ? "a": "p",
                    tt: h < 12 ? "am": "pm",
                    T: h < 12 ? "A": "P",
                    TT: h < 12 ? "AM": "PM",
                    Z: a ? "UTC": (String(w).match(p) || [""]).pop().replace(v, ""),
                    o: (n > 0 ? "-": "+") + t(Math.floor(Math.abs(n) / 60) * 100 + Math.abs(n) % 60, 4),
                    S: ["th", "st", "nd", "rd"][u % 10 > 3 ? 0 : (u % 100 - u % 10 != 10) * u % 10]
                };
                return r.replace(c,
                function(d) {
                    return d in b ? b[d] : d.slice(1, d.length - 1);
                });
            },
            masks: {
                "default": "ddd mmm dd yyyy HH:MM:ss",
                shortDate: "m/d/yy",
                mediumDate: "mmm d, yyyy",
                longDate: "mmmm d, yyyy",
                fullDate: "dddd, mmmm d, yyyy",
                shortTime: "h:MM TT",
                mediumTime: "h:MM:ss TT",
                longTime: "h:MM:ss TT Z",
                isoDate: "yyyy-mm-dd",
                isoTime: "HH:MM:ss",
                isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
                isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
            },
            i18n: {
                dayNames: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"],
                monthNames: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
            },
            parse: function(a) {
                if (typeof a !== "string" || !a.isNotBlank()) {
                    return null;
                }
                return new Date(Date.parse(a.replace(/-/g, "/")));
            },
            getIntervalTime: function(timestamp) {
                var currTimeStamp = (new Date()).getTime();
                var intervalTimeStamp = currTimeStamp - timestamp;
                var hourForOneDay = 24;  //一天24小时
                var mintuesForOneHour = 60; //一小时60分钟 
                var secondsForOneMinute = 60; //一分钟60秒
                var millisecondsForOneSecond = 1000; //1秒1000毫秒

                //24个小时以内的， 显示小时
                //24小时到72小时，显示天
                //72小时以上, 显示日期
                var oneDayInterval = hourForOneDay * mintuesForOneHour * secondsForOneMinute * millisecondsForOneSecond;

                var millisecondsForOneHour = mintuesForOneHour * secondsForOneMinute * millisecondsForOneSecond
                if (intervalTimeStamp >0 && intervalTimeStamp < (oneDayInterval/24)) {
                    //return Math.round(intervalTimeStamp/ (millisecondsForOneHour/60) ) + "分以前";
                    return "刚刚";
                }
                else if(intervalTimeStamp > 0 && intervalTimeStamp < oneDayInterval ) {
                    return Math.round(intervalTimeStamp/ millisecondsForOneHour) + "小时前";

                } else if(intervalTimeStamp > oneDayInterval && intervalTimeStamp < 7 * oneDayInterval) {

                    return Math.round(intervalTimeStamp/ (hourForOneDay * millisecondsForOneHour) ) + "天之前";

                } else if(intervalTimeStamp >= 7 * oneDayInterval && intervalTimeStamp <= 30 * oneDayInterval) {

                    return "1星期之前";

                } else {
                    //return DateFormat.dateFormat(timestamp, "yyyy-mm-dd");
                    return "1个月之前";
                }
            }
        };
        
        return {
            timestamp : function(dt) {return DateFormat.dateFormat(dt, "yyyymmddHHMMss");},
            format: function(dt, a, b) {return DateFormat.dateFormat(dt, a, b)},
            getIntervalTime: function(t) {return DateFormat.getIntervalTime(t);}
        };
    };

    SFM.Constant = function() {
        return {
            encode: function(a) {
                return encodeURIComponent(a);
            },
            decode: function(a) {
                return decodeURIComponent(a);
            }
        }
        
    };

    SFM.CookieUtils = function() {
        return {
            getCookieValue: function(b) {
                var a = document.cookie.indexOf(";", b);
                if (a == -1) {
                    a = document.cookie.length;
                }
                return SFM.Constant().decode(document.cookie.substring(b, a));
            },
            getCookie: function(d) {
                var b = d + "=";
                var f = b.length;
                var a = document.cookie.length;
                var e = 0;
                while (e < a) {
                    var c = e + f;
                    if (document.cookie.substring(e, c) == b) {
                        return this.getCookieValue(c);
                    }
                    e = document.cookie.indexOf(" ", e) + 1;
                    if (e == 0) {
                        break;
                    }
                }
                return null;
            },
            getExpires: function(b) {
                var a = new Date();
                a.setTime(a.getTime() + b);
                return a;
            },
            deleteCookie: function(a) {
                this.setCookie(a, "", 0, "/");
            },
            setCookie: function(c, d, b, p) {
                var a = document.domain;
                var d = c + "=" + SFM.Constant().encode(d) + "; domain=" + a + ";path="+p;
                if (b > 0) {
                    d += " expires=" + this.getExpires(b).toGMTString();
                }
                document.cookie = d;
            }
        }
    }
    /*
    * 消息选择框
    */
    SFM.MsgBox = function (title, msg, callback) {
        var t = title || "";
        var m = msg || "";
        var c = callback || function(){};
        var html = '<div class="msgbox_bg"></div>\
                    <div class="msgbox">\
                        <div class="msgbox_head"><h3 class="head_title">' + t + '</h3><a class="msgbox_close" href="javascript:;" title="关闭">X</a></div>\
                        <div class="msgbox_content">' + m + '</div>\
                        <div class="msgbox_footer">\
                            <button class="all_btn msgbox_no">取消</button>\
                            <button class="all_btn msgbox_yes">确认</button>\
                        </div>\
                    </div>';
        if($(".msgbox").length <= 0){ $("body").append(html); }
        var $msgbox = $(".msgbox"),$msgbox_bg = $(".msgbox_bg");
        $msgbox.fadeIn(200);
        
        $(".msgbox").on("click",".msgbox_close",function(){
            close();
        });
        $(".msgbox").on("click",".msgbox_no",function(){
            c(false);
            close();
        });
        $(".msgbox").on("click",".msgbox_yes",function(){
            c(true);
            close();
        });
        
        function close(){
            $msgbox.fadeOut(200,function(){$msgbox.remove();});
            $msgbox_bg.fadeOut(200,function(){$msgbox_bg.remove();});
        }
        
    };
    
    /*
    * 信息提示框
    * icon success,fail,tip,warn
    */
    SFM.TipBox = function(content, icon, callback){
        var icon = icon || "tip";
        var content = content || "";
        var c = callback || function(that){};
        var html = '<div class="tipbox">\
                        <div class="tipbox_main"><span class="tipbox_icon ' + icon + '"></span><div class="tipbox_content">' + content + '</div></div>\
                    </div>';
        if($(".tipbox").length <= 0){ $("body").append(html); }
        var $tipbox = $(".tipbox");
        $tipbox.stop(true).fadeIn(200,function(){ 
            var $that = $(this);
            c($that);
            $that.delay(2000).fadeOut(200,function(){
                c($that);
            });
        });
        
    };
    
    /*
    * 请求提示框
    * 
    */
    SFM.RequestBox = function(title,flag){
        var title = title != null ? title : "正在请求，请稍等...";
        var flag = flag != null ? "show" : "hide";
        var html = '<div class="requestbox_bg"></div>\
                    <div class="requestbox">\
                        <div class="requestbox_main"><span class="requestbox_icon loading"></span><div class="requestbox_content">' + title + '</div></div>\
                    </div>';
        if($(".requestbox").length <= 0){ $("body").append(html); }
        var $requestbox = $(".requestbox"),$requestbox_bg = $(".requestbox_bg");
        function show(){
            $requestbox.fadeIn(200);
            $requestbox_bg.fadeIn(200);
        }
        function hide(){
            $requestbox.fadeOut(200);
            $requestbox_bg.fadeOut(200);
        }
        $requestbox_bg.unbind("click").click(function(){
            hide();
        });
        
        if(flag == "hide"){
            hide();
        }else if(flag == "show"){
            show();
        }
        return $requestbox;
    };
    
    /*
    * 获取省市区
    */
    SFM.AddressUtil = {
        init: function($select0,$select1,$select2,$select3){
            SFM.AddressUtil.loadCountry($select0);
            $select0.change(function(){
                var currVal = $(this).val();
                if(currVal != 0){
                    SFM.AddressUtil.loadProvinces(currVal,$select1);
                }else{
                    $select1.html('<option value="0">省份</option>');
                    $select2.html('<option value="0">直辖市</option>');
                    $select3.html('<option value="0">区/县</option>');
                }
            });
            $select1.change(function(){
                var currVal = $(this).val();
                if(currVal != 0){
                    SFM.AddressUtil.loadCities(currVal,$select2);
                }else{
                    $select2.html('<option value="0">直辖市</option>');
                    $select3.html('<option value="0">区/县</option>');
                }
            });
            $select2.change(function(){
                var currVal = $(this).val();
                if(currVal != 0){
                    SFM.AddressUtil.loadDistricts(currVal,$select3);
                }else{
                    $select3.html('<option value="0">区/县</option>');
                }
            });
        },
        reload: function($select0,$select1,$select2,$select3,$address) {
            SFM.AddressUtil.loadCountry($select0);
            SFM.AddressUtil.loadProvinces($address.countryId, $select1);
            SFM.AddressUtil.loadCities($address.provinceId, $select2);
            SFM.AddressUtil.loadDistricts($address.cityId, $select3);

            $select0.find('option[value=' + $address.countryId + ']').attr("selected","selected");
            $select1.find('option[value=' + $address.provinceId + ']').attr("selected","selected");
            $select2.find('option[value=' + $address.cityId + ']').attr("selected","selected");
            $select3.find('option[value=' + $address.districtId + ']').attr("selected","selected");

        },
        getFullAddress : function($select0,$select1,$select2,$select3,$location){
            var fullVal = $select0.find("option:selected").text() + "," + $select1.find("option:selected").text() + "," + $select2.find("option:selected").text() + "," + $select3.find("option:selected").text() + "," + $location.val();
            return fullVal;
        },
        //加载国家信息
        loadCountry : function($select0){
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/address/countries/",
                async: false,
                beforeSend: function(xhr){
                    $select0.html('<option value="0">国家/地区</option>');
                },
                success: function(response){
                    $.each(response.data,function(i,country){
                        $select0.append('<option value="' + country.id + '">' + country.name + '</option>');
                    });
                },
                error: function(XMLHttpRequest,textStatus, errorThrown){
                    console.error("错误信息： -----------" + textStatus);
                }
            });
        },
        //加载省份信息
        loadProvinces : function(countryId,$select1){
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/address/provinces/" + countryId,
                async: false,
                beforeSend: function(xhr){
                    $select1.html('<option value="0">省份</option>');
                },
                success: function(response){
                    $.each(response.data,function(i,province){
                        $select1.append('<option value="' + province.id + '">' + province.name + '</option>');
                    });
                },
                error: function(XMLHttpRequest,textStatus, errorThrown){
                    console.error("错误信息： -----------" + textStatus);
                }
            });
        },
        //加载城市信息
        loadCities : function(provinceId,$select2){
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/address/cities/" + provinceId,
                async: false,
                beforeSend: function(xhr){
                    $select2.html('<option value="0">直辖市</option>');
                },
                success: function(response){
                    $.each(response.data,function(i,city){
                        $select2.prop("disabled","").append('<option value="' + city.id + '">' + city.name + '</option>');
                    });
                },
                error: function(XMLHttpRequest,textStatus, errorThrown){
                    console.error("错误信息： -----------" + textStatus);
                }
            });
        },
        //加载地区信息
        loadDistricts : function(cityId,$select3){
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/address/districts/" + cityId,
                async: false,
                beforeSend: function(xhr){
                    $select3.html('<option value="0">区/县</option>');
                },
                success: function(response){
                    $.each(response.data,function(i,district){
                        $select3.prop("disabled","").append('<option value="' + district.id + '">' + district.name + '</option>');
                    });
                },
                error: function(XMLHttpRequest,textStatus, errorThrown){
                    console.error("错误信息： -----------" + textStatus);
                }
            });
        }
    };
    
    SFM.Browser={ 
		versions:function(){ 
			var u = navigator.userAgent, app = navigator.appVersion; 
			return {//移动终端浏览器版本信息 
				trident: u.indexOf('Trident') > -1, //IE内核 
				presto: u.indexOf('Presto') > -1, //opera内核 
				webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核 
				gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核 
				mobile: !!u.match(/AppleWebKit.*Mobile.*/)||!!u.match(/AppleWebKit/), //是否为移动终端 
				ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端 
				android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器 
				iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1, //是否为iPhone或者QQ HD浏览器 
				WindowsPhone: u.indexOf('Windows Phone') > -1, //是否为Windows Phone 
				iPad: u.indexOf('iPad') > -1 //是否iPad 
			}; 
		}(), 
		language:(navigator.browserLanguage || navigator.language).toLowerCase() 
	} 
    
})(this);
