<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>支付宝 - 网上支付 安全快速！</title>
    <link rel="icon" href="https://i.alipayobjects.com/common/favicon/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="https://i.alipayobjects.com/common/favicon/favicon.ico" type="image/x-icon" />
<link href="https://a.alipayobjects.com" rel="dns-prefetch" />
<link href="https://app.alipay.com" rel="dns-prefetch" />
<link href="https://my.alipay.com" rel="dns-prefetch" />
<link href="https://lab.alipay.com" rel="dns-prefetch" />
<link href="https://cashier.alipay.com" rel="dns-prefetch" />
<link href="https://financeprod.alipay.com" rel="dns-prefetch" />
<link href="https://shenghuo.alipay.com" rel="dns-prefetch" />


<!-- uitpl:/component/trackerTime.vm -->
    <!-- FD:106:alipay/tracker/iconfont.vm:START --><style>
@font-face {
    font-family: "rei";
    src: url("https://i.alipayobjects.com/common/fonts/rei.eot?20150616"); /* IE9 */
    src: url("https://i.alipayobjects.com/common/fonts/rei.eot?20150616#iefix") format("embedded-opentype"), /* IE6-IE8 */
    url("https://i.alipayobjects.com/common/fonts/rei.woff?20150616") format("woff"), /* chrome 6+、firefox 3.6+、Safari5.1+、Opera 11+ */
    url("https://i.alipayobjects.com/common/fonts/rei.ttf?20150616")  format("truetype"), /* chrome、firefox、opera、Safari, Android, iOS 4.2+ */
    url("https://i.alipayobjects.com/common/fonts/rei.svg?20150616#rei") format("svg"); /* iOS 4.1- */
}
.iconfont {
    font-family:"rei";
    font-style: normal;
    font-weight: normal;
    cursor: default;
    -webkit-font-smoothing: antialiased;
}
</style>
<!-- FD:106:alipay/tracker/iconfont.vm:END -->
<script type="text/javascript">
  window._to = { start: new Date() };
</script>

<!-- FD:106:alipay/tracker/monitor.vm:START --><!-- FD:106:alipay/tracker/sai_seer.vm:START --><script type="text/javascript">

!function(n){function o(r){if(t[r])return t[r].exports;var i=t[r]={exports:{},id:r,loaded:!1};return n[r].call(i.exports,i,i.exports,o),i.loaded=!0,i.exports}var t={};return o.m=n,o.c=t,o.p="",o(0)}([function(n,o){"use strict";window.Sai={log:function(){},error:function(){},lost:function(){},off:function(){},on:function(){},_DATAS:[],_EVENTS:[]}}]);

</script>
<!-- FD:106:alipay/tracker/sai_seer.vm:END --><!-- FD:106:alipay/tracker/monitor.vm:END -->
<!-- FD:106:alipay/tracker/seajs.vm:START -->


<!-- monitor 防错代码 -->
<script>
(function(win){
  if(!win.monitor){win.monitor = {};}

  var METHODS = ["lost", "log", "error", "on", "off"];

  for(var i=0,method,l=METHODS.length; i<l; i++){
    method = METHODS[i];
    if("function" !== typeof win.monitor[method]){
      win.monitor[method] = function(){};
    }
  }
})(window);
</script>

<!-- seajs以及插件 -->
<script charset="utf-8" crossorigin="anonymous" id="seajsnode" onerror="window.monitor && monitor.lost && monitor.lost(this.src)" src="https://a.alipayobjects.com:443/??seajs/seajs/2.2.3/sea.js,seajs/seajs-combo/1.0.0/seajs-combo.js,seajs/seajs-style/1.0.2/seajs-style.js,seajs/seajs-log/1.0.0/seajs-log.js,jquery/jquery/1.7.2/jquery.js,gallery/json/1.0.3/json.js,alipay-request/3.0.3/index.js"></script>

<!-- seajs config 配置 -->
<script>
seajs.config({
  alias: {
    '$': 'jquery/jquery/1.7.2/jquery',
    '$-debug': 'jquery/jquery/1.7.2/jquery',
    'jquery': 'jquery/jquery/1.7.2/jquery',
    'jquery-debug': 'jquery/jquery/1.7.2/jquery-debug',
    'seajs-debug': 'seajs/seajs-debug/1.1.1/seajs-debug'
  },
  crossorigin: function(uri){

    function typeOf(type){
	  return function(object){
	    return Object.prototype.toString.call(object) === '[object ' + type + ']';
	  }
	}
	var isString = typeOf("String");
	var isRegExp = typeOf("RegExp");

	var whitelist = [];

  whitelist.push('https://a.alipayobjects.com/');

	for (var i=0, rule, l=whitelist.length; i<l; i++){
	  rule = whitelist[i];
	  if (
	    (isString(rule) && uri.indexOf(rule) === 0) ||
	    (isRegExp(rule) && rule.test(uri))
		) {

	    return "anonymous";
	  }
	}
  },
  vars: {
    locale: 'zh-cn'
  }
});
</script>

<!-- 兼容原有的 plugin-i18n 写法 -->
<!-- https://github.com/seajs/seajs/blob/1.3.1/src/plugins/plugin-i18n.js -->
<script>
seajs.pluginSDK = seajs.pluginSDK || {
  Module: {
    _resolve: function() {}
  },
  config: {
    locale: ''
  }
};
// 干掉载入 plugin-i18n.js，避免 404
seajs.config({
  map: [
	[/^.*\/seajs\/plugin-i18n\.js$/, ''],
	[/^.*\i18n!lang\.js$/, '']
  ]
});
</script>

<!-- 路由旧 ID，解决 seajs.use('select/x.x.x/select') 的历史遗留问题 -->
<script>
(function(){

var JQ = '/jquery/1.7.2/jquery.js';
seajs.cache['https://a.alipayobjects.com:443/gallery' + JQ] = seajs.cache['https://a.alipayobjects.com:443/jquery' + JQ];

var GALLERY_MODULES = [
  'async','backbone','coffee','cookie','es5-safe','handlebars','iscroll',
  'jasmine','jasmine-jquery','jquery','jquery-color','json','keymaster',
  'labjs','less','marked','moment','mustache','querystring','raphael',
  'socketio','store','swfobject','underscore','zepto','ztree'
];

var ARALE_MODULES = [
  'autocomplete','base','calendar','class','cookie','dialog','easing',
  'events','iframe-uploader','iframe-shim','messenger','overlay','popup',
  'position','select','switchable','tip','validator','widget'
];

var util = {};
util.indexOf = Array.prototype.indexOf ?
  function(arr, item) {
    return arr.indexOf(item);
  } :
  function(arr, item) {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === item) {
        return i;
      }
    }
    return -1;
  };
util.map = Array.prototype.map ?
  function(arr, fn) {
    return arr.map(fn);
  } :
  function(arr, fn) {
    var ret = [];
	for (var i = 0; i < arr.length; i++) {
        ret.push(fn(arr[i], i, arr));
    }
    return ret;
  };

function contains(arr, item) {
  return util.indexOf(arr, item) > -1
}

function map(id) {
  id = id.replace('#', '');

  var parts = id.split('/');
  var len = parts.length;
  var root, name;

  // id = root/name/x.y.z/name
  if (len === 4) {
    root = parts[0];
    name = parts[1];

    // gallery 或 alipay 开头的没有问题
    if (root === 'alipay' || root === 'gallery') {
      return id;
    }

    // arale 开头的
    if (root === 'arale') {
      // 处理 arale/handlebars 的情况
      if (contains(GALLERY_MODULES, name)) {
        return id.replace('arale/', 'gallery/');
      } else {
        return id;
      }
    }
  }
  // id = name/x.y.z/name
  else if (len === 3) {
    name = parts[0]

    // 开头在 GALLERY_MODULES 或 ARALE_MODULES
    if (contains(GALLERY_MODULES, name)) {
      return 'gallery/' + id;
    } else if (contains(ARALE_MODULES, name)) {
      return 'arale/' + id;
    }
  }

  return id;
}

var _use = seajs.use;

seajs.use = function(ids, callback) {
  if (typeof ids === 'string') {
    ids = [ids];
  }

  ids = util.map(ids, function(id) {
    return map(id);
  });

  return _use(ids, callback);
}

})();
</script>
<!-- FD:106:alipay/tracker/seajs.vm:END -->
<!-- FD:106:alipay/tracker/tracker_time.vm:START --><!-- FD:106:alipay/tracker/tracker_time.vm:784:tracker_time.schema:全站 tracker 开关:START --><script charset="utf-8" crossorigin="crossorigin" src="https://a.alipayobjects.com/static/ar/alipay.light.base-1.8.js"></script>


<script type="text/javascript">
if (!window._to) {
  window._to = { start: new Date() };
}
</script>

<script charset="utf-8" src="https://as.alipayobjects.com/??g/component/tracker/2.3.2/index.js,g/component/smartracker/2.0.2/index.js"></script>
<script charset="utf-8" src="https://a.alipayobjects.com/g/utiljs/rd/1.0.2/rd.js"></script>



<script>
  window.Tracker && Tracker.start &&  Tracker.start();
</script>







<!-- FD:106:alipay/tracker/tracker_time.vm:784:tracker_time.schema:全站 tracker 开关:END -->
<!-- FD:106:alipay/tracker/tracker_time.vm:END --><link charset="utf-8" rel="stylesheet" href="https://a.alipayobjects.com:443/excashier/front/1.0.0/front-old.css" media="all" />
<link charset="utf-8" rel="stylesheet" href="https://a.alipayobjects.com:443/al/alice.components.security-core-2.1-src.css" media="all" />

<style>

</style>
<style>
    #header {
        height: 60px;
        background-color: #fff;
        border-bottom: 1px solid #d9d9d9;
        margin-top: 0px;
    }
    #header .header-title {
        width: 250px;
        height: 60px;
        float: left;
    }
    #header .logo {
        float: left;
        height: 31px;
        width: 95px;
        margin-top: 14px;
        text-indent: -9999px;
        background: none; !important
    }
    #header .logo-title {
        font-size: 16px;
        font-weight: normal;
        font-family: "Microsoft YaHei",微软雅黑,"宋体";
        border-left: 1px solid #676d70;
        color: #676d70;
        height: 20px;
        float: left;
        margin-top: 15px;
        margin-left: 10px;
        padding-top: 10px;
        padding-left: 10px;
    }
    .header-container {
        width: 950px;
        margin: 0 auto;
    }

    body,
    #footer{
        background-color: #eff0f1;
    }

    #footer #ServerNum {
        color: #eff0f1;
    }
    .login-switchable-container {
        background-color: #fff;
    }

    #order.order-bow .orderDetail-base,
    #order.order-bow .ui-detail {
        border-bottom: 3px solid #bbb;
        background: #eff0f1;
        color: #000;
    }

    .order-ext-trigger {
        position: absolute;
        right: 20px;
        bottom: 0;
        height: 22px;
        padding: 2px 8px 1px;
        font-weight: 700;
        border-top: 0;
        background: #b3b3b3;
        z-index: 100;
        color: #fff;
    }

    #partner {
        margin-top: 0;
        padding-top: 0;
        background-color: #eff0f1;
    }

    #order.order-bow .orderDetail-base, #order.order-bow .ui-detail {
        border-bottom: 3px solid #b3b3b3;
    }

    .payAmount-area {
        bottom: 36px;
    }

    .alipay-logo {
        display: block;
        width: 114px;
        position: relative;
        left: 0;
        top: 10px;
        float: left;
        height: 40px;
        background-position: 0 0;
        background-repeat: no-repeat;
        background-image: url(https://t.alipayobjects.com/images/T1HHFgXXVeXXXXXXXX.png);
    }
</style>
<!-- CMS:外部商户匿名收银台cms/日志入口/全局日志入口开始:excashier/globalLog/log.vm -->  <style>body #onlineService{display:none}</style><script>var fixInterval = setInterval(function(){if(window.switcher){document.body.style.minWidth = '990px';clearInterval(fixInterval);}},100);window.qrPayloopInterval=3000;window.qrPayloopInterval_5=3000;window.qrPayloopInterval_10=3000;</script><!-- CMS:外部商户匿名收银台cms/日志入口/全局日志入口结束:excashier/globalLog/log.vm --></head>
<body>
<script type="text/javascript">
    window.history.forward();
    window.onunload = function(){window.history.forward();};
    window.onpageshow = function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    };
</script>
<!-- CMS:全站公共 cms/notice/headNotice.vm开始:alipay/notice/headNotice.vm --><!--[if lte IE 7]>
<style>.kie-bar { display: none; height: 24px; line-height: 1.8; font-weight:normal; text-align: center; border:1px solid #fce4b5; background-color:#FFFF9B; color:#e27839; position: relative; font-size: 12px; margin: 5px 0 0 0; padding: 5px 0 2px 0; } .kie-bar a { text-decoration: none; color:#08c; background-repeat: none; } .kie-bar a#kie-setup-IE8,.kie-bar a#kie-setup-taoBrowser { padding: 0 0 2px 20px; *+padding-top: 2px; *_padding-top: 2px; background-repeat: no-repeat; background-position: 0 0; } .kie-bar a:hover { text-decoration: underline; } .kie-bar a#kie-setup-taoBrowser { background-position: 0 -20px; }</style>
<div id="kie-bar" class="kie-bar">您现在使用的浏览器版本过低，可能会导致部分图片和信息的缺失。请立即 <a href="http://www.microsoft.com/china/windows/IE/upgrade/index.aspx" id="kie-setup-IE8" seed="kie-setup-IE8" target="_blank" title="免费升级至IE8浏览器">免费升级</a> 或下载使用 <a href="http://download.browser.taobao.com/client/browser/down.php?pid=0080_2062" id="kie-setup-taoBrowser" seed="kie-setup-taoBrowser" target="_blank" title="淘宝浏览器">淘宝浏览器</a> ，安全更放心！ <a title="查看帮助" target="_blank" seed="kie-setup-help" href="https://help.alipay.com/lab/help_detail.htm?help_id=260579">查看帮助</a></div>
<script type="text/javascript">
(function () {
    function IEMode() {
        var ua = navigator.userAgent.toLowerCase();
        var re_trident = /\btrident\/([0-9.]+)/;
        var re_msie = /\b(?:msie |ie |trident\/[0-9].*rv[ :])([0-9.]+)/;
        var version;
        if (!re_msie.test(ua)) {
            return false;
        }
        var m = re_trident.exec(ua);
        if (m) {
            version = m[1].split(".");
            version[0] = parseInt(version[0], 10) + 4;
            version = version.join(".");
        } else {
            m = re_msie.exec(ua);
            version = m[1];
        }
        return parseFloat(version);
    }
    var ie = IEMode();
    if (ie && ie < 8 && (self.location.href.indexOf("_xbox=true") < 0)) {
        document.getElementById('kie-bar').style.display = 'block';
        document.getElementById('kie-setup-IE8').style.backgroundImage = 'url(https://i.alipayobjects.com/e/201307/jYwARebNl.png)';
        document.getElementById('kie-setup-taoBrowser').style.backgroundImage = 'url(https://i.alipayobjects.com/e/201307/jYwARebNl.png)';
    }
})();
</script>
<![endif]-->

<!-- CMS:全站公共 cms/notice/headNotice.vm结束:alipay/notice/headNotice.vm --><div class="topbar">
    <div class="topbar-wrap fn-clear">
        <a href="https://help.alipay.com/lab/help_detail.htm?help_id=258086" class="topbar-link-last" target="_blank" seed="goToHelp">常见问题</a>
        		<span class="topbar-link-first">你好，欢迎使用支付宝付款！</span>
		    </div>
</div>

<div id="header">
    <div class="header-container fn-clear">
        <div class="header-title">
            <div class="alipay-logo"></div>
            <span class="logo-title">我的收银台</span>
        </div>
    </div>
</div>
<div id="container">



<style>

.ui-securitycore .ui-label, .mi-label {
    text-align: left;
    height: auto;
    line-height: 18px;
    padding: 0;
    display: block;
    padding-bottom: 8px;
    margin: 0;
    width: auto;
    float: none;
    font:14px/1.5 tahoma,arial,\5b8b\4f53;
}

.ui-securitycore .ui-form-item {
    position: relative;
    padding: 0 0 10px 0;
    width: 350px;

}

.ui-securitycore .ui-form-explain {
    height: 18px;
    /*display: block;*/
    font-family:tahoma,arial,\5b8b\4f53;
}

.ui-securitycore .edit-link {
    position: absolute;
    top: -3px;
    right: 0;
}

.ui-securitycore .ui-input {
    height: 28px;
    font-size: 14px;
}

.ui-securitycore .standardPwdContainer .ui-input {
    width: 340px;
}

.ui-securitycore .mobile-section.checkcode-section {
    margin-top: 10px;
}

/*安全服务化必将覆盖的样式*/
.mobile-form .ui-securitycore .ui-form-item-mobile {
    display: none;
}

.mobile-form .ui-securitycore .ui-form-item-mobile .ui-label {

}

.mobile-form .ui-securitycore .ui-form-item-mobile .ui-form-text {
    display: none;
}

.mobile-form .ui-securitycore .ui-form-item-counter {
    padding-left: 0;
    padding-right: 0;
    padding-bottom: 20px;
    position: relative;
    height: 87px;
}

.mobile-form .ui-securitycore .ui-form-item-counter .ui-label {
    display: block;
    float: none;
    margin-left: 0;
    text-align: left;
    line-height: 18px !important;
    padding: 0 0 8px 0;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-form-field {
    /*display: block;*/
    zoom: 1;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-form-field:after {
    visibility: hidden;
    display: block;
    font-size: 0;
    content: " ";
    clear: both;
    height: 0;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-checkcode-input {
    height: 24px;
    line-height: 24px;
    width: 148px;
    border: 1px solid #ccc;
    padding: 7px 10px;
    float: left;
    display: block;
    font-size: 14px;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-checkcode-input:focus {
    color: #4d4d4d;
    border-color: #07f;
    outline: 1px solid #8cddff;
}
.mobile-form .ui-securitycore .ui-form-item-counter .eSend-btn {
    float: left;
    color: #08c;
}

#mobileSend {
    position: absolute;
    right: 0;
    top: 26px;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-checkcode-messagecode-btn {
    float: left;
    width: 178px;
    height: 40px;
    _height: 38px;
    line-height: 38px;
    _line-height: 35px;
    color: #676d70;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    border: 1px solid #ccc;
    border-radius: 1px;
    background: #f3f3f3;
    margin-left: 2px;
    padding-left: 0;
    padding-right: 0;

}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-checkcode-messagecode-disabled-btn {
    background: #cacccd;
    border: 1px solid #cacccd;
    color: #aeb1b3;
    font-weight: normal;
    cursor: default;
}

.mobile-form .ui-securitycore .ui-form-item-counter .reSend-btn {
    float: left;
    margin-top: 10px;
    color: #08c;
}

.ui-checkcode-messagecode-disabled-btn {

}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-form-field {
    display: block;
}
.mobile-form .ui-securitycore .ui-form-item-counter .ui-form-field .fn-hide,
.mobile-form .ui-securitycore .ui-form-item-counter .fn-hide .reSend-btn {
    display: none;
}

/*安全服务化必将覆盖的样式*/


.alieditContainer object {
    width: 348px;
    height:38px;
}

#container .alieditContainer {
    width: 348px;
    height: 38px;
}

#container .alieditContainer a.aliedit-install {
    line-height: 38px;
}

/* 安全服务化去控件升级 特木 temu.psc@alipay.com */
#container .alieditContainer .ui-input {
    width:324px;
    padding:7px 10px;
    font-size:14px;
    height: 20px;
    line-height: 24px;
}

#container .alieditContainer .ui-input:focus {
    color:#4D4D4D;
    border-color:#07F;
    outline:1px solid #8CDDFF;
    *padding:7px 3px 4px;
    *border:2px solid #07F;
}


.teBox {
    height: auto;
}

#J_loginPwdMemberT {
    padding: 20px 0 60px 0;
}

#J_loginPwdMemberT #teLogin {
    height: auto;
}

#J_loginPwdMemberT .mi-form-item{
    padding: 0 0 10px 0;
}

#J_loginPwdMemberT .teBox-in {
    padding: 0;
    width: 350px;
    margin: 0 auto;
}

.t-contract-container {
    width: 76%;
}

.contract-container {
    width: 450px;
    margin: 0 auto;
    text-align: left;
    position: relative;
}
.contract-container .contract-container-label {
    width: 450px;
}

.mb-text {
    font-size: 14px;
    padding-top: 10px;
}

.ml5 {
    margin-left: 5px;
}

.user-login-account {
    font-size: 16px;
}

.mi-mobile-button {
    font-weight: bold;
}

.alipay-agreement-link {
    margin-left: 5px;
    color: #999;
}

.alipay-agreement {
    width: 600px;
    height: 270px;
    padding: 10px;
    text-align: center;
}

.alipay-agreement-content {
    height: 230px;
    width: 600px;
    margin-bottom: 5px;
}

#container .order-timeout-notice {
    margin-top: 30px;
    display: none;
}

.login-panel .fn-mb8{
    margin-bottom: 8px;
}

.login-panel .fn-mt8{
    margin-top: 8px;
}

/* 新版扫码页面样式 */


.order-area {
    position: relative;
    z-index: 10;
}

.cashier-center-container {
    overflow: hidden;
    position: relative;
    z-index: 1;
    width: 950px;
    min-height: 460px;
    background-color: #fff;

    border-bottom: 3px solid #b3b3b3;
}

.cashiser-switch-wrapper {
    width: 1800px;
}

.cashier-center-view {
    position: relative;
    width: 803px;
}

.cashier-center-view.view-pc {
    display: block;
}

.cashier-center-view.view-pc .loginBox {
    padding: 60px 0 20px 238px;
    width: 350px;
    margin: 0;
}

.loginBox .login-title-area {
    margin: 0;
    margin-bottom: 30px;
}

.login-title .rt-text {
    font-size: 14px;
}

.teForm {
    padding: 0;
}

.mi-form-item {
    padding: 0 0 12px 0;
}

.submitContainer {
    margin-top: 6px;
}

/* 切换按钮 */
.view-switch {
    width: 146px;
    height: 400px;
    padding-top: 126px;
    background-color: #e6e6e6;
    cursor: pointer;

    /* 禁止选中 */
    -webkit-user-select: none; 
    -khtml-user-select: none; 
    -moz-user-select: none; 
    user-select: none;
}

.view-switch.qrcode-show {
    border-left: 1px solid #d9d9d9;
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

.view-switch.qrcode-hide {
    border-right: 1px solid #d9d9d9;
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}

.switch-tip {
    text-align: center;
}

.switch-tip-font {
    font-size: 16px;
    font-family: tahoma, arial, '\5FAE\8F6F\96C5\9ED1', '\5B8B\4F53';
}

.switch-tip-icon {
    position: relative;
    z-index: 10;
    display: block;
    margin-top: 4px;
    font-size: 78px;
    color: #a6a6a6;
    cursor: pointer;
}

.switch-tip-btn {
    display: block;
    width: 106px;
    height: 36px;
    margin: 6px auto 0;
    border: 1px solid #0fa4db;
    background-color: #00aeef;
    border-radius: 5px;

    font-size: 12px;
    font-weight: 400;
    line-height: 36px;
    text-align: center;
    color: #fff;
    text-decoration: none;
}

.switch-tip-btn:hover {
    color: #fff;
    text-decoration: none;
}

.view-switch.qrcode-hide .view-switch-content {
    height: 334px;
    padding-top: 126px;
}

.switch-pc-tip .switch-tip-icon {
    position: relative;
    z-index: 10;
    margin-top: 4px;
    font-size: 78px;
}

.switch-tip-icon-wrapper {
    position: relative;
}

.switch-tip-icon-wrapper:before {
    content: '';
    position: absolute;
    left: 47px;
    top: 24px;
    z-index: 0;
    width: 50px;
    height: 70px;
    background-color: #fff;
}

.switch-qrcode-tip .switch-tip-icon-wrapper:before {
    left: 38px;
    top: 25px;
    width: 70px;
    height: 47px;
}

.switch-tip-icon-img {
    position: absolute;
    left: 58px;
    top: 35px;
    z-index: 11;
}

.switch-qrcode-tip .switch-tip-icon-img {
    left: 48px;
    top: 39px;
}

.standardPwdContainer object {
    width: 348px;
    height:38px;
}

#container .standardPwdContainer {
    width: 348px;
    height: 38px;
}

#container .standardPwdContainer a.aliedit-install {
    line-height: 38px;
}

#container .standardPwdContainer .ui-input {
    width:324px;
    padding:7px 10px;
    font-size:14px;
    height: 20px;
    line-height: 24px;
}

#container .standardPwdContainer .ui-input:focus {
    color:#4D4D4D;
    border-color:#07F;
    outline:1px solid #8CDDFF;
    *padding:7px 3px 4px;
    *border:2px solid #07F;
}</style>

<div class="mi-notice mi-notice-success mi-notice-titleonly order-timeout-notice" id="J_orderPaySuccessNotice">
    <div class="mi-notice-cnt">
        <div class="mi-notice-title">
            <i class="iconfont" title="支付成功">&#xF049;</i>

            <h3>支付成功，<span class="ft-orange" id="J_countDownSecond">3</span> 秒后自动返回商户。</h3>
        </div>
    </div>
</div>

<div class="mi-notice mi-notice-error mi-notice-titleonly order-timeout-notice" id="J_orderDeadlineNotice">
    <div class="mi-notice-cnt">
        <div class="mi-notice-title">
            <i class="iconfont" title="交易超时">&#xF045;</i>

            <h3>抱歉，您的交易因超时已失败。</h3>

            <p class="mi-notice-explain-other">
                您订单的最晚付款时间为： <span id="J_orderDeadline"></span>，目前已过期，交易关闭。
            </p>
        </div>
    </div>
</div>

<!-- FD:106:alipay/tracker/um.vm:START -->

<style type="text/css">
.umidWrapper{display:block; height:1px;}
</style>
<span style="display:inline;width:1px;height:1px;overflow:hidden">

<script type="text/javascript">
var cimg = new Image(1,1);
cimg.onload = function() {
    cimg.onload = null;
};
cimg.src = "https://ynuf.alipay.com/service/clear.png?xt=P4773bcd279004520dad97045da99e2fa&xa=";
</script>

<script type="text/javascript" src="https://assets.alicdn.com/g/security/umscript/3.0.11/um.js" charset="utf-8"></script>

<script type="text/javascript">
um.init({
    enabled: 1, ratio: 1, timeout: 3000,
    token: 'P4773bcd279004520dad97045da99e2fa', timestamp: '11487876505D5D485641627B',
    serviceUrl: 'https://ynuf.alipay.com/service/um.json',
  appName:''
});

</script>
</span>
<!-- FD:106:alipay/tracker/um.vm:END -->

<!-- 页面主体 -->
<div id="content" class="fn-clear">
        
<div id="J_order" class="order-area" data-module="excashier/login/2015.08.01/orderDetail" >


        
        
                
        <div id="order" data-role="order" class="order order-bow">
                            <form data-module="excashier/login/2015.08.01/checkTimeout" action="https://excashier.alipay.com:443/standard/timeOutErrorPage.htm" method="post" id="J_timeoutForm" class="fn-hide">
                    	<input type="hidden" name="_form_token" value="31814733ebf762b307a23b1800c58cd3668c3484c845496fb92edf618b331e6aRZ11"/>
                    <input name="orderId" type="hidden" value="9043b277e96d4345b1dec08744269a16.20" id="orderId" />
                    <input name="orderTimeoutRequestInterval" type="hidden" value="" id="J_orderTimeoutRequestInterval" />
                    <input name="timeoutCheckUrl" type="hidden" value="https://excashier.alipay.com:443/standard/payOrderClosedCountDown.json"  />
                    <input name="timeoutMillseconds" type="hidden" value="86399585" id="J_timeoutMillseconds"/>
                    <input name="timeoutUrl" type="hidden" value="https://excashier.alipay.com:443/standard/timeOutPage.htm?payOrderId=9043b277e96d4345b1dec08744269a16.20" id="J_timeoutUrl"/>
                    <input type="submit" value="" />
                </form>
                        <div class="orderDetail-base" data-role="J_orderDetailBase">
                <div class="order-extand-explain fn-clear">
            <span class="fn-left explain-trigger-area order-type-navigator" style="cursor: auto" data-role="J_orderTypeQuestion">

            <span>正在使用即时到账交易</span>
    
    <span data-role="J_questionIcon" seed="order-type-detail" style="cursor: pointer;color: #08c;">[?]</span>
            </span>
                                            <span class="fn-left create-time" id="teDelay">
                <span>交易将在<span id="teOrderDelayText">23小时59分钟</span>后关闭，请及时付款！</span>
            </span>
                                    </div>
                <div class="commodity-message-row">
            <span class="first long-content">
                ${orderproname }
            </span>
                                            <span class="second short-content">
                                                                    收款方：IBeauty有限公司
                            </span>
                                    </div>
                                                <span class="payAmount-area" id="J_basePriceArea">
                                                     <strong class=" amount-font-22 ">${order.total_price }</strong> 元
                
        </span>
            </div>
            
<div class="ui-tip ui-question-tip fn-hide" seed="question-tip" data-role="J_orderTypeTip">
    <div class="ui-dialog-container">
        <div class="ui-dialog-head-text">
            <span>付款后资金直接进入对方账户</span>
        </div>

        <ul class="ui-dialog-content">
            <li>
                若发生退款需联系收款方协商，如付款给陌生人，请谨慎操作。
            </li>
        </ul>
    </div>
    <div class="ui-icon-dialog-arrow">
        ↓
    </div>
</div>


<div class="ui-tip ui-question-tip fn-hide" data-role="J_exchangeTip">
    <div class="ui-dialog-container" style="width: 280px;">
        <ul class="ui-dialog-content">
            <li>
                1、支付宝不收取任何货币兑换手续费。
            </li>
            <li>
                2、最终支付金额为人民币金额，非外币金额。
            </li>
			        </ul>
    </div>
    <div class="ui-icon-dialog-arrow">
        ↓
    </div>
</div>

            
            <a id="J_OrderExtTrigger" class="order-ext-trigger" href="#" seed="order-detail-more" data-role="J_oderDetailMore">
                订单详情
            </a>
            

                <div class="ui-detail fn-hide" data-role="J_orderDetailCnt" id="J-orderDetail">
                    <div class="ajax-Account od-more-cnt fn-clear">
                        <div class="first  long-content">${orderproname }</div>
                        <ul class="order-detail-container">
                            <li class="order-item">
                                                                                                             <table>
    <tbody>
                <tr>
            <th class="sub-th">收款方：</th>
            <td>
                                    IBeauty有限公司
                                            </td>
        </tr>
                        <tr>
            <th class="sub-th">订单号：</th>
            <td>${order.id }</td>
        </tr>
                        <tr>
            <th class="sub-th">商品名称：</th>
            <td>
                                    ${orderproname }
                            </td>
        </tr>
                                <tr>
            <th class="sub-th">交易金额：</th>
            <td>${order.total_price }</td>
        </tr>
                            </tbody>
</table>

                                                                    
                            </li>
                        </ul>
                    </div>
        <span class="payAmount-area payAmount-area-expand">
                <strong class=" amount-font-22 ">${order.total_price }</strong> 元
        </span>
                    <iframe src="javascript:''" class="ui-detail-iframe-fix" data-role="J_orderDetailFrameFix"></iframe>
                </div>

            <a id="J_OrderExtTrigger" class="order-ext-trigger fn-hide" href="#" seed="order-detail-more" data-role="J_oderDetailShrink">
                订单详情
            </a>
		        </div>
        <input name="oid" type="hidden" value="9043b277e96d4345b1dec08744269a16.20" id="J_orderId" />
        <input name="pid" type="hidden" value="2088421690247946" id="J_partnerId" />
        <input name="pid" type="hidden" value="DemoPay1496712380499" id="J_outBizID" />
        <input name="qrContextId" type="hidden" value="2017060600305066207ce9ea62b3c395f9" id="J_qrContextId" />
        <input name="qrPayLoopCheckUrl" type="hidden" value="https://tradeexprod.alipay.com/fastpay/qrPayLoopCheck.json" id="J_qrPayLoopCheckUrl" />
        <input name="qrDiscountText" type="hidden" value="" id="J_qrDiscountText" />
        <input name="qrDiscountDesc" type="hidden" value="" id="J_qrDiscountDesc"/>

</div>




    <!-- 操作区 -->
    <div class="cashier-center-container">
        
        <div data-module="excashier/login/2016.08.01/loginPwdMemberT" id="J_loginPwdMemberTModule" class="cashiser-switch-wrapper fn-clear" >

            <!-- 扫码支付页面 -->
            <div class="cashier-center-view view-qrcode fn-left" id="J_view_qr">
                                
<style type="text/css">
.qrcode-area {
    margin: 0 auto;
    position: relative;
}

/* 扫码头部信息 */
.qrcode-integration .qrcode-header {
    display: block;
    width: auto;
    margin: 0;
    padding: 0;
    margin-top: 75px;
    margin-bottom: 16px;
}

.qrcode-header-money {
    font-size: 26px;
    font-weight: 700;
    color: #f60;
}

.qrcode-integration .qrcode-img-area {
    width: 168px;
    height: 168px;
    text-align: center;
}

.qrcode-img-area.qrcode-img-crash {
    height: 220px;
}

.qrcode-reward-wrapper {
    text-align: center;
}

.qrcode-reward {
    display: inline-block;
    margin: 0;
    padding: 2px 5px;
    background-color: #0188cd;
    border-radius: 0;

    font-size: 12px;
    line-height: 16px;
    color: #fff;
}

.qrcode-reward-question {
    font-size: 12px;
    margin-left: 5px;
    margin-right: 0;
}

.qrcode-integration .qrcode-loading {
    top: 70px;
    left: 60px;
}

.qrcode-integration .qrcode-img {
    top: 70px;
    left: 70px;
}

.qrcode-integration .qrcode-img-wrapper {
    position: relative;
    width: 168px;
    height: auto;
    min-height: 168px;
    margin: 0 auto;
    padding: 6px;

    border: 1px solid #d3d3d3;
    -webkit-box-shadow: 1px 1px 1px #ccc;
    box-shadow: 1px 1px 1px #ccc;
}

.qrcode-img-area .qrcode-busy-icon {
    padding-top: 15px;
}

.qrcode-img-area .qrcode-busy-text {
    margin-top: 20px;
}

a.mi-button-lwhite .mi-button-text {
    padding: 8px 39px 4px 36px;
}

.qrcode-img-area .mi-button {
    margin-top: 40px;
}

/* 扫码图片下方提示 */
.qrcode-img-explain {
    padding: 10px 0 6px;
}

.qrcode-img-explain img {
    margin-left: 20px;
    margin-top: 5px;
}

.qrcode-img-explain div {
    margin-left: 10px;
}




.qrcode-foot {
    text-align: center;
}

.qrcode-downloadApp,
.qrcode-downloadApp:hover,
.qrcode-downloadApp:active,
.qrcode-explain a.qrcode-downloadApp:hover {
    font-size: 12px;
    color: #a6a6a6;
    text-decoration: underline;
}

.area-split {
    margin-top: 156px;
    width: 10px;
    height: 300px;

    background-image: url(https://t.alipayobjects.com/images/T1PspfXixsXXXXXXXX.png);
    background-repeat: no-repeat;
}

.qrguide-area {
    position: absolute;
    top: 62px;
    left: 505px;
    width: 204px;
    height: 183px;
    cursor: pointer;
}

.qrguide-area .qrguide-area-img {
    display: block;
    position: absolute;
    bottom: 0;
    left: 0;
    z-index: -1;
}

.qrguide-area .qrguide-area-img.active {
     z-index: 10;
}

.qrguide-area .qrguide-area-img.background {
     z-index: 9;
}

.qrcode-notice .qrcode-notice-title {
    padding: 10px 10px 11px 63px;
}</style>
<!-- 扫码区域 -->
<div id="hidden-input-area" class="fn-hide">
    <input name="qrCode"            type="hidden" value="https://qr.alipay.com/upx08087z50vi2l8a2sj204c"          id="J_qrCode" />
    <input name="qrImgUrl"          type="hidden" value="https://mobilecodec.alipay.com/show.htm?code=upx08087z50vi2l8a2sj204c"        id="J_qrImgUrl" />
    <input name="qrUseImage" 		type="hidden" value="false" 		id="J_qrUseImage"/>
    <input name="qrContextId"       type="hidden" value="2017060600305066207ce9ea62b3c395f9"     id="J_qrContextId" />
    <input name="qrRenewalURL"      type="hidden" value="https://excashier.alipay.com:443/standard/renewQRCode.json?payOrderId=9043b277e96d4345b1dec08744269a16.20"    id="J_qrRenewalURL" />
    <input name="qrPushCheckURL"    type="hidden" value=""  id="J_qrPushCheckURL" />
    <input name="qrLoopCheckURL"    type="hidden" value="https://excashier.alipay.com:443/standard/queryQRStatus.json?payOrderId=9043b277e96d4345b1dec08744269a16.20"  id="J_qrLoopCheckURL" />
    <input name="qrPaySuccGotoURL"  type="hidden" value="https://unitradeprod.alipay.com:443/acq/cashierReturn.htm?sign=K1iSL12yDBJvqcU5oP79dbZT5rkxC72hF8euJi2eTwP%252FhugFTTaIic7WrUfAAx2OkDxqUP10&amp;outTradeNo=DemoPay1496712380499&amp;pid=2088421690247946&amp;type=1" id="J_qrPaySuccGotoURL" />
    <input name="qrCheckMode"       type="hidden" value="LOOP"     id="J_qrCheckMode" />
    <input name="qrExpirySeconds"   type="hidden" value="99" id="J_qrExpirySeconds" />
    <input name="qrLogonId"         type="hidden" value=""       id="J_qrLogonId" />
    <input name="qrBizType"         type="hidden" value="UNI_PC_MERCHANT"       id="J_qrBizType" />
    <input name="resultPageStayTime"  type="hidden" value="5"    id="J_resultPageStayTime" />
	<input name="adName"            type="hidden" value="" id="J_adName"/>
    <input name="adInfo"            type="hidden" value="" id="J_adInfo"/>
</div>

<div data-role="qrPayArea" class="qrcode-integration qrcode-area" id="J_qrPayArea">
        <div class="qrcode-header">
        <div class="ft-center">扫一扫付款（元）</div>
        <div class="ft-center qrcode-header-money">${order.total_price }</div>
    </div>

	    	
        <div data-role="qrPayCrash" class="qrcode-img-area qrcode-img-crash fn-hide">
        <div class="qrcode-busy-icon">
            <i class="iconfont qrpay-crash-icon">&#xF047;</i>
        </div>
        <p class="qrcode-busy-text ft-16">二维码太忙了,<br>请稍后再试</p>
        <a href="#" class="mi-button mi-button-lwhite" data-role="qrPayRefreshBtn" seed="NewQr_qrcodeRefreshBtn"><span class="mi-button-text">重试</span></a>
    </div>

        <div class="qrcode-img-wrapper" data-role="qrPayImgWrapper">
        <div data-role="qrPayImg" class="qrcode-img-area">
            <div class="ui-loading qrcode-loading" data-role="qrPayImgLoading">加载中</div>
        </div>

        <div class="qrcode-img-explain fn-clear">
            <img class="fn-left" src="https://t.alipayobjects.com/images/T1bdtfXfdiXXXXXXXX.png" alt="扫一扫标识">
            <div class="fn-left">打开手机支付宝<br>扫一扫继续付款</div>
        </div>
    </div>

        <div class="qrcode-foot" data-role="qrPayFoot">
        <div data-role="qrPayExplain" class="qrcode-explain fn-hide">
            <a href="https://mobile.alipay.com/index.htm" class="qrcode-downloadApp" data-boxUrl="https://cmspromo.alipay.com/down/new.htm" data-role="dl-app" target="_blank" seed="NewQr_qr-pay-download">首次使用请下载手机支付宝</a>
        </div>

        <div data-role="qrPayScanSuccess" class="mi-notice mi-notice-success mi-notice-titleonly qrcode-notice fn-hide">
            <div class="mi-notice-cnt">
                <div class="mi-notice-title qrcode-notice-title">
                    <i class="iconfont qrcode-notice-iconfont" title="扫描成功">&#xF049;</i>
                    <p class="mi-notice-explain-other qrcode-notice-explain ft-break">
                        <span class="ft-orange fn-mr5" data-role="qrPayAccount"></span>已创建订单，请在手机支付宝上完成付款
                    </p>
                </div>
            </div>
        </div>
    </div>

    <!-- 优惠 TIP -->
    <div class="ft-center fn-hide" data-role="pr-container">
        <div class="qrcode-discount-privilege">
            <ul class="discount-list">
                <li class="discount-item">
                    <span class="action-rt">
                        <span class="action-rt-type">惠</span>
                        <span class="rt-discount" data-role="pr-name"></span>
                    </span>
                    | <em data-role="pr-explain">使用扫码支付可享受优惠</em>
                </li>
                <li class="discount-desc" data-role="pr-desc"></li>
            </ul>
        </div>
    </div>

</div>

<style>
    .ad-wrap {
        width: 260px;
    }

    .ad-title {
        background-color: #f5f5f5;
        padding: 10px;
        line-height: 12px;
        font-size: 12px;
        color: #1a1a1a;
        font-family: Heiti SC;
        text-align: left;
        font-weight: 700;
    }

    .ad-cnt {
        padding: 10px;
        font-size:12px;
        color:#1a1a1a;
        font-family:Heiti SC;
    }

    .arale-tip-1_2_2 .ui-poptip-white .ui-poptip-container {
        padding: 0;
    }

    .arale-tip-1_2_2 .ui-poptip-white .ui-poptip-arrow-2 span,
    .arale-tip-1_2_2 .ui-poptip-white .ui-poptip-arrow-3 span {
        border-left-color: #f5f5f5;
    }
</style>

<!-- 指引区域 -->
<div class="qrguide-area" id="J_qrguideArea" seed="NewQr_animationClick">
    <img src="https://t.alipayobjects.com/images/rmsweb/T13CpgXf8mXXXXXXXX.png" class="qrguide-area-img active">
    <img src="https://t.alipayobjects.com/images/rmsweb/T1ASFgXdtnXXXXXXXX.png" class="qrguide-area-img background">
</div>
	
<script>
    seajs.use(['$','arale/tip/1.2.2/tip'], function($,Tip) {
        $('#J_adShowTrigger').length && new Tip({
            trigger: '#J_adShowTrigger',       
            content: '<div class="ad-wrap"><div class="ad-title">'+$('#J_adName').val()+'</div><div class="ad-cnt">'+$('#J_adInfo').val()+'</div></div>',    // 提示框显示的内容
            theme: 'white',
            inViewport: true,
            arrowPosition: 2       
        });
    });
</script>
            </div>

                        
<!-- 点击切换区域 -->
<div class="view-switch qrcode-show fn-left" id="J_viewSwitcher" unselectable="on" onselectstart="return false;" seed="NewQr_viewSwitch">

    <div class="switch-tip switch-qrcode-tip " id="J_tip_qr">
        <div class="switch-tip-font">&nbsp;</div>
        <div class="switch-tip-icon-wrapper">
            <i class="switch-tip-icon iconfont" title="显示器">&#xF02E;</i>
            <img class="switch-tip-icon-img" src="https://t.alipayobjects.com/images/T1HHFgXXVeXXXXXXXX.png" alt="支付宝图标" width="50" height="17">
        </div>
        <a class="switch-tip-btn" href="javascript:void(0)">&lt;&nbsp;登录账户付款</a>
    </div>

    <div class="switch-tip switch-pc-tip fn-hide" id="J_tip_pc">
        <div class="switch-tip-font">试试手机支付宝</div>
        <div class="switch-tip-icon-wrapper">
            <i class="switch-tip-icon iconfont" title="手机">&#xF033;</i>
            <img class="switch-tip-icon-img" src="https://t.alipayobjects.com/tfscom/T1Z5XfXdxmXXXXXXXX.png" alt="手机支付宝图标" width="30" height="30">
        </div>
        <a class="switch-tip-btn" href="javascript:void(0)">扫一扫付款&nbsp;&gt;</a>
    </div>
</div>
            <!-- PC 付款登录页面 -->
            <div class="cashier-center-view view-pc fn-left" id="J_view_pc">
                <form action="https://excashier.alipay.com:443/standard/securityPost.json?payOrderId=9043b277e96d4345b1dec08744269a16.20&viewModel=payerPwdLoginViewModel" method="post" id="J_TloginForm">
                    <input type="hidden" name="commonAccountIdentiAuthUrl" value="https://excashier.alipay.com:443/standard/securityRender.phtm?payOrderId=9043b277e96d4345b1dec08744269a16.20&viewModel=payerPwdLoginViewModel"/>
                                        	<input type="hidden" name="_form_token" value="31814733ebf762b307a23b1800c58cd329a33ee3d79e4a479756d4ee0af434a2RZ11"/>
                        <input type="hidden" name="viewModelId" value=""/>

                                        


<div class="loginBox">

    <div class="login-title-area">
        <div class="login-title">
            <div class="login-title-left">
                <p class="lt-text ft-yh">登录支付宝账户付款</p>
            </div>
            <div class="login-title-right">
                <a href="javascript:void(0);" class="to-mobile rt-text" id="J_signUp" seed="NewQr_register">新用户注册</a>
            </div>
        </div>
    </div>

    <div class="teForm">
        <div class="login-panel">
            
            <div class="mi-form-item commonAccountContainer" id="J_commonAccountContainer">
                <label class="mi-label">账户名：</label>
                <span class="user-login-account fn-hide"></span>
                <input type="email" name="loginId" class="mi-input mi-input-account" value="" id="J_tLoginId" seed="NewQr_tAccountInput" placeholder="手机号码/邮箱" />
                <input type="hidden" name="loginIdValue" id="J_tLoginIdValue" value=""  />
                <span class="fg-pwd-area">
                    <a class="aside-link" href="https://help.alipay.com/lab/help_detail.htm?help_id=216509" seed="NewQr_forgetAccountLink" target="_blank">忘记账户名？</a>
                </span>
                <div class="mi-form-explain"></div>
            </div>

            <div class="mi-form-item commonAccountFixedContainer fn-mb8 fn-hide" id="J_commonAccountFixedContainer">
                <label class="mi-label">账户名：</label>
                <div class="fn-mt8"><span class="user-login-account" id="J_userLoginText"></span><span class="fn-ml5 fn-hide" id="J_userLoginExplain">已创建订单</span></div>
                <div class="mi-form-explain"></div>
            </div>

            <div class="mi-form-item" id="J_passwordContainer">
                <label class="mi-label">支付密码：</label>
                <span>
                    			            <input id="J_password" type="hidden" name="password" value="" />
	<input type="hidden" name="pwdSecurityId" value="web|excashier_payment_pwd_control|f97f9676-6dd9-404b-9ed1-257ea043af6bRZ11" />
	

    <input style="display:none" />
  <input type="password" style="display:none" />
                                  

        
        <span class="standardPwdContainer" style="display:none">
      <input type="password" tabindex="" id="payPasswd_input" name="payPasswd_input" class="ui-input" oncontextmenu="return false" onpaste="return false" oncopy="return false" oncut="return false" autocomplete="off"/>
    </span>
    <span class="alieditContainer" id="payPasswd_container"></span>


    




      
  <script type="text/javascript">
  (function () {
    var alipay = window.alipay || (window.alipay = {});
    var s = alipay.security = alipay.security || {};
    s.downloadServer = "https://download.alipay.com" || alipay.security.downloadServer;
    s.securityCenterServer = "https://securitycenter.alipay.com" || alipay.security.securityCenterServer;

          s.hasBrowserControlPolicy = true;
    
          s.certDataAccessPolicy = "";
        s.controlCheckTimeout = Number("3000");
    s.websocketPorts = "27382,45242";
    s.newCertControlDownloadAddress = "";
    s.sid = "web|excashier_payment_pwd_control|f97f9676-6dd9-404b-9ed1-257ea043af6bRZ11";
  })();
</script>
<script type="text/javascript" charset="utf-8" crossorigin="anonymous" src="https://a.alipayobjects.com/static/ar/??alipay.light.base-1.11.js,alipay.light.page-1.15-sizzle.js,alipay.security.base-1.8.js,alipay.security.utils.chromeExtension-1.1.js,alipay.security.edit-1.22.js,alipay.security.utils.pcClient-1.1.js,alipay.security.cert-1.5.js,alipay.security.otp-1.2.js,alipay.security.mobile-1.7.js,alipay.security.ctuMobile-1.2.js,alipay.security.riskMobileBank-1.3.js,alipay.security.riskMobileAccount-1.3.js,alipay.security.riskMobileCredit-1.2.js,alipay.security.riskCertificate-1.0.js,alipay.security.riskSecurityQa-1.0.js,alipay.security.riskExpressPrivacy-1.0.js,alipay.security.checkCode-1.1.js,alipay.security.rds-1.0.js,alipay.security.barcode-1.3.0.js,alipay.security.riskOneKeyConfirm-1.2.js,alipay.security.riskSudoku-1.0.js,alipay.security.riskOriginalAccountMobile-1.0.js,alipay.security.riskOriginalSecurityQa-1.0.js"></script>
<script type="text/javascript" charset="utf-8" crossorigin="anonymous" src="https://as.alipayobjects.com/g/alipay-security-pc-3/??risk-tel/2.0.2/index.js,core2/3.0.2/index.js"></script>
    <script charset="utf-8" crossorigin="anonymous" src="https://a.alipayobjects.com/security-sdk/2.1.2/index.js"></script>
  <script>
  light.trackOn = false;
  light.has('page/products') || light.register('page/products');
  light.has('page/scProducts') || light.register('page/scProducts', light, []);
  alipay.security.utils.chromeExtension.setExtensionId('lapoiohkeidniicbalnfmakkbnpejgbi');
</script>
    

<input type="hidden" name="J_aliedit_using" value="true" />
<input type="hidden" id="payPasswd" name="payPasswd" value="" />
<input type="hidden" name="J_aliedit_key_hidn" value="payPasswd" />

<input type="hidden" name="J_aliedit_uid_hidn" value="alieditUid" />
<input type="hidden" id="alieditUid" name="alieditUid" value="6c2f090e5417ae80a19a5fbca873e5e5" />

<input type="hidden" name="REMOTE_PCID_NAME" value="_seaside_gogo_pcid" />
<input type="hidden" name="_seaside_gogo_pcid" value="" />
<input type="hidden" name="_seaside_gogo_" value="" />
<input type="hidden" name="_seaside_gogo_p" value="" />

<input type="hidden" name="J_aliedit_prod_type" value="" />

<input type="hidden" name="security_activeX_enabled" value="" />

<input type="hidden" name="J_aliedit_net_info" value="" />

<input type="hidden" id="edit_infor" value="" />

<script>
  light.node('#payPasswd').parent().find('[name=security_activeX_enabled]')[0].value = alipay.security.activeXEnabled;
</script>            <script type="text/javascript">
      alipay.security.snowden.config({url: 'https://seccliprod.alipay.com/api/do.htm',silent: !true});
      alipay.security.snowden.record('web|excashier_payment_pwd_control|f97f9676-6dd9-404b-9ed1-257ea043af6bRZ11', {products:'singlePassword'});
    </script>
            
<style type="text/css">
  input.sixDigitPassword {
    position: absolute;
    color: #fff;
    opacity: 0;
    width: 1px;
    height: 1px;
    font-size: 1px;
    left: 0;
    -webkit-box-sizing: content-box;
    box-sizing: content-box;
    -webkit-user-select:initial; /* 取消禁用选择页面元素 */
    outline: 'none';
    margin-left: '-9999px';
  }

  div.sixDigitPassword {
    cursor:text;
    background: #fff;
    outline: none;
    position: relative;
    padding: 8px 0;
    height: 14px;
    border: 1px solid #cccccc;
    border-radius: 2px;
  }

  div.sixDigitPassword i {
    float: left;
    display: block;
    padding: 4px 0;
    height: 7px;
    border-left: 1px solid #cccccc;
  }

  div.sixDigitPassword i.active {
    background-image: url("https://t.alipayobjects.com/images/rmsweb/T1nYJhXalXXXXXXXXX.gif");
    background-repeat: no-repeat;
    background-position: center center;
  }

  div.sixDigitPassword b {
    display: block;
    margin: 0 auto;
    width: 7px;
    height: 7px;
    overflow: hidden;
    visibility:hidden;
    background-image: url("https://t.alipayobjects.com/tfscom/T1sl0fXcBnXXXXXXXX.png");
  }

  div.sixDigitPassword span {
    position: absolute;
    display: block;
    left: 0px;
    top: -1px;
    height: 30px;
    border: 1px solid rgba(82, 168, 236, .8);
    border: 1px solid #00ffff\9;
    border-radius: 2px;
    visibility: hidden;
    -webkit-box-shadow: inset 0px 2px 2px rgba(0, 0, 0, 0.75), 0 0 8px rgba(82, 168, 236, 0.6);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
  }
  </style>









<script type="text/javascript">
  (function(){
      var prop = {
      "WMode": 0,
      "PK": "PYV7wxnFqz1ar0evEZ+3gpPQIGav7lkZ0GprOPMSXvioo3B9gV0JH8y0fzEdabPVndB2QT1Muap5c59sZ7za9VsSamx2id4qnFIrfk+P2bxscZ38y07sI4K15KQazWCYY73YlLNJFpAbQ004dUD87yk3wtC6iXbEXIqm2OsAujBih91ybG+GIS0liobzutW4i5KS8f0XuXCd76ujMeQD+jQaden9eJxriRr9hJWTFR0ZufIHkxm3aq7pFTLd2Ic65ka6Eml4DpsksZYE1u8XPH6CQd0sXjz1pMHe2Pt9e91cvYnb96rDognVA6dR9PEjnA35ZOmgaVNDQqTSZ6zlyyg/2flVtmaVlaTGDqNiilWZjaKOTM1WJRFqX9JMPfD0DraoF43SHO6ZcdmqBIqSBMI6uEUrqTnD2fc2AEqUTpJdMWTPZ/+eW0F37whEI7Men09JnJe6cgkB5HpvNNJP/rYfB5wMwP3lw7+o02EmOLLAC46IWQkRAMOwxq6+t7tTMQxqOfwTrMWouC+Lr2AiokG0tlK51Ipd+CMyGuvApyPzzvbDYdPf5Sn804KnbJFHWDJ7WwBWTBx2V8iP25T0CcbPanG5bIMSt9D9GN/66RBMILkJfWsBnbQel99BlLT+2J6SLHOay+Cyavah7Q7QfcjTFOcIh7UpocfzDUUPF34=",
      "TS": "MTIzNzA4NDI1MjM1",
      "BMode": {
        "DMode": true,
        "ReadOnly": false,
        "MaxLength": 20
      }
    };




                            
            
    var renderArr = 'R',
        sensorArr = '',
        tolerate = true,
        options = {
          upgrade: '',
          id: 'payPasswd',
          prodType: '',
          sid: 'web|excashier_payment_pwd_control|f97f9676-6dd9-404b-9ed1-257ea043af6bRZ11'
        },
        renderOptions = {
          downloadPath: 'stable',
          downloadServer: 'https://download.alipay.com',
          securityCenterServer: 'https://securitycenter.alipay.com',
          container: "payPasswd_container",
          R: {
            id: 'payPasswd_rsainput',
            hidnId: 'payPasswd',
            PK: "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAo0z/L+pelCPu6DwDFAY/3ITzesr8lnNmYjHht4XUJvLYYBwvDbHMc8xi9sPK9ohVHIKRVLVmmZ9SdmuWYN9HzCyyZ6kEHx+IDBPnulwjdeN/N0w25mVRhYDWxJ2/1C6cPIuNcISchOQdGKuAC0xR37i/kWH9sjBidAQjageYgQoj1HX81flZaPve75Esue85AHZ0VIurjwx7uEuxvQtvCIUvX1bbF13TIYuTbJbn/LrNHby1Kxp42ggNUjAkYUVSF7SC3UP+YGKruii7Vh1UnJ/rpVhjdt3It8le9px8H4Ltt9N3hzU17rBnFpp2ZnmiZVtlfMvsStY54Fl5cSJVxQIDAQAB",
            TS: "MTIzNzA4NDI1MjM1",
            alieditUpgradeVersions: "",
            useSilentInstallation: false,
            useKS: true,
            tabindex: "",
            container: "payPasswd_container",
            ksk: 'cb685401-d7fd-4f32-9eb2-fceed446a779',             useSixDigitPassword: false           },
          C1: {
            id: "edit_payPasswd",
            name: "edit_payPasswd",
            hidnId: "payPasswd",
            width: "180",
            height: "24",
            tabindex: "",
            container: "payPasswd_container",
            passwordMode: "1",
            timestamp: "6712370842",
            pk: "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDS92pDVyWNT7dzG9zH0opH44z9FayCZTX5iqGUxUjPi667IkyaqrsmDPqKsJp47lJ29lzs+Qv8zjPPdmnxjFteMrfpc4ui24gL1iZnchwX87Ox/+Xrm8HFmKlhmUO9n/QgTT+Nz1RGMEN1+HijvsoAhS0TS8XjSfzRkrwvK2pJQIDAQAB",
            alieditUpgradeVersions: ""
          },
          C2: {
            id: "edit_payPasswd",
            name: "edit_payPasswd",
            hidnId: "payPasswd",
            width: "180",
            height: "24",
            tabindex: "",
            container: "payPasswd_container",
            passwordMode: "1",
            timestamp: "6712370842",
            pk: "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDS92pDVyWNT7dzG9zH0opH44z9FayCZTX5iqGUxUjPi667IkyaqrsmDPqKsJp47lJ29lzs+Qv8zjPPdmnxjFteMrfpc4ui24gL1iZnchwX87Ox/+Xrm8HFmKlhmUO9n/QgTT+Nz1RGMEN1+HijvsoAhS0TS8XjSfzRkrwvK2pJQIDAQAB",
            alieditUpgradeVersions: "",
            handler: "light.page",
            prop: light.escapeHTML(light.inspect(prop)),
            useKS: true,
            ksk: 'cb685401-d7fd-4f32-9eb2-fceed446a779'           }
        },
        sensorOptions = {
          websocketPorts: '27382,45242',
          controlCheckTimeout: '3000'
        };


                                var passwordProduct = new alipay.security.Password(options, renderArr, sensorArr, tolerate, renderOptions, sensorOptions);

    passwordProduct.onReady(function () {
      light.node(this.renderable ? '#J_edit_prompt_default' : '#J_edit_prompt_noEdit').removeClass('fn-hide');
    });
          passwordProduct.onReady(function(){
        alipay.security.snowden.report();
      });
        if (light.page.scProducts) {
      light.page.scProducts.push(passwordProduct);
    }
    if (light.page.products) {
      light.page.products['payPasswd'] = passwordProduct;
    }
    alipay.security.useMultiplePolicy = true;


  })()

</script>





      

                </span>
                <span class="fg-pwd-area">
                    <a target="_blank" class="aside-link" href="https://self.alipay.com/selfhelp/passwordfind/index.htm?type=P" seed="NewQr_forgetPwdLink">忘记密码？</a>
                </span>
                <div class="mi-form-explain">
                    <p>
                        请输入账户的 <span class="ft-red">支付密码</span>，不是登录密码。
                    </p>
                </div>
            </div>
            


            <div data-role="alieditContainer" class="fn-hide"></div>

            <div class="submitContainer fn-clear">
                <div class="t-contract-container fn-left">
									
                    								</div>
                <div class="left-submitContainer fn-left">
                    <a href="javascript:void(0);" class="newBtn-blue newBtn-long" id="J_newBtn" data-role="submitBtn" seed="NewQr_tAccountSubmit"
                       data-defaultText="下一步" data-submitText="提交中...">
                        <span>下一步</span>
                    </a>
                </div>
            </div>
			<div class="fn-hide" id="J_agreementForexprod">
                <div data-role="J_alipayForexprodAgreement" class="alipay-agreement">
        <div class="alipay-agreement-content" style="text-align:left;overflow-y:scroll;border:1px #E1E1E1 solid" smartracker="on">
  
  <h3 style="text-indent:2em;"><b>一、 概述 </b></h3>
<p style="text-indent:2em;">本协议中将支付宝（中国）网络技术有限公司简称为“本公司”，对使用本公司服务的用户简称为“您”或“支付宝用户”或“用户”。 
您确认，在您注册成为支付宝用户以接受本公司的服务，或您以其他本公司允许的方式实际使用本公司服务前，您已充分阅读、理解并接受本协议的全部内容，一旦您使用支付宝服务，即表示您同意遵循本协议之所有约定。 
  <b>本公司提醒您认真阅读、充分理解本协议各条款，特别是以粗体标注部分。</b>如您不同意接受本协议的任意内容，或者无法准确理解相关条款含义的，请不要进行后续操作。如果您对本协议的条款有疑问的，请通过本公司客服渠道进行询问，本公司将向您解释条款内容。
  </p> 
  <h3 style="text-indent:2em;"><b>二、 主体内容</b></h3>
<p>
1、购结汇服务，指本公司与本公司合作银行向您提供的代为购买外汇、接受境外汇入外汇并结汇的服务。购汇服务中，本公司代您向本公司合作银行提交购汇信息并将您的款项交付该银行用于购买外汇。结汇服务中，本公司代您向本公司合作银行提交结汇信息并将您来自于境外的外汇款项交付该银行为您转换成人民币。<br>
2、您声明，您满足本公司网站上公布的《支付宝服务协议》中对支付宝用户的身份要求，且按照本公司要求通过了实名验证，具有签订和履行本协议的资格。<br>
<b>3、您同意，发布在支付宝网站支付页面的外汇牌价或本公司另行展示或安排的外汇牌价是您自愿接受的，而不论该外汇牌价是否是最新的或对您最有利的；一旦您确认使用支付宝的购结汇服务，即代表您同意选择该外汇牌价中相应外汇的汇率折算成人民币资金进行支付或收款。<br>
4、目前，您使用本服务时无需承担外汇牌价中标明的汇率与实际购结汇时或支付时或收款时或发生退货时的汇率之间的汇兑损益（不承担汇兑损失也不享有汇兑收益）。您同意，本公司有权要求您自某一时刻起承担该汇兑损益，届时将以支付宝网站发布的公告为准。<br>
5、您确认，您在本公司网站支付页面点击确认购买或在支持本服务的商家处使用本服务购买商品或服务，您即与本公司合作银行间直接形成外汇购买协议，相应的权利义务即由您与本公司合作银行负责履行与承担，本公司不对此提供任何形式的担保或承担与之相关的其他法律责任。同时，本公司有权从您的资产（包括但不限于支付宝账户余额、余额宝、支付宝账户绑定的银行卡内资金等）中扣划（扣款顺序以本公司的规则为准）与您购汇指令等值的人民币资金支付给本公司合作银行。若您的购汇指令超出本公司或相关法律法规或者监管部门或相关银行的额度限制的，则该购汇指令自动无效。<br>
6、您同意，本公司有权将您的身份信息、交易信息、购结汇明细等信息同步给本公司合作银行或为了向您提供购结汇服务而必须获得以上信息的有权机构。<br>
7、您同意，本公司有权就本服务向您收取服务费，服务费收取时间及标准届时以支付宝网站发布的公告为准。<br>
  8、您同意，您使用本服务购结汇的限额等应符合相关法律法规及监管部门或本公司的规定。<br></b>
</p>
</div>
                    <a href="javascript:;" class="mi-button mi-button-lorange" data-role="J_forexprodConfirmAgreement">
                        <span class="mi-button-text" seed="NewQr_agreement-confirm-btn">确定</span>
                    </a>

                </div>
            </div>
        </div>
    </div>

</div>
<script>
	jQuery('[data-role="J_forexprotocol_trigger"]').on('click',function(){jQuery('.ibox-title:contains("支付宝购汇协议")').text('代理购结汇服务协议')});
</script>
<input type="hidden" value="false" name="pwdLoginFront" id="J_pwdLoginFront"/>
                </form>
            </div>

        </div>
    </div>
    <!-- 操作区 结束 -->

</div>
<!-- 页面主体 结束 -->

 
    
  
  <script type="text/javascript">
    var form_tk = "1nY2h9nmTbIsQ4DbpZK4YrNu7KZTEBIm";
    var json_ua = null;
  </script>

   <script type="text/javascript" charset="utf-8" src='https://rds.alipay.com/ua_excashier_rds_auth.js?t=20170605'></script>

 <!-- CMS:全站公共 cms/安全cms/外部收银台信息采集开始:security/sensorSdk.vm -->
<script src="https://a.alipayobjects.com/sensor-sdk/2.0.0/index.js"></script>


<!-- CMS:全站公共 cms/安全cms/外部收银台信息采集结束:security/sensorSdk.vm -->

<!--防止钓鱼确认-->
<input type="hidden" name="hasAntiFishingRisk" value="false"/>
<input type="hidden" name="needCheckIframe" value="true"/>
<div   class="fn-hide" data-role="fishing-popup">
    <style>
        .anti-fishing {
            width: 450px;
            padding: 15px;
        }
        .anti-fishing h3 {
            font-size: 14px;
            font-weight:bold;
            margin: 8px 0;
            padding: 3px 8px 3px 0;
        }
        .anti-fishing p {
            padding: 8px 0;
        }
        .anti-fishing ul {
            padding: 0 0 0 20px;
        }
        .anti-fishing li {
            padding: 5px 0;
        }
        .anti-fishing li input {
            margin: 0 5px 0 0;
            vertical-align: middle;
        }
        span.btn {
            display: inline-block;
            line-height: 100%;
            text-align: left;
            text-decoration: none;
            vertical-align: middle;
        }
        span.btn, span.btn input, span.btn button {
            background-image: url("https://i.alipayobjects.com/e/201309/187HQtMqDP.png");
            background-repeat: repeat-x;
            border: medium none;
            cursor: pointer;
            outline: medium none;
        }
        span.btn-ok, span.btn-ok-hover, span.btn-ok-disabled {
            border: 1px solid #D74C00;
            font-family: SimSun;
            font-size: 14px;
            padding: 1px;
        }
        span.btn-ok {
            background-position: 0 0;
            margin-left: 0;
        }
        span.btn input, span.btn button, {
            vertical-align: baseline;
        }
        span.btn-ok button, span.btn-ok input, span.btn-ok-hover button, span.btn-ok-hover input {
            color: #FFFFFF;
            font-weight: bold;
            height: 29px;
            line-height: 28px;
            padding: 0 16px 3px;
        }
        span.btn-ok button, span.btn-ok input {
            background-position: 0 -70px;
            font-family: SimSun;
            height: 29px;
        }
        .view-case {
            padding: 8px 0 10px 20px;
        }
    </style>
    <div class="anti-fishing">
	
	    <p>您购买的商品为：<span class="ft-break ft-bold ft-red">${orderproname }</span>，收款方为：<strong><font color="red">IBeauty有限公司</font></strong>，请确认。</p>
	    <p>建议您付款前<a href="http://bbs.taobao.com/catalog/thread/154504-251045688.htm" target="_blank">先查看防骗案例</a></p>

    <h3>是否仍继续付款？</h3>

    <ul>
        <li><label for="J_antiFishingStop"><input type="radio" name="pay" value="N" id="J_antiFishingStop" seed="excashier-antiFishing-cancelPay" />否，我不想继续付款了</label></li>
        <li><label for="J_antiFishingPay"><input type="radio" name="pay" value="Y" id="J_antiFishingPay" seed="excashier-antiFishing-confirmPay" />是，我还要继续付款，自担风险。</label></li>
    </ul>
    <div id="J_antiFishingViewCase" class="fn-clear fn-hide view-case">
        <span class="btn btn-ok">
            <input type="button" tabindex="3" seed="excashier-antiFishing-viewCase" value="查看相关案例" />
            <input type="hidden" id="J_openUrl" value="https://bbs.taobao.com/catalog/thread/154504-251045688.htm" />
        </span>
    </div>
    </div>
</div>


<input type="hidden" name="commonAgreementUrl" value="https://excashier.alipay.com:443/standard/agreementDetail.phtm?payOrderId=9043b277e96d4345b1dec08744269a16.20&viewModel=standard%3AcommonAgreementViewModel.vm" />
<input type="hidden" name="memoryPayAgreementUrl" value="https://excashier.alipay.com:443/standard/agreementDetail.phtm?payOrderId=9043b277e96d4345b1dec08744269a16.20&viewModel=standard%3AmemoryPayAgreementViewModel.vm" />

<!--[if lt IE 10]>
<script src="https://as.alipayobjects.com/component/??console-polyfill/0.2.2/index.js,es5-shim/4.1.14/es5-shim.js,es5-shim/4.1.14/es5-sham.js,html5shiv/3.7.2/html5shiv.js"></script>
<![endif]-->

<!-- FD:174:alipay/foot/cliveService.vm:START --><!-- FD:174:alipay/foot/cliveService.vm:1261:cliveService.schema:在线客服配置:START -->
    <div style="display:none">onlineServer</div>
    <script type="text/javascript">
    try {
        (function () {
            var loadOnlineServer = function() {
                seajs.config({
                    comboExcludes: /\/u\/(js|css|cschannel|ecmng)\//,
                    alias: {
						'$': 'jquery/jquery/1.7.2/jquery',
                        'onlineServerConfig': 'https://os.alipayobjects.com/rmsportal/iwBOQWtuJpTikoO.js',
                        'portalServerConfig': 'https://os.alipayobjects.com/rmsportal/FiPHyRpEbxSvFkDoPXIQ.js',
                        'merchantServerConfig': 'https://os.alipayobjects.com/cschannel/xWyNsIXszpdQuTNjYdyo.js',
                        'customerServerConfig': 'https://os.alipayobjects.com/cschannel/bIcYScOyEIsnPNMshNDX.js',
			'koubeiServerConfig': 'https://os.alipayobjects.com/cschannel/sOaNZVvtAFoNIqhKZWOE.js',
			'defaultDataConfig': 'https://a.alipayobjects.com/u/js/201311/1acIoVU1Xx.js',
                        'onlineServerJS': 'https://os.alipayobjects.com/rmsportal/ntHLXjGyzPypCdoEngGm.js',//云客服匹配
                        'onlineServerCSS': 'https://os.alipayobjects.com/rmsportal/OgPAgbONDiKhITIVYmdn.css'//云客服通用样式
                    }
                });
                seajs.use(['onlineServerConfig', 'portalServerConfig','merchantServerConfig','koubeiServerConfig', 'customerServerConfig'], function(){
                    jQuery(function(){
                        window.OS = OS = {},
                        OS.server = {
                            cliveServer: 'https://clive.alipay.com',
                            cschannelServer: 'https://cschannel.alipay.com',
                            initiativeServer: 'https://webpushgw.alipay.com',
			    cshallServer: 'https://cshall.alipay.com'
                        },
                        OS.params = {
                            'uid': ''
                        };
			var tradeNos4Clive = '' || '';
			OS.params.featureStr = "{'tradeNos':'" + tradeNos4Clive + "'}";
                        OS.config = {
                            onlineServerURL: OS.server.cliveServer + '/csrouter.htm',
                            portalServerURL: OS.server.cschannelServer + '/csrouter.htm',
			    newPortalServerURL: OS.server.cschannelServer + '/newPortal.htm',
                            webpushFlashURL: 'https://t.alipayobjects.com/tfscom/T1JsNfXoxiXXXXXXXX.swf',
                            onlineServerIconDefault: 'https://a.alipayobjects.com/u/css/201401/1v9cu1dxaf.css' //在线客服默认图片
                        };
                        seajs.use('onlineServerCSS');
                        seajs.use('onlineServerJS');
                    });
                });
            }
            var bindOnlineServer = function(func){
                var w = window;
                if (w.attachEvent) {
                    w.attachEvent('onload', func);
                } else {
                    w.addEventListener('load', func, false);
                }
            };
            window.initOnlineServer = function() {
                var w = window, o = 'seajs', d = document;
                if(w[o]) { return loadOnlineServer() }
                var s = d.createElement("script")
                s.id = o + "node"
                s.charset = "utf-8";
                s.type = "text/javascript";
                s.src = "https://a.alipayobjects.com/??seajs/seajs/2.1.1/sea.js,jquery/jquery/1.7.2/jquery.js";
                var head = d.head || d.getElementsByTagName( "head" )[0] || d.documentElement;
                head.appendChild(s);
                s.onload = s.onreadystatechange = function(){ if (!s.readyState || /loaded|complete/.test(s.readyState)) { loadOnlineServer() } };
            };
            if (!window.isLazyLoadOnlineService) {
                bindOnlineServer(initOnlineServer);
            };
        })();
    } catch (e) {
        window.console && console.log && console.log(e);
        window.Tracker && Tracker.click('onlineServer-error-init-' + e);
    }
    </script>
<!-- FD:174:alipay/foot/cliveService.vm:1261:cliveService.schema:在线客服配置:END -->

<!-- FD:174:alipay/foot/cliveService.vm:END --><script>
seajs.use('excashier/front/2016.08.01/newCashierFront');
</script>


<div id="footer">
    <!-- FD:231:alipay/foot/copyright.vm:START --><!-- FD:231:alipay/foot/copyright.vm:2604:foot/copyright.schema:支付宝copyright:START -->
<style>
.copyright,.copyright a,.copyright a:hover{color:#808080;}
</style>
<div class="copyright">
      <a href="https://fun.alipay.com/certificate/jyxkz.htm" target="_blank">ICP证：沪B2-20150087</a>
  </div>
<div class="server" id="ServerNum">
  excashier-30-5010 &nbsp; 0a6e111f14967123707045774125605_0
</div>
<!-- FD:231:alipay/foot/copyright.vm:2604:foot/copyright.schema:支付宝copyright:END --><!-- FD:231:alipay/foot/copyright.vm:END --></div>
</div><!-- /container -->
<div id=partner><img alt=合作机构 src="https://i.alipayobjects.com/e/201303/2R3cKfrKqS.png"></div>

 
<!-- uitpl:/component/tracker.vm -->
<!-- FD:106:alipay/tracker/tracker.vm:START --><!-- FD:106:alipay/tracker/tracker.vm:785:tracker.schema:全站自动化/性能/敏感信息打点开关:START -->



<script type="text/javascript">
window.Smartracker && Smartracker.sow && Smartracker.sow();
</script>






<script type="text/javascript">

window.agp_custom_config = {
  BASE_URL: '//kcart.alipay.com/p.gif',
  TIMING_ACTION_URL: '//kcart.alipay.com/x.gif'
}

</script>
<script charset="utf-8" src="https://as.alipayobjects.com/g/component/timing/1.0.0/index.js"></script>





<!-- FD:106:alipay/tracker/sai.vm:START --><script>
    sensScanConfig={
        ratio: 0.01,
        modules: '*',
        types: '*'
      };
</script>

<script src='https://as.alipayobjects.com/g/alipay_security/monitor-sens/1.0.1/monitor-sens.min.js'></script>
<!-- FD:106:alipay/tracker/sai.vm:END -->



<!-- FD:106:alipay/tracker/cmsbuffer.vm:START --><!-- FD:106:alipay/tracker/cmsbuffer.vm:997:cmsbuffer.schema:main-CMS全站修复:START -->
	
			
			
			
			
			
			
			
			
			





<script>
try {
  (function() {
  var logServer = 'https://magentmng.alipay.com/m.gif';
  var sample = 0.0001;
  var url = "https://a.alipayobjects.com/http-watch/1.0.7/index.js";

  // 判断比例
  if (!!window.addEventListener && Array.prototype.map && Math.random() < sample) {
    var HEAD = document.head || document.getElementsByTagName('head')[0];

    var spt = document.createElement('script');
    spt.src = url;
    HEAD.appendChild(spt);

	setTimeout(function() {
	  window.httpWatch && window.httpWatch({ sample: 1, appname: 'excashier-30-5010', logServer: logServer });
	}, 1000);
  }
  })();
} catch(e) {}
</script>



<script src="https://as.alipayobjects.com/component/console-security-message/1.0.1/index.js"></script>
<!-- FD:106:alipay/tracker/cmsbuffer.vm:997:cmsbuffer.schema:main-CMS全站修复:END -->
<!-- FD:106:alipay/tracker/cmsbuffer.vm:END --><!-- FD:106:alipay/tracker/tracker.vm:785:tracker.schema:全站自动化/性能/敏感信息打点开关:END -->
<!-- FD:106:alipay/tracker/tracker.vm:END -->
<script>

</script>
<div class="ui-poptip ui-poptip-white qrpay-discount-tip fn-hide" id="J_qrPayTip">
    <div class="ui-poptip-shadow">
        <div class="ui-poptip-container qrpay-discount-container">
            <div class="ui-poptip-arrow ui-poptip-arrow-10">
                <em></em>
                <span></span>
            </div>
            <div class="ui-poptip-content">
                <p>使用扫码支付，不可与</p>
                <p>支付宝其他优惠同时使用。</p>
            </div>
        </div>
    </div>
</div>
</body>
</html>


