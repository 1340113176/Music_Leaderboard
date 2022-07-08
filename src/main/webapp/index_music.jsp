<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<html>
<head>
    <meta charset="utf-8" />
    <title>各大网站音乐排行榜</title>
    <link rel="shortcut icon" type="images/x-ico" href="img/biaoti.ico">
    <!--引入semantic.min.css样式文件-->
    <link rel="stylesheet" href="lib/semantic/semantic.min.css">
    <!--引入semantic.min.js脚本文件-->
    <script src="lib/semantic/semantic.min.js"></script>

    <style>
        body{
            background:url("img/12eea05bcec3ed041a3e607b287012dd.jpg");
            background-size: 100% auto;
        }
        #zong{
            margin-left: 10px;           
        }
        #kugou_img,#QQ_img,#kuwo_img{
            margin-top: 10px;      
        }
        #jiuku_img,#yiting_img{
            margin-top: 15px;
            margin-bottom: 5px;
        }
        #kugou,#QQ,#kuwo,#jiuku,#yiting{
            margin-left: 10px;
        }
        #one_table,#two_table,#three_table,#four_table,#five_table{
        	text-align: center;
        }
		#kugou_table,#qq_table,#kuwo_table,#jiuku_table,#yiting_table{
			margin-top:10px;
			overflow:auto;
            height:550px;           
		}
		#kugou_table::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#qq_table::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#kuwo_table::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#jiuku_table::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#yiting_table::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#p{
			text-align: center;
		}
    </style>

</head>

<body>
    <%
	    Class.forName("com.mysql.jdbc.Driver"); //加载驱动程序
	    String url = "jdbc:mysql://localhost:3306/music";
	    String user = "root";//mysql用户名
	    String password = "root"; //mysql密码
	    Connection conn = (Connection) DriverManager.getConnection(url,user,password);//连接数据库
    %>
    <div class="ui grid" id="zong">
        <!--3宽度列:酷狗-->
        <div class="three wide column" id="kugou">
            <img class="ui centered image" src="img/酷狗音乐.png" id="kugou_img" width="170px" height="60px"/>
            <p id="p">
	            <%
		            if(conn != null){
		            	out.print("数据库连接成功！");
		            }
	            %>
            </p>
            <div id="kugou_table">
            	<table class="ui fixed table" id="one_table">
            		<thead>
		                <tr>
		                	<td colspan="4">酷狗Top500(前22)</td>
		                </tr>
	                </thead> 
	                <thead>  
		                <tr>
		                	<th>排名</th>
		                	<th>歌名</th>
		                    <th>歌手</th>
		                    <th>时间</th>
		                </tr>
	                </thead>                
	                <tbody>
	                    <%
		                    String sql_1 = "select * from kugou_music";
		                    Statement stmt_1 = conn.createStatement();
		                    ResultSet rs_1 = stmt_1.executeQuery(sql_1);                   	
		                    while(rs_1.next()){
	                    %>
		                    	<tr>
		                    		<td><%out.print(rs_1.getString(1));%></td>
		                    		<td><%out.print(rs_1.getString(2));%></td>
		                    		<td><%out.print(rs_1.getString(3));%></td>
		                    		<td><%out.print(rs_1.getString(4));%></td>
		                    	</tr>
		                    <%
		                    }
		                    %>           	
	                </tbody>
            	</table>
            </div>                                             
        </div>
        <!--3宽度列:QQ-->
        <div class="three wide column" id="QQ">
            <img class="ui centered image" src="img/QQ音乐.png" id="QQ_img" width="170px" height="60px"/>
            <p id="p">
	            <%
		            if(conn != null){
		            	out.print("数据库连接成功！");
		            }
	            %>
            </p>
            <div id="qq_table">
	            <table class="ui fixed table" id="two_table">
	                <thead>
		                <tr>
		                	<td colspan="4">qq飙升榜(前20)</td>
		                </tr>
	                </thead> 
	                <thead>  
		                <tr>
		                	<th>排名</th>
		                	<th>歌名</th>
		                    <th>歌手</th>
		                    <th>时间</th>
		                </tr>
	                </thead> 
	                <tbody>
	                    <%
		                    String sql_2 = "select * from qq_music";
		                    Statement stmt_2 = conn.createStatement();
		                    ResultSet rs_2 = stmt_2.executeQuery(sql_2);                   	
		                    while(rs_2.next()){
	                    %>
		                    	<tr>
		                    		<td><%out.print(rs_2.getString(1));%></td>
		                    		<td><%out.print(rs_2.getString(2));%></td>
		                    		<td><%out.print(rs_2.getString(3));%></td>
		                    		<td><%out.print(rs_2.getString(4));%></td>
		                    	</tr>
		                    <%
		                    }
		                    %>           	
	                </tbody>
	            </table>
            </div>
        </div>
        <!--3宽度列:酷我-->
        <div class="three wide column" id="kuwo">
            <img class="ui centered image" src="img/酷我音乐.png" id="kuwo_img" width="170px" height="60px"/>
            <p id="p">
	            <%
		            if(conn != null){
		            	out.print("数据库连接成功！");
		            }
	            %>
            </p>
            <div id="kuwo_table">
	            <table class="ui fixed table" id="three_table">
	                <thead>
		                <tr>
		                	<td colspan="4">酷我飙升榜(前330)</td>
		                </tr>
	                </thead> 
	                <thead>  
		                <tr>
		                	<th>排名</th>
		                	<th>歌名</th>
		                    <th>歌手</th>
		                    <th>时间</th>
		                </tr>
	                </thead>
	                <tbody>
	                    <%
		                    String sql_3 = "select * from kuwo_music";
		                    Statement stmt_3 = conn.createStatement();
		                    ResultSet rs_3 = stmt_3.executeQuery(sql_3);                   	
		                    while(rs_3.next()){
	                    %>
		                    	<tr>
		                    		<td><%out.print(rs_3.getString(1));%></td>
		                    		<td><%out.print(rs_3.getString(2));%></td>
		                    		<td><%out.print(rs_3.getString(3));%></td>
		                    		<td><%out.print(rs_3.getString(4));%></td>
		                    	</tr>
		                    <%
		                    }
		                    %>           	
	                </tbody>
	            </table>
           	</div> 
        </div>
        <!--3宽度列:九酷-->
        <div class="three wide column" id="jiuku">
            <img class="ui centered image" src="img/九酷音乐.png" id="jiuku_img" width="170px" height="50px"/>
            <p id="p">
	            <%
		            if(conn != null){
		            	out.print("数据库连接成功！");
		            }
	            %>
            </p>
            <div id="jiuku_table">
	            <table class="ui fixed table" id="four_table">
	                <thead>
		                <tr>
		                	<td colspan="4">九酷音乐TOP500(前300)</td>
		                </tr>
	                </thead> 
	                <thead>  
		                <tr>
		                	<th>排名</th>
		                	<th>歌名</th>
		                    <th>歌手</th>
		                    <th>时间</th>
		                </tr>
	                </thead>
	                <tbody>
	                    <%
		                    String sql_4 = "select * from jiuku_music";
		                    Statement stmt_4 = conn.createStatement();
		                    ResultSet rs_4 = stmt_4.executeQuery(sql_4);                   	
		                    while(rs_4.next()){
	                    %>
		                    	<tr>
		                    		<td><%out.print(rs_4.getString(1));%></td>
		                    		<td><%out.print(rs_4.getString(2));%></td>
		                    		<td><%out.print(rs_4.getString(3));%></td>
		                    		<td><%out.print(rs_4.getString(4));%></td>
		                    	</tr>
		                    <%
		                    }
		                    %>           	
	                </tbody>
	            </table> 
            </div>
        </div>
        <!--3宽度列:一听-->        
        <div class="three wide column" id="yiting">
            <img class="ui centered image" src="img/一听音乐.png" id="yiting_img" width="170px" height="50px"/>
            <p id="p">
	            <%
		            if(conn != null){
		            	out.print("数据库连接成功！");
		            }
	            %>
            </p>
            <div id="yiting_table">
	            <table class="ui fixed table" id="five_table">
	                <thead>
		                <tr>
		                	<td colspan="4">一听音乐网(最新歌曲)(前96)</td>
		                </tr>
	                </thead> 
	                <thead>  
		                <tr>
		                	<th>排名</th>
		                	<th>歌名</th>
		                    <th>歌手</th>
		                    <th>时间</th>
		                </tr>
	                </thead>
	                <tbody>
	                    <%
		                    String sql_5 = "select * from yiting_music";
		                    Statement stmt_5 = conn.createStatement();
		                    ResultSet rs_5 = stmt_5.executeQuery(sql_5);                   	
		                    while(rs_5.next()){
	                    %>
		                    	<tr>
		                    		<td><%out.print(rs_5.getString(1));%></td>
		                    		<td><%out.print(rs_5.getString(2));%></td>
		                    		<td><%out.print(rs_5.getString(3));%></td>
		                    		<td><%out.print(rs_5.getString(4));%></td>
		                    	</tr>
		                    <%
		                    }
		                    %>           	
	                </tbody>
	            </table> 
            </div>
        </div>
    </div>
</body>
</html>
