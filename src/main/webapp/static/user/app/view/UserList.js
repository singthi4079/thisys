var selectModel = Ext.create("Ext.selection.CheckboxModel");

Ext.define("userManager.view.UserList",{
	extend : "Ext.grid.Panel",
	alias : "widget.userList",
	
	title : "All Users",
	
	store : "Users",
	
	selModel : selectModel,
	
	tbar : [{
		text: "添加",
		action : "add"
	},{
		text : "删除",
		action : "delete"
	}],
	
	initComponent : function() {
		/*this .store = {
				fields : ["name","email"],
				data : [{
					name : "Ed",
					email : "ed@sencha.com"
				},{
					name : "Tommy",
					email : "tommy@sencha.com"
				}]
		};
		*/
		this.columns = [{
			header : "ID",
			dataIndex : "id",
			flex : 1
		},{
			header : "Name",
			dataIndex : "name",
			flex : 1
		}];
		
		this.callParent(arguments);
	}
});

