<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>个人中心</title>
  <link rel="stylesheet" type="text/css" href="../static/css/个人中心.css"/>
  <link rel="stylesheet" href="../static/css/style.css" /> 
  <!--header样式-->
  <link href="../static/css/header.css" rel="stylesheet" style="text/css" />
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head-->
  <script type="text/javascript" src="../static/js/jquery.min.js"></script>
  <script type="text/javascript" src="../static/js/head.js"></script>
</head>
<body>
	<div class="head"> <!--————————————————————要添加别的页面————————————————————-->
   <div class="main">
  <div  class="header">
   <div class="topbar_wrap"> 
     <div class="wrap clearfix"> 
      <div class="topbar_left"> 
       <ul> 
        <li class="login_warp"> 
         <ul> 
          <li>欢迎来到iBeauty！</li> 
          <li><a href="https://login.vmei.com/login" title="立即登录" id="login_href">马上登录</a></li> 
          <li class="line"><span>|</span></li> 
          <li><a href="https://login.vmei.com/login?action=register" id="register_href" title="马上注册">立即注册</a></li> 
         </ul> </li> 
        <li data-type="reg" style="display:none;"> 
         <ul> 
          <li class="clearfix">欢迎您，<span></span></li> 
          <li class="line"><span>|</span></li> 
         </ul> </li> 
        <li class="mod_hover" data-type="reg" style="display:none;"> 
         <div class="car"> 
          <div class="shownum" id="unpaid">
           0
          </div> 
         </div> <a class="my" href="/my/account">我的帐户<i class="arrow"></i></a> 
         <ul class="pull_list"> 
          <li><a href="/my/point">我的积分</a></li> 
          <li><a href="/my/order">我的订单</a></li> 
          <li><a href="/my/valuation">我的评论</a></li> 
          <li><a href="/my/affiliate">我的分成</a></li> 
          <li><a href="/user/logout">退出</a></li> 
         </ul> </li> 
       </ul> 
      </div> 
      <ul class="topbar_right"> 
       <li><a href="/help/500001" title="隐私条款" target="_blank">隐私条款</a></li> 
       <li class="line"><span>|</span></li> 
       <li><a href="http://open.vmei.com" title="开放平台" target="_blank">开放平台</a></li> 
       <li class="line"><span>|</span></li> 
       <li><a href="http://open.vmei.com/supply" title="品牌入驻" target="_blank">品牌入驻</a></li> 
       <li class="line"><span>|</span></li> 
       <li><a href="/help" title="帮助中心" target="_blank">帮助中心</a></li> 
      </ul> 
     </div> 
    </div>

    <div id="header_bottom">
     <div id="header_bottom_mid">
               <div id="logo">
                <a href="">
                    <span class="l_name"><img src="../static/img/I3.bmp"></span>
                    <span class="l_website"><img src="../static/img/BEAUTY5.png"></span>
                    <span class="l_slogan">美从这里开始</span>
                </a>
            </div>
           <div class="search">
            <form autocomplete="off" action="" method="get" id="">
                <span class="txt" style="position: relative;">
                          <input type="text"  data-default="香水" name="keyword" value="" style="width:300px;height:30px">
                        </span>
                <span class="searchBtn"><input type="submit" value="搜索" style="width:70px;height:30px;background:transparent;border:1px solid #AEA5AB;" size="30px" onmouseover="this.style.borderColor='black';this.style.backgroundColor='plum'" onmouseout="this.style.borderColor='black';this.style.backgroundColor='#ffffff'"></span>
            </form>
            <div class="top_search">
                <a title="" href="">保湿</a>
                <a title="" href="">兰蔻</a>
                <a title="" href="">雅诗兰黛</a>
                <a title="" href="">控油</a>
                <a title="" href="">去角质</a>
                <a title="" href="">防晒</a>
                <a title="" href="">减肥</a>
                <a title="" href="">脱毛</a>
            </div>
            <div id="bigAutocompleteContent" class="searchBox"></div>
        </div>
         <div class="header_bottom_right">
         <div class="cart">
            <ul>
                <li class="bag-li" >
                    <a href="" class="shopbag">
                        <span><img src="../static/img/gwc.png"></span>
                        <span class="cart_hover">购物袋 (<em>0</em>)</span>
                        <span>：</span>
                        <span class="bag_precie">￥0.00</span>
                        <span class="bag_tips"></span>
                    </a>
                    <div class="gwc-cont">
                        <div class="mycart_popup"><div class="tip">购物车暂无商品<br>快去挑选自己钟爱的商品吧~~</div></div>
                    </div>
                </li>
            </ul>
            </div>
        </div>
    </div>
    <nav class="topNav navDelay"> 
     <ul> 
      <li class="liHome"> 
       <div class="L1">
        <a href="https://www.vmei.com">首页</a>
       </div> </li> 
      <li class="liSkin"> 
       <div class="L1">
        <a href="/nca-12-1.html">护肤</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">卸妆</a></h4> 
         <p><a href="">卸妆油</a></p> 
         <p><a href="">卸妆乳</a></p> 
         <h4 class="part"><a href="">洁面</a></h4> 
         <p><a href="">洁面乳</a></p> 
         <p><a href="">洁面皂</a></p> 
         <h4 class="part"><a href="">爽肤水</a></h4> 
         <p><a href="">爽肤水</a></p> 
         <p><a href="">柔肤水</a></p>  
        </div> 
        <div class="sort"> 
         <h4 class="part"><a href="">眼部护理</a></h4> 
         <p><a href="">眼霜</a></p> 
         <p><a href="">眼胶</a></p> 
         <h4 class="part"><a href="">乳液/面霜</a></h4> 
         <p><a href="">面霜</a></p> 
         <p><a href="">日霜</a></p> 
        <h4 class="part"><a href="">面部磨砂</a></h4> 
         <p><a href="">磨砂膏</a></p> 
         <p><a href="">磨砂啫喱</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">面膜</a></h4> 
         <p><a href="">面膜帖</a></p> 
         <p><a href="">水洗式面膜</a></p> 
         <p><a href="">睡眠面膜</a></p> 
         <h4 class="part"><a href="">精华</a></h4> 
         <p><a href="">精华乳/液</a></p> 
         <p><a href="">精华素/露</a></p> 
        </div> 
        <div class="sort"> 
         <h4 class="part"><a href="">唇部护理</a></h4> 
         <p><a href="">唇膜</a></p> 
         <p><a href="">唇部磨砂</a></p> 
         <h4 class="part"><a href="">T区/暗疮护理</a></h4> 
         <p><a href="">去黑头膏</a></p> 
         <p><a href="">水洗式鼻帖/鼻膜</a></p> 
         <p><a href="">撕拉式鼻帖/鼻膜</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">颈部护理</a></h4> 
         <p><a href="">颈霜</a></p> 
         <p><a href="">颈膜</a></p> 
         <h4 class="part"><a href="">防晒护理</a></h4> 
         <p><a href="">防晒乳/霜</a></p> 
         <p><a href="">晒黑用品</a></p> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/skin-one.jpg" alt="Estee Lauder/雅诗兰黛 ANR即时特润修护眼部精华霜DNA眼霜15ml 小棕瓶 去细纹眼袋" /></a> 
         </div> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/skin-two.jpg" alt="Lancome/兰蔻 小黑瓶新精华肌底液30ml/50ml/75ml肌因赋活露 嫩肌活肤液" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liMakeup"> 
       <div class="L1">
        <a href="">彩妆</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">粉底</a></h4> 
         <p><a href="">粉底液</a></p> 
         <p><a href="">粉底霜/膏</a></p> 
         <p><a href="">粉饼</a></p> 
         <p><a href="">修容/阴影</a></p> 
         <h4 class="part"><a href="">腮红</a></h4> 
         <p><a href="">胭脂膏</a></p> 
         <p><a href="">胭脂水</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">妆前/隔离</a></h4> 
         <p><a href="">妆前乳</a></p> 
         <p><a href="">隔离乳</a></p> 
         <h4 class="part"><a href="">BB霜</a></h4> 
         <p><a href="">BB霜</a></p> 
         <p><a href="">CC霜</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">睫毛膏</a></h4> 
         <p><a href="">单头睫毛膏</a></p> 
         <p><a href="">睫毛底膏</a></p> 
         <p><a href="">睫毛增长液</a></p> 
         <h4 class="part"><a href="">眼线</a></h4> 
         <p><a href="">眼线笔</a></p> 
         <p><a href="">眼线液</a></p> 
         <p><a href="">眼线粉</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">眼影</a></h4> 
         <p><a href="">单色眼影</a></p> 
         <p><a href="">双色眼影</a></p> 
         <p><a href="">三色眼影</a></p> 
         <p><a href="">四色眼影</a></p> 
         <p><a href="">五色及以上</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">美甲</a></h4> 
         <p><a href="">彩色指甲油</a></p> 
         <p><a href="">护理指甲油</a></p> 
         <p><a href="">指甲修护霜</a></p> 
         <h4 class="part"><a href="">美唇</a></h4> 
         <p><a href="">唇笔</a></p> 
         <p><a href="">唇彩/蜜</a></p> 
         <p><a href="">唇釉</a></p> 
         <h4 class="part"><a href="">中小样</a></h4> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/makeup-one.jpg" alt="Chanel/香奈儿 水亮系列口红可可小姐唇膏3g coco shine 轻盈滋润" /></a> 
         </div> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/makeup-two.jpg" alt="Dior/迪奥 活肤驻颜梦幻美肌修颜乳30/50ml 美肌臻品 淡斑遮瑕 杨幂推荐" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liPerfume"> 
       <div class="L1">
        <a href="">香水</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">男士香水</a></h4> 
         <p><a href="">古龙水EDC</a></p> 
         <p><a href="">香体乳</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">女士香水</a></h4> 
         <p><a href="">香水EDP</a></p> 
         <p><a href="">淡香水EDT</a></p> 
         <p><a href="">香体乳</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">中性香水</a></h4> 
         <p><a href="">香水EDP</a></p> 
         <p><a href="">淡香水EDT</a></p> 
         <p><a href="">香体乳</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">香水套装</a></h4> 
         <p><a href="">香膏套装</a></p> 
         <p><a href="">香体乳套装</a></p> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/perfume-one.jpg" alt="Burberry/巴宝莉 英伦迷情风格女士淡香水/女香30/50/100ml EDT" /></a> 
         </div> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/perfume-two.jpg" alt="Chanel/香奈儿 Chance邂逅清新淡香水50ml/100ml 绿邂逅 喷式香氛EDT" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liBody"> 
       <div class="L1">
        <a href="">身体护理</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">沐浴用品</a></h4> 
         <p><a href="">沐浴乳</a></p> 
         <p><a href="">沐浴露</a></p> 
         <h4 class="part"><a href="">女性卫生用品</a></h4> 
         <p><a href="">卫生巾</a></p> 
         <p><a href="">卫生洁肤液</a></p> 
    <h4 class="part"><a href="">脱毛用品</a></h4> 
         <p><a href="">脱毛膏</a></p> 
         <p><a href="">脱毛蜡纸</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">身体护理</a></h4> 
         <p><a href="">润肤乳/霜</a></p> 
         <p><a href="">身体磨砂</a></p> 
         <p><a href="">身体喷雾</a></p> 
         <h4 class="part"><a href="">止汗香体用品</a></h4> 
         <p><a href="">止汗喷雾</a></p> 
         <p><a href="">止汗贴</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">纤体护理</a></h4> 
         <p><a href="">纤体乳/霜</a></p> 
         <p><a href="">纤体啫喱</a></p> 
         <h4 class="part"><a href="">胸部护理</a></h4> 
         <p><a href="">丰胸乳/霜</a></p> 
         <p><a href="">丰胸贴</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">手足部/指甲护理</a></h4> 
         <p><a href="">护手霜</a></p> 
         <p><a href="">手膜</a></p> 
         <p><a href="">足部磨砂</a></p> 
         <h4 class="part"><a href="">牙齿用品</a></h4> 
         <p><a href="">牙膏</a></p> 
         <p><a href="">漱口水</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">宝宝用品</a></h4> 
         <p><a href="">沐浴露</a></p> 
         <p><a href="">洗发露</a></p> 
         <p><a href="">尿疹膏</a></p> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/soma-one.jpg" alt="Clarins/娇韵诗 调和身体护理油100ml 紧实肌肤消除细纹" /></a> 
         </div> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/soma-two.jpg" alt="L'occitane/欧舒丹 花香润手霜三件套装30ml*3 柔润双手护手霜" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liHair"> 
       <div class="L1">
        <a href="/nca-16-1.html">洗发护发</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">洗发</a></h4> 
         <p><a href="">洗发露</a></p> 
         <p><a href="">洗发皂</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">护发</a></h4> 
         <p><a href="">护发素</a></p> 
         <p><a href="">护发油</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">头发造型用品</a></h4> 
         <p><a href="">定型慕丝</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">美发工具</a></h4> 
         <p><a href="">梳子</a></p> 
         <p><a href="">镜子</a></p> 
         <p><a href="">其他</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">染发烫发</a></h4> 
         <p><a href="">染发膏</a></p> 
         <p><a href="">染发水</a></p> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/hair-one.jpg" alt="Phyto/发朵 活力无硅抗老增浓密洗发水/露 200ml 抗衰老 延缓白发 改善枯黄" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liTool"> 
       <div class="L1">
        <a href="">工具</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">美容工具</a></h4> 
         <p><a href="">化妆棉</a></p> 
         <p><a href="">洁面扑</a></p> 
         <p><a href="">面油纸</a></p> 
         <p><a href="">全身剃刀</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">化妆工具</a></h4> 
         <p><a href="">假睫毛</a></p> 
         <p><a href="">双眼皮贴</a></p> 
         <p><a href="">眉刷</a></p> 
         <p><a href="">眼线刷</a></p> 
        </div> 
        <div class="sort"> 
         <h4 class="part"><a href="">纤体工具</a></h4> 
         <p><a href="">纤体绷带</a></p> 
         <p><a href="">纤体器具</a></p> 
         <p><a href="">纤体袜</a></p> 
         <p><a href="">按摩刷</a></p> 
        </div> 
        <div class="sort tool-special"> 
         <h4><a href="">美甲工具</a></h4> 
         <p><a href="">去死皮锉</a></p> 
         <p><a href="">甲面打磨工具</a></p> 
         <p><a href="">去光水</a></p> 
         <h4 class="part"><a href="">香水工具</a></h4> 
         <p><a href="">香水瓶</a></p> 
         <h4 class="part"><a href="">美容仪器</a></h4> 
         <p><a href="">美容仪器</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">沐浴工具</a></h4> 
         <p><a href="">沐浴手套</a></p> 
         <p><a href="">沐浴刷</a></p> 
         <p><a href="">沐浴球</a></p> 
         <p><a href="">浴帽</a></p> 
         <h4 class="part"><a href="">其他工具</a></h4> 
         <p><a href="">棉花棒</a></p> 
         <p><a href="">棉花湿纸巾</a></p> 
         <p><a href="">保温杯</a></p> 
         <p><a href="">柠檬杯</a></p> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/tool-one.jpg" alt="MAC/魅可 #239 眼影刷/眼部阴影刷" /></a> 
         </div> 
         <div class="hotimg"> 
          <a href="/product/4193.html"><img src="../static/img/tool-two.jpg" alt="Shu-uemura/植村秀 专业睫毛夹 卷翘不伤睫毛 思芙美CEO推荐" /></a> 
         </div> 
        </div> 
       </div> </li> 
      <li class="liMan"> 
       <div class="L1">
        <a href="">男士</a>
       </div> 
       <div class="L2"> 
        <div class="sort"> 
         <h4><a href="">男士洁面</a></h4> 
         <p><a href="">洁面乳</a></p> 
         <p><a href="">洁面皂</a></p> 
         <p><a href="">去角质啫喱</a></p> 
         <p><a href="">去黑头膏</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">男士护肤</a></h4> 
         <p><a href="">爽肤水</a></p> 
         <p><a href="">柔肤水</a></p> 
         <p><a href="">BB霜</a></p> 
         <p><a href="">眼部护理</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">剃须护理</a></h4> 
         <p><a href="">须后水</a></p> 
         <p><a href="">剃须膏</a></p> 
         <h4 class="part"><a href="">男士套装</a></h4> 
         <p><a href="">护肤套装</a></p> 
        </div> 
        <div class="sort"> 
         <h4><a href="">男士头部护理</a></h4> 
         <p><a href="">洗发露</a></p> 
         <p><a href="">护发素</a></p> 
         <p><a href="">发蜡</a></p> 
         <h4 class="part"><a href="">男士其他护理</a></h4> 
         <p><a href="">男士唇部护理</a></p> 
         <p><a href="">身体护理</a></p> 
         <p><a href="">防晒护理</a></p> 
        </div> 
        <div class="sort sort-man"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/man-one.jpg" alt="Kiehl's/科颜氏 契尔氏男士洁面啫喱250ml 全效活力洗面奶 唤醒肌肤 深层清洁" /></a> 
         </div> 
        </div> 
        <div class="sortLast"> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/man-two.jpg" alt="wqq下架Lab Series/朗仕 活力焕颜凝乳50ml抚平油光减少毛孔" /></a> 
         </div> 
         <div class="hotimg"> 
          <a href=""><img src="../static/img/man-three.jpg" alt="Biotherm/碧欧泉 男仕炽能醒肤活力面霜50ml 持久保湿" /></a> 
         </div> 
        </div> 
       </div> 
       </li>      
     </ul> 
    </nav> 
    </div>
   </div>
   </div>
  </div>

	<!--用户中心首页开始-->
  <div class="wrap">
    <table>
      <tr>
        <td>
        <!--个人中心左栏占位-->
          <div class="com_left">
              <iframe src="个人中心左栏.jsp" background="black" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" width="200px" height="400px"></iframe> 
          </div>
        <!--个人中心左栏占位结束-->
				</td>
				<td>
        <!--右栏开始-->
        <div class="com_right">
        <table class="right">
        <tr>
        <td width="220px" height="50px">
        <div class="crumb">
          &nbsp;&nbsp;&nbsp;<a href="/my/account">个人首页>></a>
        </div>
        </td>
        <td width="1000px" height="50px"></td>
        </tr>
        <tr>
        <td width="220px" align="left" height="200px" valign="bottom">
            <div class="avatar">
              <img src="../static/img/photo.jpg" height="150px" width="150px"><br><br>
            </div>
        </td>
        <td width="1000px" align="left" height="200px">
        <div class="account-content">
          <div class="account_cover clearfix">
            <div class="basic">
                <div class="username">
                    <br>亲爱的<strong>
                        <label for="name">******</label>
                    </strong>，欢迎您！<br><br>
                </div>
                <div class="info clearfix">
              <div class="fl_l">
                <a href="/my/accountInfo">完善个人资料</a> &nbsp;&nbsp;
                <a href="/my/address">收货地址管理</a> &nbsp;&nbsp;
              </div>
            </div>
            </div>
          </div>
        </div>
        </td>
        </tr>
        <tr>
          <td width="220px" height="200px" align="left" valign="top">
            &nbsp;&nbsp;<a href="/user/toSetAvatar">上传我的头像</a>
          </td>
          <td width="1000px"  align="left" valign="top" height="200px">
            <div class="info clearfix">
              <div class="fl_l">
                <h4>相关进度</h4>
                <a href="/my/accountInfo">待付款</a> &nbsp;&nbsp;
                <a href="/my/address">待发货</a> &nbsp;&nbsp;
                <a href="/my/address">待收货</a> &nbsp;&nbsp;
                <a href="/my/address">待评价</a> &nbsp;&nbsp;
              </div>
            </div>
          </td>
        </tr>
        </table>
      </div>
        <!--右栏结束-->
        </td>
      </tr>
    </table>
  </div>
      
    <!--用户中心结束-->
<!--http://html-color-codes.info/chinese/-->
	



	<div><!--——————————————————————要添加别的页面——————————————————————--> 
   
<iframe src="./foot.html" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="350px" width="100%"></iframe>

  </div>
</body>
</html>