<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>user list</title>
<link rel="stylesheet" type="text/css" href="../static/extjs/resources/css/ext-all.css"/>
<script type="text/javascript" src="../static/extjs/ext-all.js"></script>
<script type="text/javascript" src="../static/extjs/locale/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
	Ext.onReady(function() {
		Ext.create("Ext.grid.Panel",{
			title : "用户列表",
			renderTo : Ext.getBody(),
			width : 400,
			height : true,
			frame : true,
			store : {
				fields : ["id","name"],
				proxy : {
					type : "ajax",
					url : "listJson",
					reader : {
						type : "json",
						root : "items"
					}
				},
				autoLoad : true,
			},
			columns : [new Ext.grid.RowNumberer(),{
				header : "ID",
				dataIndex : "id",
				sortable : true
			},{
				header : "NAME",
				dataIndex : "name",
				sortable : true
			}]
		})
	})



	/* Ext.regModel("User", {
		fields : [ {
			name : "id"
		}, {
			name : "name"
		} ]
	});

	var userStore = Ext.create("Ext.data.Store", {
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

	var toolbar = [ {
		text : "添加",
		iconCls : "add",
		handler : showAddUser
	}, {
		text : "修改",
		iconCls : "edit",
		handler : showEditUser
	}, {
		text : "删除",
		iconCls : "delete",
		handler : showDeleteUser
	} ];

	var bookGrid = new Ext.grid.Panel({
		tbar : toolbar,
		store : userStore,
		selModel : new Ext.selection.CheckboxModel(),
		columns : [ {
			text : "id",
			width : 80,
			dataIndex : "id",
			sortable : true
		}, {
			text : "name",
			width : 80,
			dataIndex : "id",
			sortable : true
		} ]
	});

	Ext.QuickTips.init();
	Ext.regModel("UserType", {
		fields : [ {
			name : "id"
		}, {
			name : "name"
		} ]
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
		items : [ {
			xtype : "textfield",
			allowBlank : false,
			blankText : "用户名不能为空",
			name : "name",
			fieldLabel : "用户名"
		} ],
		buttons : [ {
			text : "提交",
			handler : submitForm
		}, {
			text : "关闭",
			handler : function() {
				win.hide();
			}
		} ]
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
		if (num > 1) {
			Ext.MessageBox.alert("提示", "每次只能修改一个用户信息")
		} else if (num == 1) {
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
		if (num == 0) {
			return;
		}
		Ext.MessageBox.confirm("提示", "你确定要删除所选用户吗？", function(btnId) {
			if (btnId = "yes") {
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
			params : {
				userIds : userIds
			},
			method : "POST",
			success : function(response, options) {
				msgTip.hide();
				var result = Ext.JSON.decode(response.responseText);

				if (result.success) {
					for (var i = 0; i < userList.length; i++) {
						var index = userStore.find("id", userList[i]);
						if (index != -1) {
							var rec = userStore.getAt(index);
							userStore.remove(rec);
						}
					}
					Ext.Msg.alert("提示", "删除用户信息成功");
				} else {
					Ext.Msg.alert("提示", "删除用户信息失败");
				}
			},
			failure : function(response, options) {
				msgTip.hide();
				Ext.Msg.alert("提示", "删除用户信息失败");
			}
		});

	}

	function submitForm() {
		if (userForm.isAdd) {
			userForm.form.sumbit({
				clientValidation : true,
				waitMsg : "正在提交数据请稍候",
				waiTitle : "提示",
				url : "save",
				method : "POST",
				success : function(form, action) {
					win.hide();
					updateUserGrid(action.reslut.userId);
					Ext.Msg.alert("提示", "添加用户成功");
				},
				failure : function(form, action) {
					Ext.Msg.alert("提示", "添加用户失败");
				}
			});
		} else {
			userForm.form.submit({
				clientValidation : true,
				waitMsg : "正在提交数据请稍候",
				waiTitle : "提示",
				url : "update",
				method : "POST",
				success : function(form, action) {
					win.hide();
					updateUserGrid(action.reslut.userId);
					Ext.Msg.alert("提示", "修改用户成功");
				},
				failure : function(form, action) {
					Ext.Msg.alert("提示", "修改用户失败");
				}
			});
		}
	}

	function updateUserGrid(userId) {
		var values = userForm.form.getValues();
		var index = userStore.find("id", values["id"]);
		var userTypeField = userForm.form.findField("userTypeId");
		var userTypeName = userTypeField.getRawValue();

		if (index != -1) {
			var item = userStore.getAt(index);

			for ( var fieldName in values) {
				item.set(fieldName, values[fieldName]);
			}

			item.set("typeName", userTypeName);
			item.commit();
		} else {
			var rec = Ext.ModelMgr.create({
				id : userId,
				userName : values["name"]
			}, "User");

			userStore.add(rec);
		}
	}

	function loadForm(userId) {
		userForm.form.load({
			waitMsg : "正在加载数据请稍候",
			waitTitle : "提示",
			url : "form",
			params : {
				userId : userId
			},
			method : "GET",
			failure : function(form, action) {
				Ext.Msg.alert("提示", "加载数据失败");
			}
		});
	} */
</script>

</head>
<body>

</body>
</html>