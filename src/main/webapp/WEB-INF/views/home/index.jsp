<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="../static/extjs/resources/css/ext-all.css"/>
<script type="text/javascript" src="../static/extjs/ext-all.js"></script>
<script type="text/javascript" src="../static/extjs/locale/ext-lang-zh_CN.js"></script>

<script type="text/javascript">
	Ext.onReady(function() {
		new Ext.container.Viewport({
			title : "viewport",
			layout : "border",
			frame : true,
			items : [{
				region : "west",
				title : "west",
				width : 150,
				xtype : "panel",
				layout : "anchor",
				collapsible : true,
				items : [{
					title : "系统管理",
					align : "center",
					html : "系统管理",
					//iconCls : "save",
	                collapsible: true,
	                animate: true,
				}]
			},{
				region : "north",
				height : 90,
				//collapsible : true,
				html : "管理系统"
			},{
				region : "center",
				//title : "center",
				//collapsible : true,
				xtype : "tabpanel",
				activeItem : 0,
				items :[{
					title : "首页",
					html : "首页"
				}]
			}]
		});
		
	});

</script>

<title>my oa sys</title>
</head>
<body>

</body>
</html>