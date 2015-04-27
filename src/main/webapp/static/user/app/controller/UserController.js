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
			"userList" : {
				itemdblclick : this.editUser
			},
			"userEdit button[action=save]" : {
				click : this.updateUser
			},
			"userList button[action=add]" : {
				click : this.editUser
			},
			"userList button[action=delete]" : {
				click : this.deleteUsers
			},
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
		//Ext.Msg.alert("提示",Ext.isEmpty(record.id));
		
		//如果是添加,那么record.id 为空,如果是修改,那么record.id不为空
		if(!Ext.isEmpty(record.id)) {
			view.down("form").loadRecord(record);
		}
	},
	
	
	updateUser : function (button) {
		//console.log("clicked the save button");
		
		var win = button.up("window"),
			form = win.down("form"),
			record = form.getRecord(),
			values = form.getValues();
		
		
		var urls = "";
		var alertMsg = "";
		if(Ext.isEmpty(values.id)) {
			urls = "saveJson";
			alertMsg = "添加用户"
		} else {
			urls = "updateJson";
			record.set(values);
			alertMsg = "修改用户"
		}
		//console.log(this.down("window"));
		
		var theContrl = this;
		
		if(form.form.isValid()) {
			form.form.submit({
				//clientValidation:true,//进行客户端验证
				waitMsg : '正在提交数据请稍后',//提示信息
				waitTitle : '提示',//标题
				url : urls,//请求的url地址
				method:'POST',//请求方式
				success:function(form,action){//加载成功的处理函数
					win.close();
					//updateBookGrid(action.result.bookId);
					Ext.Msg.alert("提示",alertMsg + "成功");
					theContrl.relaodData(theContrl);
				},
				failure:function(form,action){//加载失败的处理函数
					Ext.Msg.alert("提示",alertMsg + "失败");
				}
			});
			/*
			this.getUsersStore().sync();
			//要调用reload之后显示更新后的数据，必须调用commit才会显示出来
			this.getUsersStore().commitChanges();
			this.getUsersStore().reload();
			*/
		}
		//win.close();
	},
	
	deleteUsers : function(button) {
		var selecteds = button.up("grid").getSelectionModel().getSelection();;
		var ids = [];
		
		if(selecteds.length > 0) {
			for(var i=0; i<selecteds.length; i++) {
				ids.push(selecteds[i].data.id);
			}
		} else if(selecteds.length == 0){
			Ext.Msg.alert("提示","请选择要进行操作的用户");
		}
		//console.log(selecteds[0].data.id);
		var msgTip = Ext.MessageBox.show({
			title:'提示',
			width : 250,
			msg:'正在删除书籍信息请稍后......'
		});
		
		var theContrl = this;
		
		Ext.Ajax.request({
			url : "deleteJson",
			params : {"ids" : ids},
			method : 'POST',
			success : function(response,options){
				theContrl.relaodData(theContrl);
				msgTip.hide();
				//服务器端数据成功删除后，同步删除客户端列表中的数据
				Ext.Msg.alert('提示','删除书籍信息成功。');
			},
			failure : function(response,options){
				msgTip.hide();
				Ext.Msg.alert('提示','删除书籍信息请求失败！');
			}
		});
		
	},
	
	relaodData : function(contrl) {
		contrl.getUsersStore().sync();
		//要调用reload之后显示更新后的数据，必须调用commit才会显示出来
		contrl.getUsersStore().commitChanges();
		contrl.getUsersStore().reload();
	}
	
});