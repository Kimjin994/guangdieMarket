1.  一个移动端前端小项目的期末大作业，加了后台能打分高点，下面是实验报告

光碟商城前端，是一个移动端的网上商城。主要需求三个页面商城首页、商品详情页和购物车界面。

1.  **网上商城首页能显示数据中的商城的基本商品信息和分类信息：**

> 商品首页设计采用基本的前后端分离，导航栏采用传统的display: inline-block;无序列表布局方式，登录图标采用iconfont的格式，轮播图采用bootstrap的方式实现，商品分类目录和商品目录也是使用display: inline-block;宽度采用百分比流式布局方式，高度采用自动，自动平衡差异。具体的商品分类采用无序列表，商品目录采用无序列表加\<figure\>标签展示商品的封面价格等信息。最底下为版权信息采用黑底和淡色字体形式。导航栏、轮播图和版权信息的css样式都放在common.css文件中，中间的商品分类和目录放在index.css中。首页通过jQuery向后台servlet请求json数据，获得json数据后进行拼接，通过jQuery中的\$(\"\").html对拼接后的数据进行指定位置的输出。

2.  **商城的商品详情页能够展示商品的基本信息：**

商品详情页面通过点击商品链接是传递过来的id来对指定商品进行输出。整体上采用vue框架进行定位，导航栏和首页类似采用了common中的css代码，轮播图采用bootstrap，图片参照京东中只放置了一个对应商品id的 图片。商品价格等特定信息简化采用基本的p和span标签实现，力求信息明确。精选评价界面，使用vue中的v-for指令类似的输出部分评论。用户推荐目录-猜你喜欢中采用了类似首页的figure模式进行输出，每行三个进行整齐排列。内容简介中受限插入一端介绍该商品的视频，如果是电影的就是电影预告片，如果是游戏就是游戏宣传短片，采用jQuery控制代码，进行暂停，时间线拉动等操作。最后是基本的商品文字描述和部分图像信息。上下滚动时会出现各个位置的选项卡，点击即可快速定位到指定位置，采用vue中的滚动监听，通过定位各个选项卡的top位置，点击时直接滚动到对应的导航栏高度。还有一个按钮组，对应用户在下滑是可以快速操作，例如加入购物车。

3.  **商城的购物车界面具有基本购物车的前端格式**

购物车界面模仿书上的黑马商城购物车项目进行实现

界面整体通过上下div的结构进行实现不同首页有左右流式布局，但是高度都是无限制。整体可分为四部分，第一部分为页面操作，返回和菜单键采用background-position来固定两个按钮居于页面左右两端的距离，第二部分安全提示采用文字和图片居中的方式，并且使用横线与上下分开，第三部分店铺名称和优惠介绍也是分为左右两部分显示文字和图片信息采用了浮动模型一个在左边一个右边，第四部分商品盒子中product的div内采用了左右布局的方式，左边为图片右边为文字描述的形式。图片使用浮动模型浮动在左边，商品文字介绍和加减输入按钮和input与垃圾桶用display：block形式排列在一行，其中垃圾桶又up和down拼接在一起，通过指定margin-top实现上下关系。其中在点击垃圾桶会通过jQuery实现up进行转动的动态效果。

2.  核心代码

首页：

```
\<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %\>

\<!doctype html\>

\<html\>

\<head\>

    \<meta charset=\"utf-8\"\>

    \<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/\>

    \<title\>商城首页\</title\>

    \<script src=\"js/jquery-1.12.4.min.js\" \>\</script\>

    \<link href=\"bootstrap-3.3.7/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\>

    \<script src=\"bootstrap-3.3.7/js/bootstrap.min.js\"\>

    \</script\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"css/index.css\"\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"css/common.css\"\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"pics/icon/user/iconfont.css\"\>

\</head\>

\<body\>

\<script type=\"text/javascript\"\>

    \$(document).ready(function(){

        //index.jsp加载完毕后 去服务器端获得所有的category数据

        \$(function(){

            var content = \"\";

            \$.post(

                \"\${pageContext.request.contextPath}/CategoryMovieListServlet\",//发送至servlet

                function(moviedata){

                    for(var i=0;i\<moviedata.length;i++){

                        content+=\"\<li value=\"+moviedata\[i\].classid+\"\>\<a\>\"+moviedata\[i\].classname+\"\</a\>\</li\>\";

                    }

                    //将拼接好的li放置到ul中

                    \$(\"\#categoryUlMovie\").html(content);

                    },

                    \"json\"

                    );

        });

        \$(function (){

            var contentG=\"\";

            \$.post(

                \"\${pageContext.request.contextPath}/CategoryGameListServlet\",

                function (gamedata){

                    for(var i=0;i\<gamedata.length;i++){

                        console.log(gamedata\[i\].GameClassId);

                        contentG+=\"\<li value=\"+gamedata\[i\].GameClassId+\"\>\<a\>\"+ gamedata\[i\].GameClassName+\"\</a\>\</li\>\"

                    }

                    \$(\"\#categoryUIGame\").html(contentG)

                },

                \"json\"

            );

        });

        \$(function(){

             var contentMovieList=\"\";

             \$.post(

                 \"\${pageContext.request.contextPath}/MovieListServlet\",

                function (movielistdata){

                     for(var i=0;i\<movielistdata.length;i++){

                         contentMovieList+=   \"\<figure\>\\n\" +

                             \"          \<a href=\\\"details.jsp?movieid=\"+movielistdata\[i\].movieId+\"\\\"\>\<img  src=\\\"pics/moviePics/\"+movielistdata\[i\].haibao+\"\\\" alt=\\\"\#\\\"\> \</a\>\\n\" +

                             \"            \<figcaption\>\\n\" +

                             \"                \<strong class=\\\"title\\\"\>\\n\" +

                             \"                    \<a href=\\\"details.jsp?movieid=\"+movielistdata\[i\].movieId+\"\\\"style=\\\"text-decoration:none;\\n\" +

                             \"color:\#333;\\n\" +

                             \"\\\"\>\"+movielistdata\[i\].heading+\"\</a\>\\n\" +

                             \"                  \</strong\>\\n\" +

                             \"                \<div class=\\\"info\\\"\>\\n\" +

                             \"                    \<em class=\\\"sat\\\"\>满意度 77%\</em\>\\n\" +

                             \"                    \<span class=\\\"price\\\"\>¥ \<strong\>32432\</strong\> 起\</span\>\\n\" +

                             \"                \</div\>\\n\" +

                             \"            \</figcaption\>\\n\" +

                             \"        \</figure\> \"

                     }

                    \$(\"\#MovieUIList\").html(contentMovieList)

                },

                \"json\"

             );

        });

    });

\</script\>

\<div class=\"daming_header\"\>

    \<ul\>

        \<li\>

            \<img class=\"img1\" alt=\"web picture\" src=\"pics/main-logo-alt.png\"\>

        \</li\>

        \<li class=\"search\"\>

            \<input class=\"input\" placeholder=\"搜索\....\" type=\"text\"\>  \<button class=\"buttn\"\>搜索\</button\>

        \</li\>

        \<li\>

            \<i class=\"iconfont\" \>\<p class=\"user-icon\"\>&\#xe609;\</p\>\</i\>

        \</li\>

    \</ul\>

\</div\>

\<!\--begin of lunbotu \--\>

\<div class=\"containerCarousel\"\>

    \<div class=\"row\"\>

        \<!\-- 当同一个页面中,同时存在多个轮播图时,不同的轮播图以及他的控制按钮,需要有相对应id值 \--\>

        \<div id=\"myCarousel\" class=\"carousel slide col-lg-12 col-md-12 col-xs-12 col-sm-12\" data-ride=\"carousel\" data-interval=\"2000\" style=\"height: 300px;\"\>

            \<!\-- 轮播(Carousel)指标 \--\>

            \<!\-- data-target 指向被控制的轮播图 \--\>

            \<!\-- data-slide-to 表示点击这个点时,需要跳转到第几页 \--\>

            \<ol class=\"carousel-indicators\"\>

                \<li data-target=\"\#myCarousel\" data-slide-to= \"0\" class=\"active\"\>\</li\>

                \<li data-target=\"\#myCarousel\" data-slide-to= \"1\" \>\</li\>

                \<li data-target=\"\#myCarousel\" data-slide-to= \"2\" \>\</li\>

            \</ol\>

            \<!\-- 轮播项目 \--\>

            \<!\-- 一个item表示一页 \--\>

            \<!\-- active表示当前正在显示的一页 \--\>

            \<!\-- carousel-caption 轮播图中的字幕 \--\>

            \<!\-- 显示在轮播图中心偏下的位置 \--\>

            \<!\--\<div class=\"carousel-caption\"\>\--\>

            \<div class=\"carousel-inner\"\>

                \<div class=\"item active\"\>

                    \<img  src=\"pics/lunbotu/lunbotu1.jpg\" style=\"display: block;width:100%;height: 300px;\"/\>

                    \<div class=\"carousel-caption\"\>1\</div\>

                \</div\>

                \<div class=\"item\"\>

                    \<img  src=\"pics/lunbotu/lunbotu2.jpg\"  style=\"display: block;width:100%;height: 300px;\"/\>

                    \<div class=\"carousel-caption\"\>2\</div\>

                \</div\>

                \<div class=\"item\"\>

                    \<img  src=\"pics/lunbotu/lunbotu3.jpg\" style=\"display: block;width:100%;height: 300px;\"/\>

                    \<div class=\"carousel-caption\"\> 3\</div\>

                \</div\>

            \</div\>

            \<!\-- 轮播（Carousel）导航 \--\>

            \<!\-- Controls 左右的翻页箭头 \--\>

            \<!\-- 翻页控制中,href属性指向所控制的轮播图 \--\>

            \<!\-- data-slide 表示翻页的方向 \--\>

            \<a class=\"left carousel-control\" href=\"\#myCarousel\" role=\"button\" data-slide=\"prev\"\>

                \<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"\>\</span\>

                \<span class=\"sr-only\"\>Previous\</span\>

            \</a\>

            \<a class=\"right carousel-control\" href=\"\#myCarousel\" role=\"button\" data-slide=\"next\"\>

                \<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"\>\</span\>

                \<span class=\"sr-only\"\>Next\</span\>

            \</a\>

        \</div\>

    \</div\>

\</div\>

\<!\--end of lunbotu \--\>

\<div class=\"mainMid\"\>

    \<div class=\"daming_class\"\>

        \<ul\> \<li\>

            \<h2 \>电影\</h2\>

            \<ul id=\"categoryUlMovie\"  style=\"margin-top:5px; padding: 5px;\"\>

            \</ul\>

        \</li\>

            \<li\>

                \<h2\>游戏\</h2\>

                \<ul id=\"categoryUIGame\" style=\"margin-top:5px; padding: 5px;  \"\>

                \</ul\>

            \</li\>

        \</ul\>

    \</div\>

    \<div id=\"MovieUIList\" class=\"daming_ClassDetail\"\>

    \</div\>

\</div\>

\<div class=\"daming_footer\"\>

    \<p class=\"legal\"\>版权所有Copyright © 2018 New Media Limited All Rights Reserved.\</p\>

    \<p class=\"credit\"\>Designed by \<a href=\"\#\"\>金达明\</a\>.\</p\>

\</div\>

\</body\>

\</html\>
```

商品详情页：

代码：

```html
<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %\>

\<!DOCTYPE html\>

\<html lang=\"en\"\>

\<%\@page import= \"com.demo.dao.\*\"%\>

\<%\@page import= \"com.demo.bean.\*\"%\>

\<%@ page import=\"java.util.ArrayList\" %\>

\<%

  String movieid=request.getParameter(\"movieid\");

  if(movieid==null){

      movieid=\"1\";

  }

int MovieId=Integer.parseInt(movieid.trim());

   Movie movie = new MovieDAo().finMovieById(MovieId);

    if(movie==null){

        movie=new Movie();

    }

    ArrayList\<Movie\> movies = new ArrayList\<\>();

    movies = new MovieDAo().getMovie();

%\>

\<head\>

    \<script src=\"js/jquery-1.12.4.min.js\" \>\</script\>

    \<script src=\"js/vue.js\"\>\</script\>

    \<meta charset=\"UTF-8\"\>

    \<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"\>

    \<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\"\>

    \<title\>Document\</title\>

    \<script src=\"js/jquery-1.12.4.min.js\" \>\</script\>

    \<link href=\"bootstrap-3.3.7/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\>

    \<script src=\"bootstrap-3.3.7/js/bootstrap.min.js\"\>

    \</script\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"css/common.css\"\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"pics/icon/user/iconfont.css\"\>

    \<link type=\"text/css\" rel=\"stylesheet\" href=\"css/detail.css\"\>

\</head\>

\<body\>

\<div id=\"app\"\>

    \<div :style=\"{opacity: opacity}\" class=\"nav\"\>

        \<div class=\"header-new-title\"\>

            \<nav class=\"detail_anchor\"\>

                \<a href=\"javascript:\" dtype=\"item\" :class=\"{\'active\': active==\'goods\'}\"

                   \@click=\"onScrollGoods\"\>\<span\>商品\</span\>\</a\>

                \<a href=\"javascript:\" dtype=\"comment\" :class=\"{\'active\': active==\'comment\'}\"

                   \@click=\"onScrollComment\"\>\<span\>评价\</span\>\</a\>

                \<a href=\"javascript:\" dtype=\"guess\" :class=\"{\'active\': active==\'recommend\'}\"

                   \@click=\"onScrollRecommend\"\>\<span\>推荐\</span\>\</a\>

                \<a href=\"javascript:\" dtype=\"detail\" :class=\"{\'active\': active==\'detail\'}\"

                   \@click=\"onScrollDetail\"\>\<span\>详情\</span\>\</a\>

            \</nav\>

        \</div\>

    \</div\>

    \<div class=\"daming_header\"\>

        \<ul\>

            \<li\>

                \<img class=\"img1\" alt=\"web picture\" src=\"pics/main-logo-alt.png\"\>

            \</li\>

            \<li class=\"search\"\>

                \<input class=\"input\" placeholder=\"搜索\....\" type=\"text\"\>  \<button class=\"buttn\"\>搜索\</button\>

            \</li\>

            \<li\>

                \<i class=\"iconfont\" \>\<p class=\"user-icon\"\>&\#xe609;\</p\>\</i\>

            \</li\>

        \</ul\>

    \</div\>

    \<!\--begin of lunbotu \--\>

    \<div class=\"containerCarousel\"\>

        \<div class=\"row\"\>

            \<!\-- 当同一个页面中,同时存在多个轮播图时,不同的轮播图以及他的控制按钮,需要有相对应id值 \--\>

            \<div id=\"myCarousel\" class=\"carousel slide col-lg-12 col-md-12 col-xs-12 col-sm-12\" data-ride=\"carousel\" data-interval=\"2000\" style=\"height: 300px;\"\>

                \<!\-- 轮播(Carousel)指标 \--\>

                \<!\-- data-target 指向被控制的轮播图 \--\>

                \<!\-- data-slide-to 表示点击这个点时,需要跳转到第几页 \--\>

                \<ol class=\"carousel-indicators\"\>

                    \<li data-target=\"\#myCarousel\" data-slide-to= \"0\" class=\"active\"\>\</li\>

                \</ol\>

                \<!\-- 轮播项目 \--\>

                \<!\-- 一个item表示一页 \--\>

                \<!\-- active表示当前正在显示的一页 \--\>

                \<!\-- carousel-caption 轮播图中的字幕 \--\>

                \<!\-- 显示在轮播图中心偏下的位置 \--\>

                \<!\--\<div class=\"carousel-caption\"\>\--\>

                \<div class=\"carousel-inner\"\>

                    \<div class=\"item active\"\>

                        \<img  src=\"pics/moviePics/\<%=movie.getHaibao()%\>\" style=\"display: block;width:100%;height: 300px;\"/\>

                        \<div class=\"carousel-caption\"\>\<%=movie.getHeading()%\>\</div\>

                    \</div\>

                \</div\>

                \<!\-- 轮播（Carousel）导航 \--\>

                \<!\-- Controls 左右的翻页箭头 \--\>

                \<!\-- 翻页控制中,href属性指向所控制的轮播图 \--\>

                \<!\-- data-slide 表示翻页的方向 \--\>

                \<a class=\"left carousel-control\" href=\"\#myCarousel\" role=\"button\" data-slide=\"prev\"\>

                    \<span class=\"glyphicon glyphicon-chevron-left\" aria-hidden=\"true\"\>\</span\>

                    \<span class=\"sr-only\"\>Previous\</span\>

                \</a\>

                \<a class=\"right carousel-control\" href=\"\#myCarousel\" role=\"button\" data-slide=\"next\"\>

                    \<span class=\"glyphicon glyphicon-chevron-right\" aria-hidden=\"true\"\>\</span\>

                    \<span class=\"sr-only\"\>Next\</span\>

                \</a\>

            \</div\>

        \</div\>

    \</div\>

    \<!\--end of lunbotu \--\>

    \<div class=\"goods\"\>

        \<div class=\"goods-name\"\>\<%=movie.getTitle()%\>\</div\>

        \<div class=\"goods-author\" v-for=\"(item, index) in 1\" :key=\"index\"\>\<%=movie.getDirector()%\> 导演\</div\>

        \<div class=\"goods-price\"\>商城价：￥99起\</div\>

    \</div\>

    \<hr\>

    \<div class=\"comment\" ref=\"comment\" id=\"comment\"\>

        \<div class=\"comment-header\"\>精选评价\</div\>

        \<div v-for=\"(item, index) in 1\" :key=\"index\"\>

            \<div class=\"title\"\>\<span class=\"comment-username\"\>胖鸟风中凌乱\</span\>\<span class=\"comment-time\"\>2020-12-{{item}}\</span\>\</div\>

            \<div class=\"comment-content\"\>我看过3D电影，也看过MP4视频，但是都没有蓝光DVD看得安逸\</div\>

        \</div\>

    \</div\>

    \<hr\>

    \<div class=\"recommend\" ref=\"recommend\" id=\"recommend\"\>

        \<div class=\"recommend-header\"\>猜你喜欢\</div\>

\<div class=\"recommendFig\"\>

\<%for(int i=0;i\<6;i++){%\>

        \<figure\>

            \<img src=\"pics/moviePics/\<%=movie.getHaibao()%\>\" alt=\"\#\"\>

            \<figcaption\>

                \<strong class=\"title\"\>

                    &lt;\<%=movie.getHeading()%\>&gt;\</strong\>

                \<div class=\"info\"\>

                    \<em class=\"sat\"\>满意度 77%\</em\>

                    \<span class=\"price\"\>¥ \<strong\>32432\</strong\> 起\</span\>

                \</div\>

            \</figcaption\>

        \</figure\>

\<%}%\>

\</div\>

    \</div\>

    \<hr\>

    \<div ref=\"detail\"\>

        \<div\>\</div\>

        \<div\>

            \<h1 class=\"detail-info\"\>内容简介\</h1\>

            \<div class=\"previewedVideo\"\>

                \<video style=\"width: 100%;height: auto;\" class=\"video1\" src=\"video/avator/avator.mp4\" controls loop\> 你的浏览器不支持video标签 \</video\>

            \</div\>

            \<p\>\<%=movie.getContent()%\>\</p\>

            \<img v-for=\"(item, index) in 3\" :key=\"index\" style=\" width: 100%;\" src=\"pics/moviePics/\<%=movie.getHaibao()%\>\" alt=\"\"\>

        \</div\>

        \<div class=\"daming_footer\"\>

            \<p class=\"legal\"\>版权所有Copyright © 2018 New Media Limited All Rights Reserved.\</p\>

            \<p class=\"credit\"\>Designed by \<a href=\"\#\"\>金达明\</a\>.\</p\>

        \</div\>

    \</div\>

\</div\>

\<div class=\"de_btn_bar\"\>

    \<div class=\"btn_group\"\>

        \<div class=\"btn_group_item\" style=\"width: 16%;\"\>客服\</div\>

        \<div class=\"btn_group_item\" style=\"width: 16%;\"\> \<a href=\"index.jsp\"\>首页 \</a\>\</div\>

        \<div class=\"btn_group_item\" style=\"width: 18%;\"\>\<a href=\"cart.jsp\"\>购物车\</a\>\</div\>

        \<div  class=\"btn_group_item add_cart\"\>加入购物车\</div\>

        \<div class=\"btn_group_item now_buy\"\>立即购买\</div\>

    \</div\>

\</div\>

\</body\>

\<script type=\"text/javascript\"  language=\"JavaScript\" src=\"js/detail.js\" \>\</script\>

\</html\>
```

购物车界面

```jsp
<%\--

  Created by IntelliJ IDEA.

  User: 12575

  Date: 2021/1/4

  Time: 13:24

  To change this template use File \| Settings \| File Templates.

\--%\>

\<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %\>

\<html\>

\<head\>

    \<meta charset=\"utf-8\" name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0\"/\>

    \<link rel=\"stylesheet\" href=\"css/cart.css\" type=\"text/css\"\>

    \<link rel=\"stylesheet\" href=\"css/common.css\" type=\"text/css\"\>

    \<script src=\"js/cart.js\" type=\"text/javascript\"\>\</script\>

    \<title\>Title\</title\>

\</head\>

\<body\>

\<header class=\"daming_topBar\"\>

    \<a href=\"index.jsp\" class=\"icon_back\"\>\</a\>

    \<h3\>购物车\</h3\>

    \<a href=\"\#\" class=\"icon_menu\"\>  \</a\>

\</header\>

\<div class=\"daming_safeTip\"\>

    \<p\>您正在安全购物环境中，请放心购物\</p\>

\</div\>

\<div class=\"daming_shop\"\>

    \<div class=\"daming_shop_tit\"\>

        \<div class=\"daming_shop_tit_left\"\>

        \</div\>

        \<div class=\"daming_shop_tit_right\"\>

            \<img class=\"imgBox\" src=\"pics/cart/logo2.png\" alt=\"\"/\>

            \<span class=\"name m_110\"\>自营\</span\>

            \<span class=\"tip m_r10\"\>您享受满99免运费服务\</span\>

        \</div\>

    \</div\>

    \<div class=\"daming_shop_con\"\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn1\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn2\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn3\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn4\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn5\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn6\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn7\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn8\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn9\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_product\"\>

            \<div class=\"daming_product_left\"\>

                \<a href=\"\#\" class=\"daming_check_box\" checked\>\</a\>

            \</div\>

            \<div class=\"daming_product_right\"\>

                \<a class=\"product_img\" href=\"\#\"\>\<img src=\"pics/details/avator/avator-slide1.jpg\" alt=\"\#\" /\>\</a\>

                \<div class=\"product_info\"\>

                    \<a class=\"name\" href=\"\#\"\>正版 阿凡达蓝光碟 3D BD50高清科幻片电影1080p蓝光碟片\</a\>

                    \<p class=\"price\"\>&yen;1000.00\</p\>

                    \<div class=\"option\"\>

                        \<div class=\"f_left\"\>

                            \<span\>-\</span\>

                            \<input type=\"tel\"\>

                            \<span\>+\</span\>

                        \</div\>

                        \<div class=\"f_right deleteBox\" id=\"btn10\"\>

                            \<span class=\"up\"\>\</span\>

                            \<span class=\"down\"\>\</span\>

                        \</div\>

                    \</div\>

                \</div\>

            \</div\>

        \</div\>

        \<div class=\"daming_win\"\>

            \<div class=\"daming_win_box\"\>

                \<div class=\"text\"\>你确定删除这个商品吗？\</div\>

                \<div class=\"btn clearfix\"\>

                    \<a href=\"\" class=\"cancel\"\>取消\</a\>

                    \<a href=\"\" class=\"submit\"\>确定\</a\>

                \</div\>

            \</div\>

        \</div\>

    \</div\>

\</div\>

\</body\>

\</html\>
```



3.  界面截图

首页：

![](media/image1.png){width="3.1043471128608924in" height="6.992672790901137in"}

![](media/image2.png){width="3.826388888888889in" height="8.469444444444445in"}

商品详情页：

![](media/image3.png){width="3.978669072615923in" height="8.478106955380577in"}

![](media/image4.png){width="4.189583333333333in" height="9.693055555555556in"}

购物车：

![](media/image5.png){width="4.072407042869641in" height="8.863475503062118in"}

4.  总结

本次大作业不仅对div+css的布局有了更深刻的认识，在实现更好的功能的同时学习了jQuery和vue和bootstrap框架的知识，还有对数据传输也对前端通过jQuery数据的请求和后端java的servlet的接收并返回json数据，最后json数据在前端进行拼接输出的过程有了一次实际的成功应用。
