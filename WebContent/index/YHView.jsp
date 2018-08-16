<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
	<TITLE>View</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=utf-8">
	<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
	<base href = "${pageContext.request.contextPath }/"> 
	<LINK href="index/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
	<LINK href="index/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
	
	<SCRIPT language=javascript src="index/YHChannelApply.files/FrameDiv.js"></SCRIPT>
	<SCRIPT language=javascript src="index/YHChannelApply.files/Common.js"></SCRIPT>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	
	<SCRIPT language=javascript>
		function selectallbox() {
			var list = document.getElementsByName('setlist');
			var listAllValue = '';
			if (document.getElementById('checkAll').checked) {
				for (var i = 0; i < list.length; i++) {
					list[i].checked = true;
					if (listAllValue == '')
						listAllValue = list[i].value;
					else
						listAllValue = listAllValue + ',' + list[i].value;
				}
				document.getElementById('boxListValue').value = listAllValue;
			} else {
				for (var i = 0; i < list.length; i++) {
					list[i].checked = false;
				}
				document.getElementById('boxListValue').value = '';
			}
		}
	</SCRIPT>
	<!-- <script type="text/javascript">
		function delUser(id) {
			
			var tf = confirm("Are you sure del it?");
			if (tf) {
				$.ajax({
					type:"POST":
					url:"/PersonPowerManagerSystem/DeleteServlet";
					async:true;
					success: function(message) {
						alert("jQuery:" + message)
					}
				});
				}
			}
	</script> -->	
	</HEAD>
	<BODY>
		<FORM id=form1 name=form1 action=/PersonPowerManagerSystem/SearchOneServlet method=post>
			<SCRIPT type=text/javascript>
				//<![CDATA[
				var theForm = document.forms['form1'];
				if (!theForm) {
					theForm = document.form1;
				}
				function __doPostBack(eventTarget, eventArgument) {
					if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
						theForm.__EVENTTARGET.value = eventTarget;
						theForm.__EVENTARGUMENT.value = eventArgument;
						theForm.submit();
					}
				}
				//]]>
			</SCRIPT>
	
			<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
				<TBODY>
					<TR>
						<TD width=15><IMG src="index/YHChannelApply.files/new_019.jpg" border=0></TD>
						<TD width="100%" background=index/YHChannelApply.files/new_020.jpg height=20></TD>
						<TD width=15><IMG src="index/YHChannelApply.files/new_021.jpg" border=0></TD>
					</TR>
				</TBODY>
			</TABLE>
			
			<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
				<TBODY>
					<TR>
						<TD width=15 background=index/YHChannelApply.files/new_022.jpg>
							<IMG src="index/YHChannelApply.files/new_022.jpg" border=0>
						</TD>
						<td vAlign=top width="100%" bgColor=#ffffff>
							
							<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
								<TR>
									<TD class=manageHead>当前位置：管理首页 &gt; 管理中心 &gt; 渠道商详情</TD>
								</TR>
								<TR>
									<TD height=2></TD>
								</TR>
							</TABLE>
							
							<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
								<TBODY>
									<TR>
										<TD height=25>
											<TABLE cellSpacing=0 cellPadding=2 border=0>
												<TBODY>
													<TR>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD>
											<TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; 
												BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; 
												BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; 
												TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0 
												height="200px">
												<TBODY>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD bgcolor="#eeeeee" width=80px>ID</TD>
													<TD colspan="7">
														${one.uid }
													</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD bgcolor="#eeeeee" width=80px>用户名</TD>
													<TD colspan="7">
														${one.uname }
													</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD bgcolor="#eeeeee" width=80px>网站名称</TD>
													<TD colspan="7">
														${one.uweb }
													</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD bgcolor="#eeeeee" width=80px>广告商</TD>
													<TD colspan="7">
														${one.uad }
													</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
													<TD bgcolor="#eeeeee" width=80px>状态</TD>
													<TD colspan="7">
															<c:if test="${one.ustatus eq 1 }"><font color=green>√</font></c:if>
															<c:if test="${one.ustatus eq 0 }"><font color=red>×</font></c:if>
													</TD>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD height=25>
											<INPUT id=boxListValue type=hidden name=boxListValue>
											<button class=button id=button2 type=submit value= name=button2><a href="/PersonPowerManagerSystem/index.jsp" target="_top">查看主页</a></button>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							
							<TD width=15 background=index/YHChannelApply.files/new_023.jpg>
								<IMG src="index/YHChannelApply.files/new_023.jpg" border=0>
							</TD>
							<table cellSpacing=0 cellPadding=0 width="98%" border=0>
								<TBODY>
									<TR>
										<TD width=15><IMG src="index/YHChannelApply.files/new_024.jpg" border=0></TD>
										<TD align="center" width="100%" background=index/YHChannelApply.files/new_025.jpg height=15></TD>
										<TD width=15><IMG src="index/YHChannelApply.files/new_026.jpg" border=0></TD>
									</TR>
								</TBODY>
							</table>
						</td>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
