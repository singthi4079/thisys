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
		//console.log("clicked the save button");
	
		var win = button.up("window"),
			form = win.down("form"),
			record = form.getRecord(),
			values = form.getValues();
		
		record.set(values);
		win.close();
		
		this.getUsersStore().sync({
			method : "GET"
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
});