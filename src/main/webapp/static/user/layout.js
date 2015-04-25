Ext.onReady(function(){
	
	var containerPanel = Ext.create("Ext.panel.Panel", {
		renderTo: Ext.getBody(),
		width: 400,
		height: 200,
		title: "Container Panel",
		layout : "column",
		suspendLayut : true,
		/*
		items: [
		        {
		        	xtype: "panel",
		        	title: "Child Panel 1",
		        	height: 100,
		        	columnwidth : 0.5
		        },
		        {
		        	xtype: "panel",
		        	title: "Child Panel 2",
		        	height: 100,
		        	columnwidth : 0.5
		        }
		        ]
		        */
	});
	
	
	containerPanel.add({
		xtype : "panel",
		title : "child panel 1",
		height : 100,
		columnWidth : 0.5
	});
	containerPanel.add({
		xtype : "panel",
		title : "child panel 2",
		height : 100,
		columnWidth : 0.5
	});
	
	
	containerPanel.suspendLayut = false;
	containerPanel.doLayout();
})