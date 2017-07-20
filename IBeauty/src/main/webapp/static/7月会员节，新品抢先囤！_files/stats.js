/**
* js统计上报数据到分析系说明:
*  1. 功能说明:
*      分两类数据上报，一类是用户会话公用数据上报(当会话过期或者定期上报数据到数据分析系统),一类是用户业务数据上报
*  2. 使用说明:
*      依赖组件: sfm/0.1/util.js, sfm/0.1/pageload.js
*      第一步: 在页面头部引入pageload.js文件用于记录页面起始加载时间点,
*      第二步: 在页面尾部引入util.js和stats.js,在并增加:
*      <script type="text/javascript">
*        try {
*            SFM.Stats().init("from_b2c");  微信传字符串 from_wechat
*            SFM.PageLoad().updatePageLoadEndTimestamp();

*            //test
*            //SFM.Stats().initTest();
*        } catch (e) {
*             console.log(e);
*        }
*        </script>
*      第三步: 在具体的业务场景当中调用api, 比如：搜索时,调用SFM.Stats().upload(2, "雅诗兰黛") 
*             调用SFM.Stats().upload(3,"1234,2343"): 类目属性过滤时上报数据        
*      具体参数见下表:
*      上报数据类型           说明                                参数
*       1                   类目搜索时候上报数据,                  1,categoryId(int类型)
*       2                   关键字搜索时候上报数据                  2,searchKey,categoryId(string类型)
*       3                   类目属性过滤时候上报数据                3,pidvids(字符串)(比如: 参数pv值),categoryId, searchKey
*       10                  点击商品详情时候上报数据                10,productId(int类型) 
*       11                  收藏商品时候上报数据                   11,productId(int类型)
*       12                  添加到购物车时候上报数据                12,productId, skuIds(逗号分隔),buyNum(比如： 12,32)
*       13                  提交订单时候上报数据                   13,orderId, productIds(逗号分隔)(比如： 12,32), skuIds(逗号分隔)(比如： 12,32), sales
*       14                  支付时候上报数据                      14,orderId(订单号), payType(支付类型), paySum(支付总金额),productIds, skuIds
*       15                  注册成功时候上报数据                   15,uid(用户id)
*       16                  登录成功时候上报数据                   16,uid(用户id)
*
*       20                  分享上报数据                          20,productId,uskey
*       30                  所有页面上报数据 
*       40                  主页上报数据
*       50                  APP下载中转页                         50,source,type,flag(均为string类型)
*       99                  自定义
*/

;(function(){
    SFM = (typeof window.SFM === "undefined") ? {} : window.SFM;

    var pageLoadEndTimestamp = 0;
    var runSource = "";

    SFM.Stats = function () {
        return {
            //微信使用from_wechat,商城from_b2c,app是from_app
            init : function(rs) { 
                runSource = typeof rs === "undefined" ?  "from_b2c" : rs;
                uploader.checkSessionData(runSource); 
            },
            getActType : function() { return StatsActType; },
            upload: function() { 
                try {
                    uploader.upload.apply(this, arguments); 
                } catch(e) {
                    console.log(e);
                }
                
            },
            initTest : function() {uploaderTest.test();}
        };
    };

    /**
    *上报数据类型
    */
    var StatsActType = {
        /**
        *类目搜索时候上报数据,
        */
        ActSearchByCategory: 1,
        
        /**
        *关键字搜索时候上报数据
        */
        ActSearchByKey: 2,

        /**
        *类目属性过滤时候上报数据
        */
        ActSearchByPidVids: 3,

        /**
        *点击商品详情时候上报数据
        */
        ActProductDetail: 10,

        /**
        *收藏商品时候上报数据
        */
        ActFavorite: 11,

        /**
        *添加到购物车时候上报数据
        */
        ActCart: 12,

        /**
        *提交订单时候上报数据
        */
        ActOrder: 13,

        /**
        *支付时候上报数据
        */
        ActPay: 14,

        /**
        *注册成功上报数据
        */
        ActRegister: 15,

        /**
        *登录成功上报数据
        */
        ActLogin: 16,

        /**
        *分享商品上报数据
        */
        ActShare: 20,

        /**
        *所有页面上报一次
        */
        ActAll: 30,

        /**
        *主页打开一次上报
        */
        ActHome: 40,

        /**
        *APP下载中转页
        */
        ActAppdownload: 50,

        /**
        *自定义
        */
        Custom: 99
    };

    var uploaderTest = {
        test : function() {
            SFM.Stats().upload(2, "雅诗兰黛");
        },
        benchmark : function() {

        }
    };

    var dataReportEngine = {
        /**
        *搜索类目
        */
        searchByCategory : function(searchKey, categoryId, pidvids) {
            var d = { act: "/search" };
            if (searchKey != -1) {
                d.search_key = searchKey;
            } 
            if (categoryId != -1) {
                d.category_id = categoryId;
            } 
            if (pidvids != -1) {
                d.pidvids = pidvids;
            }

            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },
        /**
        *关键字搜索
        */
        searchByKey : function(searchKey, categoryId, pidvids) {
            //NOT NEED
        },
        /**
        *pidvid搜索
        */
        searchByPidVids : function(searchKey, categoryId, pidvids) {
            //NOT NEED
        },
        /**
        *点击商品详情
        */
        productDetail : function(productId) {
            var d = { product_id: productId, act: "/productDetail" };
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },
        /**
        *收藏
        */
        favorite : function(productId) {
            var d = { product_id: productId, act: "/favorite" };
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },

        /**
        *添加到购物车
        */
        cart : function(productId, skuIds, buyNum) {
            var d = { product_id: productId, sku_id: skuIds, buy_num: buyNum, act: "/cart" };
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },
        
        /**
        *提交订单
        */
        order : function(orderId, productIds, skuIds, sales) {
            var d = {order_id: orderId, product_ids: productIds, sku_ids: skuIds, sales: sales, act: "/order" };
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },

        /**
        *支付
        */
        pay : function(orderId, payType, paySum, productIds, skuIds) {
            var d = { order_id: orderId, pay_type: payType, pay_sum: paySum, product_ids: productIds, sku_ids: skuIds, act: "/pay" };
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },

        /**
        *注册
        */
        register : function(uid) {
            var d = { act: "/register" };
            var kvs = this.getBuzzData(uid).concat(d);
            this.uploadData(kvs);
        },

        login : function(uid) {
            var d = { act: "/login" };
            var kvs = this.getBuzzData(uid).concat(d);
            this.uploadData(kvs);
        },

        /**
        * 分享
        */
        share: function(options) {
            var d = options || {};
            d.act = "/share2";

            d.share_path = helper.getPath(d.share_path)
//            d.path = helper.getPath(d.path)
//            d.referrer = helper.getReferrer(d.referrer)

            var kvs = this.getBuzzData().concat(d);
//            kvs = kvs.concat(uploader.queryOS());
            this.uploadData(kvs);
        },

        /**
        *all
        */
        all: function(options) {
            var d = options || {};
            if (typeof d === 'string') d = {}   // compatible old patch
            d.act = "/all";
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },

        /*
        **主页上报数据
        */
        home: function() {
            var d = {act: "/home"};
            var kvs = this.getBuzzData().concat(d);
            this.uploadData(kvs);
        },

        /*
        **APP下载中转页
        */
        appdownload: function(source, type, uskey, flag) {
            var d = { act: "/appdownload", source: source || '', type: type || '', uskey: uskey || '', flag: flag || '' };
            var kvs = this.getBuzzData().concat(d);
//            kvs = kvs.concat(uploader.queryOS());
            this.uploadData(kvs);
        },

        /*
        **自定义  // 不算流量//操作类型的
        */
        custom: function(type, flag) {
            var d = { act: "/custom", type: type || '', flag: flag || '' };
            var kvs = this.getBuzzData().concat(d);
//            kvs = kvs.concat(uploader.queryOS());
            this.uploadData(kvs);
        },

        getBuzzData : function(uid, options) {
            var $cookie = SFM.CookieUtils();
            var dateUtils = SFM.DateUtils();

            var trackId = $cookie.getCookie("tc");
            var now = new Date();
            var atime = dateUtils.timestamp(now);

            var kvs = [];
            kvs.push({session_id: trackId});

            if (typeof uid !== "undefined") {
                kvs.push({uid: uid});
            } else {
                kvs.push({uid: SFM.Config().getUid()});
            }

            kvs.push(
//                {duration: SFM.PageLoad().getPageLoadTimestamp()},    // no ok yet
                {run_source: runSource},
                {atime: atime}
            );

            var d = {};
            var options = options || {}

            d.path = helper.getPath(options.path)
            d.referrer = helper.getReferrer(options.referrer)
            d.ua = helper.getUA()

            kvs = kvs.concat(d);
            kvs = kvs.concat(uploader.queryOS());

            return kvs;
        },

        uploadData : function(kvs) {
            var params = [];
            for(var i=0; i < kvs.length; i++) {
                var kv = kvs[i];
                for(var k in kv) {
                    var kvk = kv[k]
                    if (typeof kvk === 'object') kvk = JSON.stringify(kvk)
                    var val = k + "=" + kvk;
                    params.push(val);
                }
            }

            var xhrURL = SFM.Config().getStatsUrl() + "?" + params.join("&");
            var xhr = new XMLHttpRequest();
            xhr.open('GET', xhrURL, true);
            xhr.send(null);
        }
    };

    var uploader = {
        getUploadInterval : function(){
            //上报数据时间间隔
            //24小时
            //return 3600 * 1000 * 24;
            //1分钟
            return 3600 * 1000 * 24 ;
        },

        /**
        *第一个参数必须是StatsActType类型，后面的参数依据不同的类型来调用
        */
        upload : function() {
            if (arguments.length < 2 ) {
                throw "调用参数错误";
                return;
            }
            var actType = 0;
            var args = [];

            actType = arguments[0];
            args = Array.prototype.slice.call(arguments,1);

            var func = null;
            switch(actType) {
                case StatsActType.ActSearchByCategory: 
                    func = dataReportEngine.searchByCategory;
                    break;
                case StatsActType.ActSearchByKey: 
                    func = dataReportEngine.searchByKey;
                    break;
                case StatsActType.ActSearchByPidVids: 
                    func = dataReportEngine.searchByPidVids;
                    break;
                case StatsActType.ActProductDetail: 
                    func = dataReportEngine.productDetail;
                    break;
                case StatsActType.ActFavorite: 
                    func = dataReportEngine.favorite;
                    break;
                case StatsActType.ActCart: 
                    func = dataReportEngine.cart;
                    break;
                case StatsActType.ActOrder: 
                    func = dataReportEngine.order;
                    break;
                case StatsActType.ActPay: 
                    func = dataReportEngine.pay;
                    break;
                case StatsActType.ActRegister:
                    func = dataReportEngine.register;
                    break;
                case StatsActType.ActLogin:
                    func = dataReportEngine.login;
                    break;
                case StatsActType.ActShare:
                    func = dataReportEngine.share;
                    break;
                case StatsActType.ActAll:
                    func = dataReportEngine.all;
                    break;
                case StatsActType.ActHome:
                    func = dataReportEngine.home;
                    break;
                case StatsActType.ActAppdownload:
                    func = dataReportEngine.appdownload;
                    break;
                case StatsActType.Custom:
                    func = dataReportEngine.custom;
                    break;
                default:
                    break;
            }
            if (func == null) {
                throw "不存在的上报数据请求";
                return;
            }
            func.apply(dataReportEngine, args);
        },

        checkSessionData : function(runSource) {
            var uid = SFM.Config().getUid();
            try {
                var $cookie = SFM.CookieUtils();
                //get last trackid
                var lastTrackId = $cookie.getCookie("lastTi");
                var lastRecordTime  = $cookie.getCookie("lastRt");
                var trackId = $cookie.getCookie("tc");
                var recordTime = new Date();

                if (trackId != lastTrackId) {
                    //上报数据
                    var kvs = this.querySessionDatas(trackId, uid);
                    dataReportEngine.uploadData(kvs);
                    $cookie.setCookie("lastTi", trackId);

                    if (lastRecordTime == null) {
                        //设置lastRT cookie
                        $cookie.setCookie("lastRt", recordTime.getTime());
                    }
                } else {
                    if (lastRecordTime == null) {
                        lastRecordTime = 0;
                    } else {
                        lastRecordTime = parseInt(lastRecordTime);
                    }

                    var interval = this.getUploadInterval();
                    if(recordTime.getTime() > (lastRecordTime + interval) ) {
                        var kvs = this.querySessionDatas(trackId, uid);
                        //上报数据
                        dataReportEngine.uploadData(kvs);
                        $cookie.setCookie("lastRt", recordTime.getTime());
                    }
                }
                
            } catch (e) {
                console.log("上报数据出错"+e);
            }
        },
        querySessionDatas : function(trackId, uid) {
            var kvs = [];

            var dateUtils = SFM.DateUtils();

            var now = new Date();

            var atime = dateUtils.timestamp(now);
            var ref = helper.getReferrer();

            kvs.push(
                {act: "/session_data"},
                {session_id: trackId},
                {uid: uid},
                {dty: "shop"},
                {run_source: runSource},
                {referrer: ref},
                {atime: atime}
            );
            kvs = kvs.concat(uploader.queryOS());
            return kvs;
        },
        queryOS: function() {
            var kvs = [];
            var bre = helper.getBrowserVersion();
            var lla = helper.getBrowserLanguage();
            var os = helper.getOS();
            var src = helper.getScreenResoluation();

            kvs.push(
                {bre: bre}, 
                {lla: lla}, 
                {os: os}, 
                {src: src}
            );
            return kvs;
        }

    };

    var helper = {
        getOS: function() {
            var l = navigator.userAgent.toLowerCase();
            var d = navigator.platform;
            var e = (d === "Win32") || (d === "Windows");
            var f = (d === "Mac68K") || (d === "MacPPC") || (d === "Macintosh") || (d === "MacIntel");
            var g = l.match(/ipad/i) == "ipad";
            var h = l.match(/iphone os/i) == "iphone os";
            var c = (d === "X11") && !e && !f;
            var b = (String(d).indexOf("Linux") > -1);
            var a = l.match(/android/i) == "android";
            if (f) return "Mac";
            if (g) return "iPad";
            if (h) return "iPhone";
            if (c) return "Unix";
            if (b) {
                if (a) return "Android";
                return "Linux";
            }
            if (e) {
                var k = {
                    "ce": "WindowsMobile",
                    "mobile": "WindowsMobile",
                    "nt 5.0": "Windows2000",
                    "nt 5.1": "WindowsXP",
                    "nt 5.2": "Windows2003",
                    "nt 6.0": "WindowsVista",
                    "nt 6.1": "Windows7",
                    "nt 6.2": "Windows8",
                    "2000": "Windows2000",
                    "xp": "WindowsXP",
                    "2003": "Windows2003",
                    "vista": "WindowsVista",
                    "7": "Windows7",
                    "8": "Windows8"
                };
                for (var j in k) {
                    if (l.indexOf("windows " + j) > -1) {
                        return k[j];
                    }
                }
            }
            return "unknown";
        },
        getBrowserVersion: function() {
            var c = "unknown";
            var a = navigator.userAgent.toLowerCase();
            var b; (b = a.match(/msie ([\d.]+)/)) ? c = b[0] : (b = a.match(/firefox\/([\d.]+)/)) ? c = b[0] : (b = a.match(/yyexplorer\/([\d.]+)/)) ? c = b[0] : (b = a.match(/chrome\/([\d.]+)/)) ? c = b[0] : (b = a.match(/opera.([\d.]+)/)) ? c = b[0] : (b = a.match(/version\/([\d.]+).*safari/)) ? c = b[0] : 0;
            return c;
        },
        getBrowserLanguage: function() {
            return navigator.browserLanguage ? navigator.browserLanguage : navigator.language;
        },
        getScreenResoluation: function() {
            return window.screen.width+"*"+window.screen.height;
        },
        getPath: function(path) {
            var path = path || window.location.href
            return encodeURIComponent(decodeURIComponent(path));
        },
        getReferrer: function(referrer) {
            var referrer = referrer || document.referrer;
            if (referrer) referrer = encodeURIComponent(decodeURIComponent(referrer))   // must decode first
            if (navigator && (navigator.userAgent.indexOf('AliApp') > -1 || navigator.userAgent.indexOf('AlipayClient') > -1)) {
                referrer = "d.alipay.com";
            }
            return referrer
        },
        getUA: function() {
            var ua = navigator.userAgent.toLowerCase();
            return encodeURIComponent(ua);
        }
    };
})(this);
