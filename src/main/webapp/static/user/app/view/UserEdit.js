Ext.QuickTips.init();
Ext.define("userManager.view.UserEdit",{
	extend : "Ext.window.Window",
	alias : "widget.userEdit",
	title : "Edit User",
	layout : "fit",
	autoShow : true,
	
	initComponent : function() {
		this.items = [{
			xtype : "form",
			defaults : "",
			items :[{
				xtype : "textfield",
				name : "id",
				fieldLabel : "ID",
				hidden : true
			},{
				xtype : "textfield",
				name : "name",
				fieldLabel : "Name",
				allowBlank : false
			}]
		}];
		
		this.buttons = [{
			text : "Save",
			action : "save"
		},{
			text : "cancel",
			scope : this,
			handler : this.close
		}];
		
		this.callParent(arguments);
	}
});