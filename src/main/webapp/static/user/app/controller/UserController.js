Ext.define("userManager.controller.UserController",{
	extend : "Ext.app.Controller",
	/*
	init : function() {
		console.log('Initialized Users! This happens before the Application launch function is called');
	}
	 */
	
	stores : ["Users"],
	
	models : ["User"],
	
	views :["UserList","UserEdit"],
	
	init :function() {
		this.control({
		/*
			"viewport > panel" : {
				render : this.onPanelRendered
			}
		*/
			"userList" : {
				itemdblclick : this.editUser
			},
			"userEdit button[action=save]" : {
				click : this.updateUser
			}
		});
	},
	
	/*
	onPanelRendered : function() {
		console.log("The Panel was rendered");
	}
	*/
	
	/*editUser : function(grid,record) {
		console.log("Double clicked on " + record.get("name"));
	}*/
	
	
	editUser : function(grid,record) {
		var view = Ext.widget("userEdit");
		
		view.down("form").loadRecord(record);
	},
	
	updateUser : function (button) {
		console.log("clicked the save button");
		
		var win = button.up("window"),
			form = win.down("form"),
			record = form.getRecord(),
			values = form.getValues();
		
		record.set(values);
		
		form.form.submit({
			//clientValidation:true,//进行客户端验证
			waitMsg : '正在提交数据请稍后',//提示信息
			waitTitle : '提示',//标题
			url : "update",//请求的url地址
			method:'POST',//请求方式
			success:function(form,action){//加载成功的处理函数
				win.hide();
				//updateBookGrid(action.result.bookId);
				Ext.Msg.alert('提示','新增书籍成功');
			},
			failure:function(form,action){//加载失败的处理函数
				Ext.Msg.alert('提示','新增书籍失败');
			}
		});
		
		
		
		
		//win.close();
		
		
		
		//this.getUsersStore().sync();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
});