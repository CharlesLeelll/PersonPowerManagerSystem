﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
	<HEAD>
	<TITLE>模板</TITLE>
	<META http-equiv=Content-Type content="text/html; charset=utf-8">
	<META content="MSHTML 6.00.2900.3492" name=GENERATOR>
	<LINK href="index/YHChannelApply.files/Style.css" type=text/css rel=stylesheet>
	<LINK href="index/YHChannelApply.files/Manage.css" type=text/css rel=stylesheet>
	
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
		<FORM id=form1 name=form1 action=/PersonPowerManagerSystem/UpdateServlet method=post>
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
									<TD class=manageHead>当前位置：管理首页 &gt; 管理中心 &gt; 渠道商信息修改</TD>
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
													<TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
														<TD colspan="7">欢迎进入添加操作信息，信息将于个人信誉绑定，请认真填写！ ${upError }</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD colspan="6" style="display: none;">	
															<INPUT class=textbox id=sChannel2 style="WIDTH: 800px;" maxLength=50 name=uid value=${one.uid }>
														</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD bgcolor="#eeeeee">用户名</TD>
														<TD colspan="6">	
															<INPUT class=textbox id=sChannel2 style="WIDTH: 800px;" maxLength=50 name=uname value=${one.uname }>
														</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD bgcolor="#eeeeee">网站名称</TD>
														<TD colspan="6">
															<INPUT class=textbox id=sChannel2 style="WIDTH: 800px" maxLength=50 name=uweb value=${one.uweb }>
														</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD bgcolor="#eeeeee">状态</TD>
														<TD colspan="6">
															<INPUT class=textbox id=sChannel3 name=ustatus value="t" type="radio" ${one.ustatus eq 1?"checked='checked'":"" }>就绪
															<INPUT class=textbox id=sChannel3 name=ustatus value="f" type="radio" ${one.ustatus eq 0?"checked='checked'":"" }>未就绪
														</TD>
													</TR>
													<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
														<TD bgcolor="#eeeeee">广告商</TD>
														<TD colspan="6">
															<INPUT class=textbox id=sChannel2 style="WIDTH: 800px" maxLength=50 name=uad value=${one.uad }>
														</TD>
													</TR>
												</TBODY>
											</TABLE>
										</TD>
									</TR>
									<TR>
										<TD height=25>
											<INPUT id=boxListValue type=hidden name=boxListValue>
											<INPUT class=button id=button1 type=submit value=确认添加 name=button1>
											<INPUT class=button id=button2 type=submit value=撤销返回 name=button2>
										</TD>
									</TR>
								</TBODY>
							</TABLE>
							<TD width=15 background=index/YHChannelApply.files/new_023.jpg>
								<IMG src="index/YHChannelApply.files/new_023.jpg" border=0>
							</TD>
							<TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
								<TBODY>
									<TR>
										<TD width=15><IMG src="index/YHChannelApply.files/new_024.jpg" border=0></TD>
										<TD align="center" width="100%" background=index/YHChannelApply.files/new_025.jpg height=15></TD>
										<TD width=15><IMG src="index/YHChannelApply.files/new_026.jpg" border=0></TD>
									</TR>
								</TBODY>
							</TABLE>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</BODY>
</HTML>
