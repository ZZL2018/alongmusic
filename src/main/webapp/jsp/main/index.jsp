<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<style type="text/css">
	.songname:HOVER{cursor: pointer;}
	#hidediv{display: none;}
</style>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	function play(songname){
		var song = "/song/"+songname+".mp3";
		//alert(song);
		$("#song").attr("src",song);
		//var states = $("#audio")[0];
		//if (states.paused){ /*如果已经暂停*/
		//	states.play(); /*播放*/
		//	alert($("#song").attr("src"));
        //}else {
        //	states.pause();/*暂停*/
		//	alert($("#song").attr("src"));
        //}
		//alert($("#song").attr("src"));
	}
</script>
</head>
<body>
	<button onclick="playMusic()">播放</button>
	<div id="hidediv">
		<audio id="player" controls="controls" autoplay">
		   <source src="/song/认真的雪.mp3" id="song"/>
		</audio>
		<script>
		   function playMusic() {
		        var player = $("#player")[0]; /*jquery对象转换成js对象*/
		        if (player.paused){ /*如果已经暂停*/
		            player.play(); /*播放*/
		        }else {
		            player.pause();/*暂停*/
		        }
		    }
		</script>
	</div>
	<table border="1" cellpadding="0" cellspacing="0" width="70%">
		<tr>
			<th>歌曲编号</th>
			<th>歌曲名称</th>
			<th>歌手名称</th>
			<th>歌手类型</th>
			<th>歌曲类型</th>
			<th>下载次数</th>
			<th>收藏次数</th>
			<th>上传类型</th>
		</tr>
		<c:forEach items="${requestScope.slist }" var="s">
			<tr>
				<td>${s.songId }</td>
				<td class="songname" onclick="play('${s.songName}')">${s.songName }</td>
				<td>${s.singerInfo.singerName }</td>
				<td>${s.singerInfo.singerType.typeName }</td>
				<td>${s.songType.typeName }</td>
				<td>${s.downCount }</td>
				<td>${s.collectCount }</td>
				<td>
					<c:if test="${s.uploadRole == 1 }">管理员</c:if>
					<c:if test="${s.uploadRole == 2 }">用户</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>