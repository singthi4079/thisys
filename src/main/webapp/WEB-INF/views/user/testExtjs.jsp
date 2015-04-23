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
<!-- <script type="text/javascript">
	/*表单字段示例*/
	Ext.onReady(function() {
		Ext.QuickTips.init();//初始化信息提示功能
		
		var form = new Ext.form.Panel({
			title : "表单",//表单标题
			height : 120,
			width : 200,
			frame : true,//是否渲染表单
			renderTo : "form",
			defaults : {//统一设置表单字段默认属性
				labelSeparator : ":",//分隔符
				labelWidth : 50,//标签宽度
				width : 150,//字段宽度
				allowBlank : false,//是否允许为空
				blankText : "不允许为空",
				labelAlign : "left",//标签对齐方式
				msgTarget : "qtip" ,//显示一个浮动的提示信息
				/* msgTarget : "title",//显示一个浏览器原始的浮动提示信息
				msgTarget : "under",//在字段下方显示一个提示信息
				msgTarget : "side",//在字段右边显示一个提示信息
				msgTarget : "nono",//不显示提示信息
				msgTarget : "errorMsg",//在errorMsg元素内显示提示信息 */
			},
			items : [{
				xtype : "textfield",
				fieldLabel : "姓名",//标签内容
				maxLength : 10
			},{
				xtype : "numberfield",
				fieldLabel : "年龄"//标签内容
			}]
		});
	});
</script>

<div id="form"></div>
错误信息展示元素
<div id="errorMsg"></div>
 -->
 
 <script type="text/javascript">
 	Ext.onReady(function() {
 		
 		
 		Ext.create("Ext.container.Viewport",{
 			layout : "border",
 			items : [{
 				title : "用户管理",
 				collapsible : true,
 				html : "<br><center><font size='6'>用户管理</font></center>",
 				region : "north",
 				height : 100
 			},{
 				title : "功能菜单",
 				items : menuTree,
 				split : true,
 				collapsible : true,
 				region : "west",
 				width : 180,
 			},{
 				layout : "fit",
 				//contentEl : "contentIframe",
 				collapsible : true,
 				id : "maiContent",
 				region : "center"
 			}]
 		});
 		
 		Ext.regModel("Menu",{
 			fields : ["text","url"]
 		});
 		
 		var menuStore = Ext.create("Ext.data.TreeStore",{
 			model : "Menu",
 			proxy : {
 				type : "memory",
 				data : [{
 					text : "用户管理",
 					leaf : true,
 					url : "user/list"
 				}]
 			},
 			root : {
 				text : "系统说明",
 				url : "user/list",
 				leaf : false,
 				expanded : true
 			},
 			listeners : {
 				expand : function(node) {
 					changePage(node.get("url"),node.get("text"));
 				}
 			}
 		});
 		
 		function changePage(url,title) {
 			var theme = Ext.getCmp("themeChange").getValue();
 			
 			Ext.getDom("contentIframe").src = url + "&theme=" +theme;
 			Ext.getCmp("mainContent").setTitle(title);
 		}
 		
 		var menuTree = Ext.create("Ext.tree.Panel",{
 			border : false,
	 		store : menuStore,
	 		hrefTarget : "mainContent",
	 		listeners : {
	 			itemclick : function(view,rec,item,index,e){
	 				changePage(rec.get("url"),rec.get("text"));
	 			}
	 		},
			tbar : [themeChage]	 		
 		})
			 /*
 		Ext.QuickTips.init();
 		
 		var loginForm = new Ext.form.Panel({
 			title : "Ext.fom.field.Text示例",
 			bodyStyle : "padding : 5 5 5 5",//表单边距
 			frame : true,
 			height : 120,
 			width : 200,
 			renderTo : "form",
 			defaultType : "textfield",//设置表单字段的默认类型
 			defaults : {//统一设置表单字段默认属性
 				labelSeparator : ":",
 				labelWidth : 50,
 				width : 150,
 				allowBlank : false,
 				labelAlign : "left",
 				msgTarget : "side"
 			},
				 登录框验证信息	用户名必须为Email格式
	 			items : [{
	 				fieldLabel : "用户名",
	 				name : "userName",
	 				selectOnFocus : true,//得到焦点时自动选择文本
	 				//验证电子邮件格式的正则表达式
	 				regex : /^([\w]+)(.[\w])*@([\w-]+\.){1,5}([A-Za-z]){2,4}$/,
	 				regexText : "格式错误"//验证错误之后的提示信息
	 			},{
	 				name : "password",
	 				fieldLabel : "密码",
	 				inputType : "password"//设置输入类型为password
	 			}],
	 			buttons : [{
	 				text : "登录",
	 				handler : function() {
	 					loginForm.form.setValues({userName:"user@com",password:"123456"})
	 				}
	 			}]
 		});
 			*/
 	});
 </script>
<!-- 		 <div id="form"></div> -->
 
</body>
</html>