<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%@page import= "com.demo.dao.*"%>
<%@page import= "com.demo.bean.*"%>
<%@ page import="java.util.ArrayList" %>
<%
  String movieid=request.getParameter("movieid");
  if(movieid==null){
      movieid="1";
  }
int MovieId=Integer.parseInt(movieid.trim());
   Movie movie = new MovieDAo().finMovieById(MovieId);
    if(movie==null){
        movie=new Movie();

    }


    ArrayList<Movie> movies = new ArrayList<>();
    movies = new MovieDAo().getMovie();
%>

<head>
    <script src="js/jquery-1.12.4.min.js" ></script>
    <script src="js/vue.js"></script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <script src="js/jquery-1.12.4.min.js" ></script>
    <link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap-3.3.7/js/bootstrap.min.js">
    </script>


    <link type="text/css" rel="stylesheet" href="css/common.css">
    <link type="text/css" rel="stylesheet" href="pics/icon/user/iconfont.css">
    <link type="text/css" rel="stylesheet" href="css/detail.css">
</head>



<body>



<div id="app">
    <div :style="{opacity: opacity}" class="nav">
        <div class="header-new-title">
            <nav class="detail_anchor">
                <a href="javascript:" dtype="item" :class="{'active': active=='goods'}"
                   @click="onScrollGoods"><span>商品</span></a>
                <a href="javascript:" dtype="comment" :class="{'active': active=='comment'}"
                   @click="onScrollComment"><span>评价</span></a>
                <a href="javascript:" dtype="guess" :class="{'active': active=='recommend'}"
                   @click="onScrollRecommend"><span>推荐</span></a>
                <a href="javascript:" dtype="detail" :class="{'active': active=='detail'}"
                   @click="onScrollDetail"><span>详情</span></a>
            </nav>
        </div>
    </div>


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

                </ol>
                <!-- 轮播项目 -->
                <!-- 一个item表示一页 -->
                <!-- active表示当前正在显示的一页 -->
                <!-- carousel-caption 轮播图中的字幕 -->
                <!-- 显示在轮播图中心偏下的位置 -->
                <!--<div class="carousel-caption">-->
                <div class="carousel-inner">
                    <div class="item active">
                        <img  src="pics/moviePics/<%=movie.getHaibao()%>" style="display: block;width:100%;height: 300px;"/>
                        <div class="carousel-caption"><%=movie.getHeading()%></div>
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




    <div class="goods">
        <div class="goods-name"><%=movie.getTitle()%></div>
        <div class="goods-author" v-for="(item, index) in 1" :key="index"><%=movie.getDirector()%> 导演</div>
        <div class="goods-price">商城价：￥99起</div>

    </div>

    <hr>

    <div class="comment" ref="comment" id="comment">
        <div class="comment-header">精选评价</div>
        <div v-for="(item, index) in 1" :key="index">
            <div class="title"><span class="comment-username">胖鸟风中凌乱</span><span class="comment-time">2020-12-{{item}}</span></div>
            <div class="comment-content">我看过3D电影，也看过MP4视频，但是都没有蓝光DVD看得安逸</div>
        </div>
    </div>
    <hr>

    <div class="recommend" ref="recommend" id="recommend">
        <div class="recommend-header">猜你喜欢</div>
<div class="recommendFig">
<%for(int i=0;i<6;i++){%>
        <figure>
            <img src="pics/moviePics/<%=movie.getHaibao()%>" alt="#">
            <figcaption>
                <strong class="title">
                    &lt;<%=movie.getHeading()%>&gt;</strong>
                <div class="info">
                    <em class="sat">满意度 77%</em>
                    <span class="price">¥ <strong>32432</strong> 起</span>
                </div>
            </figcaption>
        </figure>
<%}%>
</div>


    </div>
    <hr>

    <div ref="detail">
        <div></div>
        <div>
            <h1 class="detail-info">内容简介</h1>

            <div class="previewedVideo">
                <video style="width: 100%;height: auto;" class="video1" src="video/avator/avator.mp4" controls loop> 你的浏览器不支持video标签 </video>

            </div>

            <p><%=movie.getContent()%></p>



            <img v-for="(item, index) in 3" :key="index" style=" width: 100%;" src="pics/moviePics/<%=movie.getHaibao()%>" alt="">
        </div>

        <div class="daming_footer">
            <p class="legal">版权所有Copyright © 2018 New Media Limited All Rights Reserved.</p>
            <p class="credit">Designed by <a href="#">金达明</a>.</p>

        </div>
    </div>



</div>

<div class="de_btn_bar">
    <div class="btn_group">
        <div class="btn_group_item" style="width: 16%;">客服</div>
        <div class="btn_group_item" style="width: 16%;"> <a href="index.jsp">首页 </a></div>
        <div class="btn_group_item" style="width: 18%;"><a href="cart.jsp">购物车</a></div>
        <div  class="btn_group_item add_cart">加入购物车</div>
        <div class="btn_group_item now_buy">立即购买</div>
    </div>
</div>
</body>
<script type="text/javascript"  language="JavaScript" src="js/detail.js" ></script>
</html>