<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>各大网站电影排行榜</title>
    <link rel="shortcut icon" type="images/x-ico" href="img/bitbug_favicon.ico">
    <!--引入semantic.min.css样式文件-->
    <link rel="stylesheet" href="lib/semantic/semantic.min.css">
    <!--引入semantic.min.js脚本文件-->
    <script type="text/javascript" src="lib/semantic/semantic.min.js"></script>
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="lib/semantic/semantic.js"></script>
    
	<style>
		body{
			background: url(./img/beijing_2.jpg);
			background-size: 100% auto;
			margin: 30px 100px 30px 100px;
		}
		#biaoti{
			color: skyblue;
		}
		#douban::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#maoyan::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#aiqiyi::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#tengxun::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#leshi::-webkit-scrollbar-thumb{
			background-color:mediumaquamarine;
		}
		#one_table,#two_table,#three_table,#four_table,#five_table{
        	text-align: center;
        }
		#douban,#maoyan,#aiqiyi,#tengxun,#leshi{
			overflow:auto;
            height:650px;           
		}
	
	</style>
</head>
<body>
    <%
	    Class.forName("com.mysql.jdbc.Driver"); //加载驱动程序
	    String url = "jdbc:mysql://localhost:3306/movie";
	    String user = "root";//mysql用户名
	    String password = "root"; //mysql密码
	    Connection conn = (Connection) DriverManager.getConnection(url,user,password);//连接数据库
    %>
    <div class="ui top attached tabular menu">
		  <a class="item active" data-tab="first" id="biaoti">豆瓣电影top250</a>
		  <a class="item" data-tab="second" id="biaoti">猫眼电影top100</a>
		  <a class="item" data-tab="third" id="biaoti">爱奇艺热播榜_电影top50</a>
		  <a class="item" data-tab="fourth" id="biaoti">腾讯_高分好评榜_电影top30</a>
		  <a class="item" data-tab="fifth" id="biaoti">乐视_热播榜_电影top30</a>
	</div>
	<div class="ui bottom attached tab segment active" data-tab="first" id="douban">
		<table class="ui fixed table" id="one_table">
		    <thead>  
                <tr>
                	<th>排名</th>
                	<th>电影名</th>
                    <th>导演</th>
                    <th>主演</th>
                    <th>类别</th>
                    <th>国家</th>
                    <th>上映时间</th>
                    <th>评分</th>
                </tr>
            </thead>
		    <tbody>
                  <%
	                   String sql_1 = "select * from 豆瓣电影top250";
	                   Statement stmt_1 = conn.createStatement();
	                   ResultSet rs_1 = stmt_1.executeQuery(sql_1);                   	
	                   while(rs_1.next()){
                  %>
                   	<tr>
                   		<td><%out.print(rs_1.getString(1));%></td>
                   		<td><%out.print(rs_1.getString(2));%></td>
                   		<td><%out.print(rs_1.getString(3));%></td>
                   		<td><%out.print(rs_1.getString(4));%></td>
                   		<td><%out.print(rs_1.getString(5));%></td>
                   		<td><%out.print(rs_1.getString(6));%></td>
                   		<td><%out.print(rs_1.getString(7));%></td>
                   		<td><%out.print(rs_1.getString(8));%></td>
                   	</tr>
                   <%
                   }
                   %>           	
             </tbody>
		  </table>
	</div>
	<div class="ui bottom attached tab segment" data-tab="second" id="maoyan">
		<table class="ui fixed table" id="two_table">
			<thead>  
	            <tr>
	            	<th>排名</th>
	            	<th>电影名</th>
	                <th>主演</th>
	                <th>上映时间</th>
	                <th>评分</th>
	       		</tr>
	         </thead> 
	         <tbody>
	            <%
		             String sql_2 = "select * from 猫眼电影top100";
		             Statement stmt_2 = conn.createStatement();
		             ResultSet rs_2 = stmt_2.executeQuery(sql_2);                   	
		             while(rs_2.next()){
	            %>
	             	<tr>
	             		<td><%out.print(rs_2.getString(1));%></td>
	             		<td><%out.print(rs_2.getString(2));%></td>
	             		<td><%out.print(rs_2.getString(3));%></td>
	             		<td><%out.print(rs_2.getString(4));%></td>
	             		<td><%out.print(rs_2.getString(5));%></td>
	             	</tr>
	             <%
	             }
	             %>           	
	        </tbody>
        </table>
	</div>
	<div class="ui bottom attached tab segment " data-tab="third" id="aiqiyi">
        <table class="ui fixed table" id="three_table">
            <thead>  
                <tr>
                	<th>排名</th>
                	<th>电影名</th>
                    <th>简介</th>
                    <th>评分</th>
                    <th>热度</th>
                </tr>
            </thead>
            <tbody>
                <%
	                 String sql_3 = "select * from 爱奇艺热播榜_电影";
	                 Statement stmt_3 = conn.createStatement();
	                 ResultSet rs_3 = stmt_3.executeQuery(sql_3);                   	
	                 while(rs_3.next()){
                %>
                 	<tr>
                 		<td><%out.print(rs_3.getString(1));%></td>
                 		<td><%out.print(rs_3.getString(2));%></td>
                 		<td><%out.print(rs_3.getString(3));%></td>
                 		<td><%out.print(rs_3.getString(4));%></td>
                 		<td><%out.print(rs_3.getString(5));%></td>
                 	</tr>
                 <%
                 }
                 %>           	
            </tbody>
        </table>
	</div>
	<div class="ui bottom attached tab segment " data-tab="fourth" id="tengxun">
        <table class="ui fixed table" id="four_table">
           <thead>  
              <tr>
               	<th>排名</th>
               	<th>电影名</th>
                <th>主演</th>
                <th>观看量</th>
                <th>时长</th>
                <th>评分</th>
              </tr>
           </thead>
           <tbody>
                <%
	                String sql_4 = "select * from 腾讯_高分好评榜_电影top30";
	                Statement stmt_4 = conn.createStatement();
	                ResultSet rs_4 = stmt_4.executeQuery(sql_4);                   	
	                while(rs_4.next()){
                %>
                	<tr>
                  		<td><%out.print(rs_4.getString(1));%></td>
                  		<td><%out.print(rs_4.getString(2));%></td>
                  		<td><%out.print(rs_4.getString(3));%></td>
                  		<td><%out.print(rs_4.getString(4));%></td>
                  		<td><%out.print(rs_4.getString(5));%></td>
                  		<td><%out.print(rs_4.getString(6));%></td>
                  	</tr>
                <%
                }
                %>           	
            </tbody>
        </table>
	</div>
	<div class="ui bottom attached tab segment" data-tab="fifth" id="leshi">
		<table class="ui fixed table" id="five_table">
           <thead>  
              <tr>
               	<th>排名</th>
               	<th>电影名</th>
                <th>简介</th>
                <th>评分</th>
              </tr>
           </thead>
           <tbody>
               <%
	                String sql_5 = "select * from 乐视_热播榜_电影top30";
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
	<script>
		$('.menu .item') .tab() ;
	</script>

</body>
</html>