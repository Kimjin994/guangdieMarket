
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>商城首页</title>
    <script src="js/jquery-1.12.4.min.js" ></script>
    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-3.3.7/js/bootstrap.min.js">
    </script>
    <link type="text/css" rel="stylesheet" href="css/index.css">
    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="pics/icon/user/iconfont.css">

</head>
<body>
<script type="text/javascript">
    $(document).ready(function(){

        //index.jsp加载完毕后 去服务器端获得所有的category数据
        $(function(){
            var content = "";
            $.post(
                "${pageContext.request.contextPath}/CategoryMovieListServlet",//发送至servlet
                function(moviedata){
                    for(var i=0;i<moviedata.length;i++){

                        content+="<li value="+moviedata[i].classid+"><a>"+moviedata[i].classname+"</a></li>";
                    }
                    //将拼接好的li放置到ul中
                    $("#categoryUlMovie").html(content);
                    },
                    "json"
                    );
        });
        $(function (){
            var contentG="";
            $.post(
                "${pageContext.request.contextPath}/CategoryGameListServlet",
                function (gamedata){
                    for(var i=0;i<gamedata.length;i++){
                        console.log(gamedata[i].GameClassId);
                        contentG+="<li value="+gamedata[i].GameClassId+"><a>"+ gamedata[i].GameClassName+"</a></li>"
                    }
                    $("#categoryUIGame").html(contentG)
                },
                "json"
            );

        });
        $(function(){
             var contentMovieList="";
             $.post(
                 "${pageContext.request.contextPath}/MovieListServlet",
                function (movielistdata){
                     for(var i=0;i<movielistdata.length;i++){
                         contentMovieList+=   "<figure>\n" +
                             "          <a href=\"details.jsp?movieid="+movielistdata[i].movieId+"\"><img  src=\"pics/moviePics/"+movielistdata[i].haibao+"\" alt=\"#\"> </a>\n" +
                             "            <figcaption>\n" +
                             "                <strong class=\"title\">\n" +
                             "                    <a href=\"details.jsp?movieid="+movielistdata[i].movieId+"\"style=\"text-decoration:none;\n" +
                             "color:#333;\n" +
                             "\">"+movielistdata[i].heading+"</a>\n" +
                             "                  </strong>\n" +
                             "                <div class=\"info\">\n" +
                             "                    <em class=\"sat\">满意度 77%</em>\n" +
                             "                    <span class=\"price\">¥ <strong>32432</strong> 起</span>\n" +
                             "                </div>\n" +
                             "            </figcaption>\n" +
                             "        </figure> "
                     }
                    $("#MovieUIList").html(contentMovieList)
                },
                "json"
             );
        });
    });
</script>
<div class="daming_header">
    <ul>
        <li>
            <img class="img1" alt="web picture" src="pics/main-logo-alt.png">
        </li>
        <li class="search">
            <input class="input" placeholder="搜索...." type="text">	<button class="buttn">搜索</button>
        </li>
        <li>
            <i class="iconfont" ><p class="user-icon">&#xe609;</p></i>
        </li>
    </ul>
</div>
<!--begin of lunbotu -->

<div class="containerCarousel">
    <div class="row">
        <!-- 当同一个页面中,同时存在多个轮播图时,不同的轮播图以及他的控制按钮,需要有相对应id值 -->
        <div id="myCarousel" class="carousel slide col-lg-12 col-md-12 col-xs-12 col-sm-12" data-ride="carousel" data-interval="2000" style="height: 300px;">
            <!-- 轮播(Carousel)指标 -->
            <!-- data-target 指向被控制的轮播图 -->
            <!-- data-slide-to 表示点击这个点时,需要跳转到第几页 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to= "0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to= "1" ></li>
                <li data-target="#myCarousel" data-slide-to= "2" ></li>
            </ol>
            <!-- 轮播项目 -->
            <!-- 一个item表示一页 -->
            <!-- active表示当前正在显示的一页 -->
            <!-- carousel-caption 轮播图中的字幕 -->
            <!-- 显示在轮播图中心偏下的位置 -->
            <!--<div class="carousel-caption">-->
            <div class="carousel-inner">
                <div class="item active">
                    <img  src="pics/lunbotu/lunbotu1.jpg" style="display: block;width:100%;height: 300px;"/>
                    <div class="carousel-caption">1</div>
                </div>
                <div class="item">
                    <img  src="pics/lunbotu/lunbotu2.jpg"  style="display: block;width:100%;height: 300px;"/>
                    <div class="carousel-caption">2</div>
                </div>
                <div class="item">
                    <img  src="pics/lunbotu/lunbotu3.jpg" style="display: block;width:100%;height: 300px;"/>
                    <div class="carousel-caption"> 3</div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <!-- Controls 左右的翻页箭头 -->
            <!-- 翻页控制中,href属性指向所控制的轮播图 -->
            <!-- data-slide 表示翻页的方向 -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>
</div>
<!--end of lunbotu -->
<div class="mainMid">

    <div class="daming_class">

        <ul> <li>
            <h2 >电影</h2>

            <ul id="categoryUlMovie"  style="margin-top:5px; padding: 5px;">
            </ul>
        </li>
            <li>
                <h2>游戏</h2>
                <ul id="categoryUIGame" style="margin-top:5px; padding: 5px;  ">
                </ul>
            </li>
        </ul>
    </div>
    <div id="MovieUIList" class="daming_ClassDetail">
    </div>
</div>
<div class="daming_footer">
    <p class="legal">版权所有Copyright © 2018 New Media Limited All Rights Reserved.</p>
    <p class="credit">Designed by <a href="#">金达明</a>.</p>
</div>
</body>
</html>
