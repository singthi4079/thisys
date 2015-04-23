<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../static/extjs/resources/css/ext-all.css"/>
<script type="text/javascript" src="../static/extjs/ext-all.js"></script>
<script type="text/javascript" src="../static/extjs/locale/ext-lang-zh_CN.js"></script>

<title>Test Ext Js</title>
</head>
<body>
<script type="text/javascript">
/*
	Ext.onReady(function() {
		if(Ext.BLANK_IMAGE_URL.substr(0,4) != "data") {
			Ext.BLANK_IMAGE_URL = "./images/s.gif";
		}
		new Ext.Viewport({
			layout : "fit",
			items : [{
				xtype : "panel",
				title : "欢迎",
				html : "<h1 style='text-align:center;font-size:60px;font-weight:bold;'>Hello World</h1>"
			}]
		});
	});
*/
	
	
	
	Ext.onReady(function() {
		Ext.create("Ext.container.Viewport",{
			layout : "border",//Border布局
			items :[{
				title : "用户管理",
				collapsible : true,
				html : "<br><center><font size='6'>用户管理系统</font></center>",
				region : "north",//指定子面板所在区域为north
				height : 100
			},{
				title : "功能菜单",
				items : menuTree,
				split: true,
				collapsible : true,
				region : "west",//指定子面板所在区域为west
				width : 180
			},{
				layout : "fit",
				contentEl : "contentIframe",
				collapsible : true,
				id : "mainContent",
				region : "center" //指定子面板所在区域为center
			}]
		});
	});
</script>

</body>
</html>