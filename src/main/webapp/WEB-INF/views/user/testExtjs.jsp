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
 		var themes = [{
 			theme : "默认",
 			css : "ext-all.css"
 		},{
 			theme : "黑色",
 			css : "ext-all-access.css"
 		},{
 			theme : "红色",
 			css : "ext-all-red.css"
 		}];
 		
 		Ext.regModel("Theme",{
 			fields : ["theme","css"]
 		});
 		
 		var themeStore = Ext.create("Ext.data.Store",{
 			model : "Theme",
	 		data : themes
 		});
 		
 		var themeChange = Ext.create("Ext.form.ComboBox",{
 			id : "themeChange",
 			width : 150,
 			labelWidth : 60,
 			labelSeparator : ":",
 			fieldLabel : "样式选择",
 			store : themeStore,
 			editable : false,
 			triggerAction : "all",
 			store : themeStore,
 			dispalyField : "theme",
 			valueField : "cess",
 			queryMode : "local",
 			value : "ext-all.css",
 			listeners : {
 				"collapse" : function() {
 					Ext.util.CSS.swapStyleSheet("theme","../static/extjs/resources/css/" + this.getValue());
 					contentIframe.window.themeChange(this.getValue());
 				}
 			}
 		});
 		
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
 				contentEl : "contentIframe",
 				collapsible : true,
 				id : "mainContent",
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
 					url : "list"
 				}]
 			},
 			root : {
 				text : "系统说明",
 				url : "list",
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
 			
 			Ext.getDom("contentIframe").src = url ;//+ "&theme=" +theme;
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
			tbar : [themeChange]	 		
 		});
 		
 		Ext.regModel("User",{
 			fields : [{
 				name : "id"
 			},{
 				name : "name"
 			}]
 		});
 		
 		var userStore = Ext.create("Ext.data.Store",{
 			autoLoad : true,
 			model : "User",
 			proxy : {
 				type : "ajax",
 				url : "listJson",
 				reader : {
 					type : "json",
 					totalRecords : "results",
 					idProperty : "id",
 					record : "User"
 				}
 			}
 		});
 		
 		var toolbar = [{
 			text : "添加",
 			iconCls : "add",
 			handler : showAddUser
 		},{
 			text : "修改",
 			iconCls : "edit",
 			handler : showEditUser
 		},{
 			text : "删除",
 			iconCls : "delete",
 			handler : showDeleteUser
 		}];
 		
 		var bookGrid = new Ext.grid.Panel({
 			tbar : toolbar,
 			store : userStore,
 			selModel : new Ext.selection.CheckboxModel(),
 			columns : [{
 				text : "id",
 				width : 80,
 				dataIndex : "id",
 				sortable : true
 			},{
 				text : "name",
 				width : 80,
 				dataIndex : "id",
 				sortable : true
 			}]
 		});
 		
 		Ext.QuickTips.init();
 		Ext.regModel("UserType",{
 			fields : [{name:"id"},{name:"name"}]
 		});
 		
 		var userForm = new Ext.form.Panel({
 			fieldDefaults : {
 				labelSeparator : ":",
 				labelWidth : 80,
 				msgTarget : "side",
 				width : 300
 			},
 			bodyPadding : 5,
 			frame : true,
 			items : [{
 				xtype : "textfield",
 				allowBlank : false,
 				blankText : "用户名不能为空",
 				name : "name",
 				fieldLabel : "用户名"
 			}],
 			buttons : [{
 				text : "提交",
 				handler : submitForm
 			},{
 				text : "关闭",
 				handler : function() {
 					win.hide();
 				}
 			}]
 		});
 		
 		var win = new Ext.window.Window({
 			layout : "fit",
 			width : 380,
 			closeAction : "hide",
 			height : 280,
 			resizable : false,
 			shadow : true,
 			modal : true,
 			closable : true,
 			items : userForm
 		});
 		
 		function showAddUser() {
 			userForm.form.reset();
 			userForm.isAdd = true;
 			win.setTitle("添加用户");
 			win.show();
 		}
 		
 		function showEditUser() {
 			var userList = getUserIDList();
 			
 			var num = userList.length;
 			if(num > 1) {
 				Ext.MessageBox.alert("提示","每次只能修改一个用户信息")
 			} else if(num == 1) {
 				userForm.form.reset();
 				userForm.isAdd = false;
 				win.setTitle("修改用户信息");
 				win.show();
 				var userId = userList[0];
 				loadForm(userId);
 			}
 		}
 		
 		function showDeleteUser() {
 			var userList = getUserList();
 			
 			var num = userList.lengthl;
 			if(num == 0){
 				return ;
 			}
 			Ext.MessageBox.confirm("提示","你确定要删除所选用户吗？",function(btnId){
 				if(btnId = "yes") {
 					deleteUser(userList);
 				}
 			});
 		}
 		
 		function deleteUser(userList) {
 			var userIds = userList.jion(",");
 			
 			var msgTip = Ext.MessageBox.show({
 				title : "提示",
 				width : 250,
 				msg : "正在删除用户信息请稍后......"
 			});
 			
 			Ext.Ajax.request({
 				url : "delete",
 				params : {userIds : userIds},
 				method : "POST",
 				success : function(response,options){
 					msgTip.hide();
 					var result = Ext.JSON.decode(response.responseText);
 					
 					if(result.success) {
 						for(var i=0; i<userList.length; i++) {
 							var index = userStore.find("id",userList[i]);
 							if(index != -1) {
 								var rec = userStore.getAt(index);
 								userStore.remove(rec);
 							}
 						}
 						Ext.Msg.alert("提示","删除用户信息成功");
 					} else {
 						Ext.Msg.alert("提示","删除用户信息失败");
 					}
 				},
 				failure : function(response,options) {
 					msgTip.hide();
 					Ext.Msg.alert("提示","删除用户信息失败");
 				}
 			});
 			
 		}
 		
 		
 		function submitForm() {
 			if(userForm.isAdd) {
 				userForm.form.sumbit({
 					clientValidation : true,
 					waitMsg : "正在提交数据请稍候",
 					waiTitle : "提示",
 					url : "save",
 					method : "POST",
 					success:function(form,action) {
 						win.hide();
 						updateUserGrid(action.reslut.userId);
 						Ext.Msg.alert("提示","添加用户成功");
 					},
 					failure:function(form,action) {
 						Ext.Msg.alert("提示","添加用户失败");
 					}
 				});
 			} else {
 				userForm.form.submit({
 					clientValidation : true,
 					waitMsg : "正在提交数据请稍候",
 					waiTitle : "提示",
 					url : "update",
 					method : "POST",
 					success : function(form,action) {
 						win.hide();
 						updateUserGrid(action.reslut.userId);
 						Ext.Msg.alert("提示","修改用户成功");
 					},
 					failure:function(form,action) {
 						Ext.Msg.alert("提示","修改用户失败");
 					}
 				});
 			}
 		}
 		
 		function updateUserGrid(userId) {
 			var values = userForm.form.getValues();
 			var index = userStore.find("id",values["id"]);
 			var userTypeField = userForm.form.findField("userTypeId");
 			var userTypeName = userTypeField.getRawValue();
 			
 			if(index != -1) {
				var item = userStore.getAt(index);
				
				for(var fieldName in values ){
					item.set(fieldName,values[fieldName]);
				}
				
				item.set("typeName",userTypeName);
				item.commit();
 			} else {
 				var rec = Ext.ModelMgr.create({
 					id : userId,
 					userName : values["name"]
 				},"User");
 				
 				userStore.add(rec);
 			}
 		}
 		
 		function loadForm(userId) {
 			userForm.form.load({
 				waitMsg : "正在加载数据请稍候",
 				waitTitle : "提示",
 				url : "form",
 				params : {userId:userId},
 				method : "GET",
 				failure : function(form,action) {
 					Ext.Msg.alert("提示","加载数据失败");
 				}
 			});
 		}
 		
 		
 		/* function showDeleteUSerType() {
 			var userTypeList = getUserTypeList();
 			var num = userTypeList.length;
 			
 			if(num > 1) {
 				Ext.MessageBox.alert("提示","每次只能删除一条用户信息");
 			} else if(num == 1) {
 				Ext.Message.confirm("提示","你确定要删除所选的用户吗？",function(btnId) {
	 				if(btnId == "yes") {
	 					var userTypeId = userTypeList[0];
	 					deleteUserType(userTypeId);
	 				}
 				});
 			}
 		}
 		
 		function deleteUserType(userTypeId){
 			
 		} */
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
 <iframe id='contentIframe' name='contentIframe' style='height:100%;width:100%' frameborder="no"></iframe>
</body>
</html>