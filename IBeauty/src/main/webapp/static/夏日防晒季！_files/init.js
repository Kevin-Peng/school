	var winWidth = document.documentElement.clientWidth;
    var htmlWidth = (winWidth / 320) * 10;
    if (htmlWidth > 20) {
        htmlWidth = 20;
    }
    document.documentElement.style.fontSize = htmlWidth + "px";
    
	if ((window.location.search).indexOf('ios') != -1) {
		var tagBody = document.getElementsByTagName('html')[0];
		if (tagBody.className.indexOf('inIOS') == -1) {
			tagBody.className += ' inIOS';
		}
	}
	var xieyi = "http";
	if(document.location.origin.indexOf("https")!=-1){
		xieyi =  "https";
	}
	systemDomain = xieyi+'://m.vmei.com';
	(function() {
		SFM = (typeof window.SFM === "undefined") ? {} : window.SFM;
		//记录当前页的起始时间点
		var pageLoadStartTimestamp = 0;
		//记录当前页的结束时间点
		var pageLoadEndTimestamp = 0;
		SFM.PageLoad = function() {
			return {
				init: init,
				getPageLoadStartTimestamp: function() {
					return pageLoadStartTimestamp;
				},
				getPageLoadEndTimestamp: function() {
					return pageLoadEndTimestamp;
				},
				updatePageLoadEndTimestamp: function() {
					pageLoadEndTimestamp = (new Date()).getTime();
				},
				getPageLoadTimestamp: function() {
					return pageLoadEndTimestamp - pageLoadStartTimestamp;
				}
			};

			function init() {
				try {
					pageLoadStartTimestamp = (new Date()).getTime();
				} catch (e) {
					console.log(e);
				}
			}
		}
		SFM.PageLoad().init();
	})();
	(function() {
		SFM = (typeof window.SFM === undefined) ? {} : window.SFM;
		var coinSymbol = {
			"zh_cn": "￥",
			"zh_CN": "￥",
			"zh_hk": "HK$",
			"zh_HK": "HK$",
			"en_us": "$",
			"en_US": "$"
		};
		SFM.Config = function() {
			init();
			return {
				getStatsUrl: function() {
					return xieyi+"://data.vmei.com/data.do";
				},
				getUid: function() {
					return "0";
				},
				getCoinSymbol: function(locale) {
					for (var key in coinSymbol) {
						if (key.toLowerCase() === locale.toLowerCase()) {
							return coinSymbol[key];
						}
					}
					return "￥";
				}
			};
		};

		function init() {
			document.domain = "vmei.com";
		}
	})();
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?990293285f57d659a7c6de476542d495";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();

    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
