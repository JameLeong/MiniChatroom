<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.james.service.TalkBean"%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"%>">
<meta charset="utf-8">
<title>聊天室</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="./css/bootstrap-responsive.min.css" rel="stylesheet">
<style type="text/css">
	.emotion{width:42px; height:20px; background:url(./img/icon.gif) no-repeat 2px 2px; padding-left:20px; cursor:pointer}
	.emotion:hover{background-position:2px -28px}
	.qqFace{margin-top:4px;background:#fff;padding:2px;border:1px #dfe6f6 solid;}
	.qqFace table td{padding:0px;}
	.qqFace table td img{cursor:pointer;border:1px #fff solid;}
	.qqFace table td img:hover{border:1px #0066cc solid;}
	.msgPanel{
		height:300px;
		overflow-y:scroll;
	}
	#talkDiglog{
    	width: 100%; 
/*     	生成绝对定位的元素，相对于浏览器窗口进行定位。
		元素的位置通过 "left", "top", "right" 以及 "bottom" 属性进行规定。 */
 		position: fixed; 
 		margin: 0px auto; 
 		left: 0px; 
 		right: 0px; 
 		/*
 		 全屏用
 		top: 0px; 
 		bottom: 0px;  
 		*/
	}
</style>
</head>
<body>
	<%
	Map<String,String> online = (Map<String,String>) application.getAttribute("online");
	//得到本用户的名字
	String me = (String)request.getAttribute("userName");
	%>
	<div id="talkDiglog" class="modal hide fade" style="width:880px">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3 onlineUser" >
            	<center><h4>在线用户</h4></center>
            	<center><font color="red" ><h5 id="countUser">（现在的在线人数为<%=online.size() %>人）</h5></font></center>
                <ol id="online_user">
                	<%
                	for(String sessionId :online.keySet()){
                	%>
                	<li><%=online.get(sessionId)%></li>
                	<%}%>
                </ol>
            </div>
            <div class="span9">
                <!-- 聊天头 -->
                <div class="modal-header">
                    <h3> Mini聊天室<span style="font-size:14px;"> (欢迎您
                            <span class="text-info">${userName}</span>)</span>
                    </h3>
                </div>
                <!-- 聊天框 -->
                <div class="modal-body">
                    <ul class="nav nav-tabs" id="areaTab">
                        <li class="active">
                            <a href="#wordMsg" data-toggle="tab"> 全体用户</a>
                        </li>
                        <li>
                            <a href="#private" data-toggle="tab"> 私人聊天室 </a>
                        </li>
                        <li>
                            <a href="#infoChange" data-toggle="tab">信息修改</a>
                        </li>
                    </ul>
                    <!-- 如果需要为标签页设置淡入淡出效果，请添加 .fade 到每个 .tab-pane 后面。第一个标签页必须添加 .in 类，以便淡入显示初始内容
                    -->
                    <div class="tab-content">
                        <!-- 聊天内容 -->
                        <div class="msgPanel tab-pane active" id="wordMsg">
                        </div>
                        <!-- 私人聊天 -->
                        <div class="tab-pane fade" id="private">
                            <h4>
                                <center>私人聊天功能正在内测中，请稍等 </center>
                            </h4>
                        </div>
                        <!-- 信息修改 -->
                        <div class="tab-pane fade" id="infoChange">
                            <h4>
                                <center> 个人信息修改功能暂未开放，请稍等 </center>
                            </h4>
                        </div>
                    </div>
                </div>
                <!-- 信息发送框 -->
                <div class="modal-footer text-left">
                    <div class="input-append input-prepend">
                        <span class="add-on">@All</span>
                        <input id="myinput" style="width:410px" type="text" name="message" />
                        <span class="emotion add-on"></span>
                        <button id="sendBtn" class="btn btn-primary">发送</button>
                        <button id="clean" class="btn btn-warning">清空</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	

	
<script src="./js/jquery-1.8.3.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/ajax-pushlet-client.js"></script>
<script src="./js/jquery.qqFace.js"></script>
<script type="text/javascript">
	$(function(){
		//设置根目录
		PL.webRoot="./";
		//对pushlet的初始化，触发web.xml中的servlet。
		PL._init();
		//加入会话区
	    PL.joinListen('/message/world');  
	    
		//加载表情
		$('.emotion').qqFace({
			id : 'facebox', //表情盒子的ID
			assign:'myinput', //给那个控件赋值
			path:'./img/face/'	//表情存放的路径
		});
		//======================加载聊天记录======================
		$("#wordMsg").append("<div><center><font color='#CDC9C9'>--------------历史聊天记录----------------</font></center></div>");
		<%
			TalkBean talkService =  new TalkBean();
		    List<Map<String,Object>> msgs = talkService.getMsg();
		    Map<String,Object> ms = null;
		    for(int i =msgs.size()-1;i>=0;i--){
		    	ms = msgs.get(i);
		    	//获得元数据
		    	String username = (String)ms.get("username");
		    	String content = (String)ms.get("content");
		    	String time = (String)ms.get("time");
		    	//本人发送的消息
		    	if(me.equals(username)){
		 %>  		
		 $("#wordMsg").append("<div class='muted message'><span class='text-success'>【"+"<%=username%>"+" "+"<%=time%>"+"】</span>"+"<br/>"+replace_em("<%=content%>")+"</div>");
		 <% }else{
		 %> 	
		 $("#wordMsg").append("<div class='muted message'><span class='text-info'>【"+"<%=username%>"+" "+"<%=time%>"+"】</span>"+"<br/>"+replace_em("<%=content%>")+"</div>");
		 <% 
		 }
		 %>
		 $('#wordMsg').scrollTop( $('#wordMsg')[0].scrollHeight );
		<%}%>
		$("#wordMsg").append("<div><center><font color='#CDC9C9'>---------------------现在---------------------</font></center></div>");
		//========================加载完毕==========================
		/* backdrop 为static 时,点击模态对话框的外部区域不会将其关闭。 */
		$("#talkDiglog").modal({backdrop:"static",keyboard: false});
		
	    $("#clean").click(function(){
	    	$("#wordMsg").empty();
	    });
	    
	    $("#sendBtn").click(function(){
	    	send();
	    });
	    
	    $('#myinput').bind('keypress',function(event){
            if(event.keyCode == "13"){
            	send();
            }
        });
	    
	    function send(){
	    	var msg=$("input[name='message']").val();
	    	//清空发送框
	    	$("input[name='message']").val("");
	    	$.post("./talkService.srv",{action:"sendMsg",message:msg},function(){
	    		//发送完毕
	    	});
	    }
	   
	});
	
	//表情显示
	function replace_em(str){
		str = str.replace(/\</g,'&lt;');
		str = str.replace(/\>/g,'&gt;');
		str = str.replace(/\n/g,'<br/>');
		str = str.replace(/\[em_([0-9]*)\]/g,'<img src="./img/face/$1.gif" border="0" />');
		return str;
	}
	
	//onData的参数是消息源Even里面的一个Map
	function onData(event) {
		//=================接收消息=================
    	var message=event.get("message");
    	var userName=event.get("userName");
    	if(message!=null&&""!=message){
    		$("#wordMsg").append("<div class='text-success message'><span class='text-info'>【"+userName+"】说：</span>"+replace_em(message)+"</div>");
    		$('#wordMsg').scrollTop( $('#wordMsg')[0].scrollHeight );
    	}
    	//==============更新登录信息=================
    	var comingUser=event.get("comingUser");
    	var userCount=event.get("userCount");
    	var outingUser=event.get("outingUser");
    	//新用户进入
    	if(comingUser!=null&&""!=comingUser){
    		$('#online_user').append("<li>"+comingUser+"</li>");
    		$('#countUser').html("（现在的在线人数为"+userCount+"人）");
    	}
    	//用户退出
    	if(outingUser!=null&&""!=outingUser){
    		$("li:contains('"+outingUser+"')").remove();
    		$('#countUser').html("（现在的在线人数为"+userCount+"人）");
    	}
	 }
</script>
</body>
</html>