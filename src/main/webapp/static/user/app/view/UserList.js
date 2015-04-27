var selectModel = Ext.create("Ext.selection.CheckboxModel");

Ext.define("userManager.view.UserList",{
	extend : "Ext.grid.Panel",
	alias : "widget.userList",
	
	store : "Users",
	
	selModel : selectModel,
	
	tbar : [{
		text: "添加",
		iconCls: "user-add",
		action : "add"
	},{
		text : "删除",
		iconCls: "user-remove",
		action : "delete"
	}],
	
	initComponent : function() {
	
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

