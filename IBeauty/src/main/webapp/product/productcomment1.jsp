<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="UTF-8" /> 
  <title>商品评价</title> 
  <!--下拉面板样式-->
  <link rel="stylesheet" href="../static/css/wangtianhui/style.css" /> 
  <!--header样式-->
  <link href="../static/css/wangtianhui/header.css" rel="stylesheet" style="text/css" />
  <link href="../static/css/wangtianhui/prodetail.css" rel="stylesheet" /> 
  <link href="../static/css/wangtianhui/wangtianhui.css" rel="stylesheet" /> 

  <link href="../static/css/wangtianhui/productcomment.css" rel="stylesheet" /> 
 <!--下拉面板-->
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head-->
  <script type="text/javascript" src="../static/js/jquery.min.js"></script>
  <script type="text/javascript" src="../static/js/head.js"></script>

 <script type="text/javascript">
function change1()
{
document.getElementById("p1").style.borderColor="#27c8e8";
document.getElementById("p2").style.borderColor="#E5E5E5";
document.getElementById("p3").style.borderColor="#E5E5E5";
document.getElementById("p4").style.borderColor="#E5E5E5";
var oto1=document.getElementById("p1");
var oto2=document.getElementById("pic_panel");
oto2.innerHTML=oto1.innerHTML;
}
function change2()
{
document.getElementById("p2").style.borderColor="#27c8e8";
document.getElementById("p1").style.borderColor="#E5E5E5";
document.getElementById("p3").style.borderColor="#E5E5E5";
document.getElementById("p4").style.borderColor="#E5E5E5";
var oto1=document.getElementById("p2");
var oto2=document.getElementById("pic_panel");
oto2.innerHTML=oto1.innerHTML;
}
function change3()
{
document.getElementById("p3").style.borderColor="#27c8e8";
document.getElementById("p2").style.borderColor="#E5E5E5";
document.getElementById("p1").style.borderColor="#E5E5E5";
document.getElementById("p4").style.borderColor="#E5E5E5";
var oto1=document.getElementById("p3");
var oto2=document.getElementById("pic_panel");
oto2.innerHTML=oto1.innerHTML;
}
function change4()
{
document.getElementById("p4").style.borderColor="#27c8e8";
document.getElementById("p2").style.borderColor="#E5E5E5";
document.getElementById("p1").style.borderColor="#E5E5E5";
document.getElementById("p3").style.borderColor="#E5E5E5";
var oto1=document.getElementById("p4");
var oto2=document.getElementById("pic_panel");
oto2.innerHTML=oto1.innerHTML;
}
</script>





<script src="./M 唯美_files/push.js"></script>
  <script src="./M 唯美_files/hm.js"></script>
  <script type="text/javascript" src="./M 唯美_files/pageload.js"></script> 
  <script type="text/javascript" src="./M 唯美_files/jquery-1.7.2.min.js"></script> 
  <script type="text/javascript">
        var _usd='0', _dau='https://data.vmei.com/data.do', _sed='vmei.com';
    </script> 
  <script type="text/javascript" src="./M 唯美_files/commonHead.js"></script> 

  <!--
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
  <script type="text/javascript" src="js/jquery.min.js"></script> 
  <script type="text/javascript" src="js/productLibrary.js"></script> 
  <script type="text/javascript" src="js/index.js"></script> 
  -->
  <style>
  .wrapper{
    padding: 0 0.75rem;
    max-width: 1200px;
    margin: 0 auto;
  }
  a{
    text-decoration: none;
    cursor: pointer;
  }
  body{
    background-color: #FFFFFF;
  }
  
</style> 
 </head> 
 <body> 
  <div class="main"> 
<div id="header"> 
  <iframe src="../header.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="180px" width="100%"></iframe> 
    <div id="header_bottom" style="height:40px;">
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
    <!--用户评论开始--> 
    <div class="e_region"> 
     <div class="e_module"> 
      <div class="wrap container clearfix"> 
       <!--左栏开始{--> 
       <div class="com_left"> 
        <div class="slider cat_slider"> 
         <div class="title"> 
          <h2>商品信息</h2> 
         </div> 
         <div class="baskinfo_bar"> 
          <p><a href="./detail1.jsp" target="_top"><img src="../static/img/CC7392D435D845A09E43380D516E9D70.jpg@350w_350h_90Q_1e_1c.src" width="190" height="140" /></a> </p> 
          <p>商品名称：AHC 第三代修复抗皱水润眼霜30ml 保湿补水 眼部抗皱</p> 
          <p>小思价：￥599.00</p> 
          <p> <span>评价得分：</span> <a href="" class="star"> <em style="width:0%"></em> </a> </p> 
          <p>评论数：<span id="productCommentReplyNumber-id">0</span>条</p> 
          <p class="product_summary"> <a href="../usr/cart.jsp" class="btn buy" target="_top" title="加入购物车">加入购物车</a> </p> 
         </div> 
        </div> 
       </div> 
       <!--}左栏结束--> 
       <!--右栏开始{--> 
       <div class="com_right"> 
        <div class="crumb"> 
         <ul> 
          <li class="home"><a href="./first.html"></a></li> 
          <li><a href="./caizhuangxuanze.html" target="_blank">彩妆</a></li> 
          <li class="step_arrow"></li> 
          <li><a href="./detail1.html" target="_blank">AHC 第三代修复抗皱水润眼霜30ml 保湿补水 眼部抗皱</a></li> 
         </ul> 
        </div> 
        <div class="bask_title_bar"> 
         <div class="name">
          AHC 第三代修复抗皱水润眼霜30ml 保湿补水 眼部抗皱
         </div> 
        </div> 
        <div class="bask_shows clearfix"> 
         <div class="products_pic"> 
          <div class="user"> 
           <img width="60" height="63" src="../static/img/C7F96F2990F3408D8999532871F4432C.jpeg" alt="Lu鹿" /> 
           <i></i> 
          </div> 
          <div class="user_name" id="UserComment-nickname" data-value="Lu鹿">
           1343***8436
          </div> 
          <p style="font-size:20px;color:#DE94D4;font-weight:blod;font-family:serif;">  性价比很高的一款，会一直回购，发货有点慢，要是能快点就好了</p> 




      
         <div id="pic_panel"> 
          <div class="pic">
           <img class="midimg" src="../static/img/9629CE9026B04CE79726598E9D6083BB.jpg"  /> 
          </div> 
         </div> 


         <div class="show_scroll"> 
          <div class="list_pic"> 
           <ul> 

            <li id="p1" onmouseover="change1()"> 
             <div class="pic">
              <img src="../static/img/9629CE9026B04CE79726598E9D6083BB.jpg" />
             </div> </li> 


            <li id="p2" onmouseover="change2()"> 
             <div class="pic">
              <img src="../static/img/811AE029E8964AE68BE3A24C02CA657A.jpg"  />
             </div> </li> 


            <li id="p3" onmouseover="change3()"> 
             <div class="pic">
              <img src="../static/img/E4D3A973F85047B5B31AED05C5365F74.jpg"  />
             </div> </li> 

            <li id="p4" onmouseover="change4()"> 
             <div class="pic">
              <img src="../static/img/9629CE9026B04CE79726598E9D6083BB.jpg" />
             </div> </li> 

           
          
           

           </ul> 
          </div> 
          <a href="javascript:;" class="scrollbutton prev_up current" title="向上"><span>向上</span></a> 
          <a href="javascript:;" class="scrollbutton next_down" title="向下"><span>向下</span></a> 

         </div> 




         </div> 
        </div> 
        <div class="bask_reply"> 
         <div class="pro_consult"> 
          <div class="comment_panel"> 
           <div class="title"> 
            <h3>发表回复</h3> 
           </div> 
           <!-- 发表框 --> 
           <div class="cmt_inpts"> 
            <form> 
             <div class="txt_panel" id="cont"> 
              <div class="huifutxt"> 
               <textarea class="CommentContent"></textarea> 
              </div> 
             </div> 
             <input type="hidden" value="145877" id="productComment-id" /> 
             <div class="ext_panel"> 
              <a href="javascript:;" class="btn send">发表</a> 
             </div> 
            </form> 
           </div> 
           <!-- consult main --> 
           <div class="consult_main"> 
            <!--分页--> 
            <div id="my_page_reply_page" data-bind-first-page-url="/productComment/pageCommentReply?page=1&amp;commentId=145877"> 
             <ul class="cmt_item"> 
             </ul> 
             <div class="nodata"> 
              <p>亲，您还没有评论，快来评论吧~~</p> 
             </div> 
            </div> 
           </div> 
          </div> 
         </div> 
        </div> 
       </div> 
       <!--}右栏结束--> 
      </div> 
     </div> 
    </div> 
    <!--用户评论结束--> 

  
  <div id="footinfo">
  <iframe src="../foot.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>  
   </div>  

  </div>  
 </body>
</html>