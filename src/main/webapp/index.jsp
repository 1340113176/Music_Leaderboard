<%@page pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>排行榜</title>
    <link rel="shortcut icon" type="images/x-ico" href="img/tubiao.ico">
    <!--引入semantic.min.css样式文件-->
    <link rel="stylesheet" href="lib/semantic/semantic.min.css">
    <!--引入semantic.min.js脚本文件-->
    <script src="lib/semantic/semantic.min.js"></script>
    <style>
        body{
            background: url(img/bejing.png);
            background-size: 100% auto;
            margin: 30px 0px 30px 0px;
        }
        #biaotii{
            color: peachpuff;
            font-size:80px;
            font-family: 华文行楷;
            text-align: center;
        }
        #zong{
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div id="biaotii">
    <p>排行榜</p>
</div>
<div class="ui grid" id="zong">
    <div class="eight wide column" id="music">
        <a href="index_music.jsp" target="_blank">
            <img src="img/yinyue.png" width="300px" height="300px"/>
        </a>
        <p style="font-size: 20px;margin-top: 10px;color:green;">各大网站音乐排行榜</p>
    </div>
    <div class="eight wide column" id="movie">
        <a href="index_movie.jsp" target="_blank">
            <img src="img/dianying.png" width="400px" height="300px"/>
        </a>
        <p style="font-size: 20px;margin-top: 10px;color:white;">各大网站电影排行榜</p>
    </div>
</div>
</body>
</html>
