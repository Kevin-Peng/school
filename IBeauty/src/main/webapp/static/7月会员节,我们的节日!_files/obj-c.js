// for Obj-C function

//window.onerror = function(err) {
//    log('window.onerror: ' + err)
//}

function getQueryString(name, source) {
    var reg = new RegExp('(^|\\?|&)' + name + '=([^&]*)(&|$)', 'i'),
        source = source || window.location.search,
        r = source.match(reg)
    if (r != null) return unescape(r[2])
    return null
};
function _setCookie(name, value, days){
    var cookie = name + '=' + encodeURIComponent(value);
    if(typeof days == 'number'){
        cookie += '; max-age: ' + (days * 60 * 60 * 24);
    }
    document.cookie = cookie;
};
function _getCookieObj() {
    var allCookie = {};
    var all = document.cookie;
    //console.log('all cookie:'+all);
    if(all === ""){
        return allCookie;
    }
    var list = all.split("; ");
    for(var i = 0 ; i < list.length ; i++){
        var cookie = list[i];
        var p = cookie.indexOf('=');
        var name = cookie.substring(0, p);
        var value = cookie.substring(p+1);
        value = decodeURIComponent(value);
        allCookie[name] = value;
    }
    return allCookie;
}
function _getCookie(name) {
	var all = document.cookie || '';
	//console.log('all cookies:'+all);

	var reg = new RegExp('(^|; )'+name+'=([^;]*)(;|$)', 'i'),
    r = all.match(reg);
	if (r != null){
		var t = unescape(r[2]);
		if(t=='""' || t=="''"){
			return null;
		}else{
			return t;
		}
	};
	return null;
}

;(function(window, undefind) {
    var link = document.querySelectorAll('a')
    if ((window.location.search).indexOf('ios') != -1) {
        
        for (var i = 0; i < link.length; i++) {
            var linkHref = link[i].getAttribute('href') || '';
            var dataHref = link[i].getAttribute('data-href') || '';
            if (!linkHref) return
            if (!linkHref.indexOf('#') == 0) { 
                if (linkHref.indexOf('ios') == -1) {
                    if (linkHref.indexOf('?') == -1) {
                        link[i].setAttribute('href', linkHref + '?ios');
                        link[i].setAttribute('data-href', dataHref + '?ios')
                    } else {
                        link[i].setAttribute('href', linkHref + '&ios')
                    }
                }
            }
            
        }

    }

    /*if ((window.location.search).indexOf('cb=f') != -1) {
       
        for (var i = 0; i < link.length; i++) {
            var linkHref = link[i].getAttribute('href') || ''
            if (!linkHref) return
            if (!linkHref.indexOf('#') == 0) { 
                if (linkHref.indexOf('cb=f') == -1) {
                    if (linkHref.indexOf('?') == -1) {
                        link[i].setAttribute('href', linkHref + '?cb=f')
                    } else {
                        link[i].setAttribute('href', linkHref + '&cb=f')
                    }
                }
            }
        }
    }*/
})(window);


/*
   navtive app action ready
 */
function docReady(callback) {
    var docBody = document.getElementsByTagName('body')[0]
    if (docBody) {
        if (callback) callback()
    } else if (document.addEventListener) {
        document.addEventListener('DOMContentLoaded', function() {
            document.removeEventListener('DOMContentLoaded',arguments.callee, false)
            if (callback) callback()
        }, false)
    } else if (document.attachEvent) {
        document.attachEvent('onreadystatechange', function() {
            if (document.readyState == 'complete') {
                document.detachEvent('onreadystatechange', arguments.callee)
                if (callback) callback()
            }
        })
    }
}

function connectWebViewJavascriptBridge(callback) {
    if (window.WebViewJavascriptBridge) {
        callback(WebViewJavascriptBridge)
    } else {
        document.addEventListener('WebViewJavascriptBridgeReady', function() {
            callback(WebViewJavascriptBridge)
        }, false)
    }
}
//alert('referrer:'+document.referrer);
var fanli_uid = _getCookie("fanli_uid");
var fanli_tracking_code = _getCookie("fanli_tracking_code");
//alert('11fanli_uid:'+fanli_uid);
//console.log('11fanli_tracking_code:'+fanli_tracking_code);
//if (document.referrer.indexOf('cb=f') !== -1 || document.referrer.indexOf('fanli') !== -1) {
if(fanli_uid && fanli_tracking_code){
    var _origin = window.location.origin,
        _pathname = window.location.pathname,
        _search = window.location.search,
        _hash = window.location.hash

    if (_search && _search.indexOf('cb=f') === -1) {
        _search += '&cb=f'
    } else {
        _search = '?cb=f'
    }

    var _winHref = _origin + _pathname + _search + _hash
    //console.log('_winHref:'+_winHref)
    if (_winHref) {
        var _tagBody = document.getElementsByTagName('html')[0];
        if (_tagBody.className.indexOf('inCbf') == -1) {
            _tagBody.className += ' inCbf';
        }
        window.history.replaceState('', '', _winHref)
    }
}

var objCcb = getQueryString('cb')
//if (objCcb !== 'f' && document.referrer.indexOf('cb=f') === -1)
var ua = navigator.userAgent.toLowerCase();
if (/sephome/.test(ua)||/唯美美妆/.test(ua)) {
    connectWebViewJavascriptBridge(function(bridge) {
    
//    bridge.init(function(message, responseCallback) {
//        var data = { 'Javascript Responds':'Wee!' }
//        responseCallback(data)
//    });

//    bridge.registerHandler('productJSHandler', function(data, responseCallback) {
//        var responseData = { 'Javascript Says':'Right back atcha!' }
//        responseCallback(responseData)
//    });
    
    var title = document.querySelector('#share_title');
    var shareTitle = (title) ? title.innerHTML : '唯美美妆(思芙美旗下)';

    var content = document.querySelector('#share_description');
    var shareContent = (content) ? content.innerHTML : '全球美妆海外购，国际转运香港直发。';

    var pic = document.querySelector('#share_pic img');
    var sharePic = (pic) ? pic.getAttribute('src') : 'http://assets.vmei.com/system/wechat/images/logo-share.png';

    var url = document.querySelector('#share_url');
    var shareUrl = (url) ? url.getAttribute('data-url') : window.location.href;
        
    // 页面主动发送分享信息 （调用则显示分享按钮，反之则不显示）
    var options = {
        callType: 'needSharePage',
        params: {
            shareTitle: shareTitle,
            shareContent:shareContent,
            sharePic:sharePic,
            shareUrl:shareUrl
        }
    }
    bridge.callHandler('AppJSBack', options, function(response) {});
    
    //跳转商品
	/**
	 * var productlinks = document.querySelectorAll('.list a')
    for (var i=0; i < productlinks.length; i++) {
        productlinks[i].onclick = function(e) {
        	
            goApp(this, e)
        }
    }**/
   
    var parent = document.querySelectorAll(".list");
    for(var i = 0; i < parent.length; i++){
    	parent[i].addEventListener("click",function(e) {
			e.preventDefault();
	        var target = e.target;
	        while(target !== e.currentTarget){
	            switch (target.nodeName){
	                case "A":
	                      goApp(target, e)
	                    break;
	            }
	            target = target.parentNode;
	        }
	    },false);	
    }
    
    function goApp(target, e) {

        var _this = target;
        var linkHref = _this.getAttribute('href'),
            linkPos = linkHref.lastIndexOf('/') + 1,
            linkPosLast = linkHref.lastIndexOf('ios'),
            linkid;

        if (linkPosLast != -1) {
            linkid = parseInt((linkHref.substring(linkPos, linkPosLast - 1)).match(/^\d+/g));
            
        } else {
            linkid = parseInt((linkHref.substring(linkPos, linkHref.length)).match(/^\d+/g));
        }
        
        if (linkHref.indexOf('products') != -1) {
            e.preventDefault()

            var dataContent = _this.getAttribute('data-content') || getQueryString('keyword', linkHref) || ''

            var cid= getQueryString('cid', linkHref) || ''
            var pv= getQueryString('pv', linkHref)   || ''
            var TOPIC= getQueryString('TOPIC', linkHref)   || ''

            var options = {
                callType: 'searchProduct',
                params: {
                    'cid': cid, 'pv': pv, 'keyword': dataContent, 'stype':TOPIC, 'stypeId':'', 'liveList':''
                }
            }

            bridge.callHandler('AppJSBack', options, function(response) {})
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'searchProduct': dataContent}, function(response) {})
            }, 20)

        } else if (linkHref.indexOf('category?brand') != -1) {
            e.preventDefault()

            var options = {
                callType: 'searchPanl',
                params: {
                    'category': 'brand'
                }
            }

            bridge.callHandler('AppJSBack', options, function(response) {})
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'searchPanl': 'category=' + brand}, function(response) {})
            }, 20)

        } else if (linkHref.indexOf('product') != -1 && linkHref.indexOf('liveshow') != -1) {
            var options = {
                callType: 'liveProduct',
                params: {
                    'liveProductID': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'liveProductID': linkid}, function(response) {});

                setTimeout(function() {
                    bridge.callHandler('AppJSBack', {'liveProductID': linkid}, function(response) {});
                }, 20);
            }, 20);
            e.preventDefault()
        } else if (linkHref.indexOf('product') != -1 && linkHref.indexOf('exchange') != -1) {
            var options = {
                callType: 'pointsMallProduct',
                params: {
                    'pointsMallProduct': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'pointsMallProduct': linkid}, function(response) {});

                // setTimeout(function() {
                //     bridge.callHandler('AppJSBack', {'pointsMallProduct': linkid}, function(response) {});
                // }, 20);
            }, 20);
            e.preventDefault()
        } else if (linkHref.indexOf('product') != -1) {
            e.preventDefault()
            var options = {
                callType: 'product',
                params: {
                    'productID': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'productID': linkid}, function(response) {});
            }, 20);

            e.preventDefault()
        } else if (linkHref.indexOf('video') != -1) {
            var options = {
                callType: 'video',
                params: {
                    'videoID': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'videoID': linkid}, function(response) {});
            }, 20);

            e.preventDefault()
        } else if (linkHref.indexOf('showme') != -1) {
            var options = {
                callType: 'showme',
                params: {
                    'showmeID': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'showmeID': linkid}, function(response) {});
            }, 20);

            e.preventDefault()
        }else if (linkHref.indexOf('beauty/post') != -1) {
        	//alert('linkid:'+linkid);
        	e.preventDefault();
        	var options = {
    			callType: 'post',
    			params: {
    				'postID': linkid
    			}
        	}
        	if(linkHref.indexOf('isTrial=1') != -1){
        		options = {
        			callType: 'trialDetail',
        			params: {
        				'postID': linkid
        			}
            	}
        	}
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'postID': linkid}, function(response) {});
            }, 20);

            e.preventDefault()
        } else if (linkHref.indexOf('beauty/album') != -1) {
            var options = {
                callType: 'albumView',
                params: {
                    'albumID': linkid
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            setTimeout(function() {
                bridge.callHandler('productJSBack', {'albumID': linkid}, function(response) {});
            }, 20);

            e.preventDefault()
        }
    }
    
    //跳转品牌
    /**
    var brandlinks = document.querySelectorAll('.listbrand a')
    for (var i=0; i < brandlinks.length; i++) {
        brandlinks[i].onclick = function(e) {
            
            brandgoApp(this, e)
        }
    }**/
   
   	var parent = document.querySelectorAll(".listbrand");
    for(var i = 0; i < parent.length; i++){
    	parent[i].addEventListener("click",function(e) {
			e.preventDefault();
	        var target = e.target;
	        while(target !== e.currentTarget){
	            switch (target.nodeName){
	                case "A":
	                      brandgoApp(target, e)
	                    break;
	            }
	            target = target.parentNode;
	        }
	    },false);	
    }
   	
    function brandgoApp(target, e) { 
        
        var _this = target;
        var linkHref = _this.getAttribute('href'),
            linkPos = linkHref.lastIndexOf('/') + 1,
            linkPosLast = linkHref.lastIndexOf('ios'),
            linkid;

        var keywords= getQueryString('keyword', linkHref)
        
        if (linkHref.indexOf('keyword') != -1) {
            var options = {
                callType: 'searchProduct',
                params: {
                    'cid': '', 'pv': '', 'keyword': keywords
                }
            }
            bridge.callHandler('AppJSBack', options, function(response) {});
            e.preventDefault()
        }    
        
    }

    /*
       navtive app action ready
     */
    docReady(function() {
        var dochtml = document.getElementsByTagName('html')[0]
        dochtml.classList.add('appready')
        dochtml.classList.remove('loading')
    })
    /* end navtive app action ready */
    });
}
