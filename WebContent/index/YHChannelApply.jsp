﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
		<TITLE>Main</TITLE>
		<META http-equiv=Content-Type content="text/html; charset=utf-8">
		<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
		<LINK href="index/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
		<LINK href="index/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.0/jquery.min.js"></script>
		
		<SCRIPT language=javascript src="index/YHChannelApply.files/FrameDiv.js"></SCRIPT>
		
		<SCRIPT language=javascript src="index/YHChannelApply.files/Common.js"></SCRIPT>
		
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
		
	</HEAD>
	<BODY>
		<FORM id=form1 name=form1
			action=YHChannelApply.aspx?pages=4&amp;item=&amp;client=&amp;flag=0&amp;start=&amp;end=&amp;channel=
			method=post>
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
						<TD vAlign=top width="100%" bgColor=#ffffff>
							<TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
								<TR>
									<TD class=manageHead>当前位置：管理首页 &gt; 管理中心 &gt; 渠道商广告申请</TD>
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
														<TD>筛选数据：</TD>
														<TD>渠道商</TD>
														<TD><INPUT class=textbox id=sChannel2 style="WIDTH: 80px" maxLength=50 name=sChannel2></TD>
														<TD><INPUT class=button id=sButton2 type=submit value=" 筛选 " name=sButton2></TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD>
											<TABLE id=grid
												style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; 
												BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; 
												FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; 
												BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
												<TBODY>
													<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
														<TD>用户名</TD>
														<TD>网站名称</TD>
														<TD>状态</TD>
														<TD>广告商</TD>
														<TD>申请时间</TD>
														<TD>操作</TD>
														<TD><input type="checkbox" id="selectAll"></TD>
													</TR>
													<c:forEach items="${pb.list }" var="user">
														<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
															<td style="display: none;">${user.uid }</td>
															<TD>${user.uname }</TD>
															<TD>${user.uweb }</TD>
															<TD>
																<c:if test="${user.ustatus == 1 }"><font color=green>√</font></c:if>
																<c:if test="${user.ustatus == 0 }"><font color=red>×</font></c:if>
															</TD>
															<TD>${user.uad }</TD>
															<TD>${user.utime }</TD>
															<td>
																<a href="/PersonPowerManagerSystem/SearchOneServlet?id=${user.uid }" target=dmMain>查看</a>
																<a href="/PersonPowerManagerSystem/UpdateServlet?id=${user.uid }" target=dmMain>修改</a>
																<a href="javascript:void(0)" onclick="return delUser(${user.uid })">删除</a>
															</td>
															<TD><input type="checkbox" class="cb"></TD>
													</TR>
													</c:forEach>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD align=right height=25><INPUT id=boxListValue type=hidden name=boxListValue>
											<INPUT class=button id=button1 type=submit value=批量审核通过 name=button1>
											<INPUT class=button id=button2 type=submit value=批量拒绝申请 name=button2>
											&nbsp;&nbsp;&nbsp;
										</TD>
									</TR>
									<TR>
										<TD>
											<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
												<SPAN id=pagelink>
													[<B>${pb.allTr }</B>]条记录 &nbsp;[${requestScope.pb.allPage }]页 &nbsp; 
													当前是[${requestScope.pb.page }]页&nbsp; 
													<c:if test="${pb.page != 1 }">
														[
														<A
															href="<c:url value='/PageServlet?page=${requestScope.pb.page-1 }'/>">
															前一页
														</A>
														]
													</c:if>
													&nbsp;&nbsp; 
													<c:if test="${pb.page != pb.allPage }">
														[
														<A
															href="<c:url value='/PageServlet?page=${requestScope.pb.page+1 }'/>">
															后一页
														</A>
														]
													</c:if>
													&nbsp;&nbsp;
													<input type="text" size="5" id="go">&nbsp;
													<a  href="#" onclick="go(this)">GO</a>
												</SPAN>
											</div>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
						<TD width=15 background=index/YHChannelApply.files/new_023.jpg>
							<IMG src="index/YHChannelApply.files/new_023.jpg" border=0>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
			<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
				<TBODY>
					<TR>
						<TD width=15><IMG src="index/YHChannelApply.files/new_024.jpg" border=0></TD>
						<TD align="center" width="100%" background=index/YHChannelApply.files/new_025.jpg height=15></TD>
						<TD width=15><IMG src="index/YHChannelApply.files/new_026.jpg" border=0></TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</BODY>
	<script type="text/javascript">
	
		function go(obj) {
			
			var  val = document.getElementById("go").value;
			if (val < 1 || val > ${pb.allPage }) {
				alert("页数输入错误");
			} else {
				obj.href="<c:url value='/PageServlet?page="+val+"'/>";
			}
		}
		
		function delUser(id){
			
			var isDelete=window.confirm("确定删除？");
			if(isDelete){
				var tr = $(this).parent().parent();
				$.ajax({
					type: "POST",// 提交方式
					url: "/PersonPowerManagerSystem/DeleteServlet",
					data: {"id":id},// 参数
					async: true,// 是否异步
					success: function(message) {
						if (message == "success") {
							tr.removeChild();
						}
					}
				});
			}
		}
		$(function() {  
            $("#selectAll").click(function(){
            	var chk = $("input[type='checkbox'][class='cb']:checked").length;
            	if (chk <= 0) {
                	$("input.cb").attr("checked", true);  
				} else {
                	$("input.cb").attr("checked", false);  
				}
            });  
            $("#reverseSelect").click(function(){  
                $("input.cb").each(function(){  
                    $(this).attr("checked", !$(this).attr("checked"));  
                });  
            });  
        });
		/* $(function() ){
			
		} */
	</script>
</HTML>
