Ext.onReady(function() {
	 requires: ["thisys.util.Gload"];
    //The new TabPanel
	var tab = Ext.create('Ext.TabPanel', {
		region : 'center',
		deferredRender : false,
		activeTab : 0,
		resizeTabs : true, // turn on tab resizing
		minTabWidth : 115,
		tabWidth : 135,
		enableTabScroll : true,
		items : [{//创建一个默认的tab
			title : "首页",
			html : "<h2>欢迎使用本系统</h2>"
		}]
	});
	var viewPort = Ext.create('Ext.Viewport', {
		layout : "border",
		items : [ {
			region : 'north',
			minHeight : 100,
			html : 'north'
		}, {
			//title : 'West Region is collapsible',
			region : 'west',
			xtype : 'panel',
			width : 200,
			collapsible : true, // Provided with folding
			id : 'west-region-container',
			layout : 'fit',
			layout : 'accordion',
			title : '菜单导航',
			split : true,
			collapsible : true,
			layoutConfig : {
				animate : true
			},     
			items : [{
                        title : '系统管理',
                        xtype : 'treepanel',
                        expanded : true,
                        animate : true,
                        enableDD : false,
                        border : false,
                        containerScroll : true,
                        root : {
                            text : '用户管理',
                            id:'root',
                            children : [{
                                text : '用户列表',
                                id : thisys.util.Gload.WEBCONTENT +'/user/index',
                                leaf : true
                            }, {
                                text : '修改密码',
                                leaf : true,
                                id :'dept_list.jsp'
                            }]
                        },
                        listeners : {
                        	//Add a click event 
                        	itemclick: function node(v,r,item){
	                        	var n = tab.getComponent(r.raw.id);
								if(r.raw.id=='root'){
									return;
								}
	                            if (!n) { // Decide whether you have to open the panel
	                                n = tab.add({
	                                    'id' : r.raw.id,
	                                    'title' : r.raw.text,
	                                     closable : true, // Through the HTML into the target page
	                                     html : '<iframe scrolling="auto" frameborder="0" width="100%" height="100%" src="'+r.raw.id+'"></iframe>'
	                                });
	                            }
	                            tab.setActiveTab(n);
                        	}
                       }
                    }, {
                        title : 'Information Centre',
                        border : false,
                        html : '<div id="tree2" style="overflow:auto;width:100%;height:100%"></div>'
                    }, {
                        title : 'System settings',
                        border : false,
                        html : '<div id="tree3" style="overflow:auto;width:100%;height:100%"></div>'
                    }]
		},tab]
});
	/*//弹出式描述功能初始化
    Ext.QuickTips.init();
    
    var viewport = Ext.create("Ext.container.Viewport",{
    	id : "border-example",
    	layout : "border",
    	items :[{
    		region : "north",
    		height : 100,
    		html : "north"
    	},{
    		region : "west",
    		stateId : "navigation-panel",
    		id : "west-panel",
    		title : "导航",
    		split : true,
    		width : 200,
    		minWidth : 175,
    		maxWidth : 400,
    		collapsible : true,
    		animCollapse : true,
    		layout : "accordion",
    		items : [{
    			title : "系统管理",
    			items : [{
    				xtype : "treepanel",
    				border : false,
    				width : "100%",
    				id : "menu_tree",
    				root : {
    					text : "用户管理",
    					expanded : true,
    					children : [{
							"children" : [],
							"cls" : "file",
							"id":"node_2",
							"leaf":true,
							"text":"用户列表",
							"hrefTarget":"user/index"
						},{
							"children" : [],
							"cls" : "file",
							"id":"node_3",
							"leaf":true,
							"text":"修改密码",
							"hrefTarget":"user/updatePassword"
						}]
    				},
    				listeners : {
    					//tree节点事件监听器
    					"itemclick" : function(view,selectedItem){
    						
    						
    						//获得tab容器tabpanel
                            var tabPanel=Ext.getCmp('tabPanel');
                            //获得被选中的tab组建对象
                            var tab = tabPanel.getComponent(selectedItem.data.id);
                          //如果此tab还未被创建，则向tab容器添加一个tab
                            if(!tab) {
                            	tab = tabPanel.add({
                            		id : selectedItem.data.id,
                            		title : selectedItem.data.text,
                            		closable : true,
                            		autoWidth : true,
                            		autoHeight : true,
                            		active : true//为了兼容IE9
                            	});
                            	
                            	//将tab设置为当前可见可操作tab
                                tabPanel.setActiveTab(tab);//其实这步是多余的，但是在IE9下，没这步就显示不正常。

                                //异步加载js并执行，参数为要加载的JS文件的URL，这个JS包含tab内容区内容的构建程序。
                                loadData(selectedItem.data.id,selectedItem.data.hrefTarget);//此函数为自定义函数，已在上面定义。
                            }
                            
                            //将tab设置为当前可见可操作tab
                            tabPanel.setActiveTab(tab);
                            	
    					}
    				}
    			}]
    		},{
                title: '网站设置',
                html: '<p>这里放一些设置选项</p>',
                iconCls: 'settings'
            }],
    	},{
        	xtype : "tabpanel",
        	id : "tabPanel",
        	region : "center",
        	deferredRender : false,
        	activeTab : 0,
        	
        	items : [{
        		id : "firstTab",
        		html : "first tab",
        		title : "first Tab",
        		closable : true,
        		autoScroll : true
        	}]
        }]
    });
    Ext.getCmp("menu_tree").expandAll();
	 */
/*
var viewport = Ext.create("Ext.container.Viewport",{
	title : "viewport",
	layout : "border",
	frame : true,
	items : [{
		region : "west",
		title : "west",
		width : 150,
		xtype : "treepanel",
		collapsible : true,
		store: store,
	},{
		region : "north",
		height : 90,
		//collapsible : true,
		html : "管理系统"
	},{
		region : "center",
		//title : "center",
		//collapsible : true,
		xtype : "tabpanel",
		activeItem : 0,
		items :[{
			title : "首页",
			html : "首页"
		}]
	}]
});

var menuTree = Ext.create("Ext.tree.Panel",{
	items: [{
	         xtype: 'textfield',
	         fieldLabel: 'Foo'
	     },{
	         xtype: 'textfield',
	         fieldLabel: 'Bar'
	     },{
	         xtype: 'numberfield',
	         fieldLabel: 'Num'
	}],
	 
    listeners : {
    	 click : function(node,e){
                Ext.Msg.alert(node.id); 
        }
    }
});


	var store = Ext.create('Ext.data.TreeStore', {
	root : {
		expanded : true,
		children : [ {
			text : "detention",
			leaf : true
		}, {
			text : "homework",
			expanded : true,
			children : [ {
				text : "book report",
				leaf : true
			}, {
				text : "algebra",
				leaf : true
			} ]
		}, {
			text : "buy lottery tickets",
			leaf : true
		} ]
	}
});
 */
/*
 * var containerPanel = Ext.create("Ext.panel.Panel", { renderTo:
 * Ext.getBody(), width: 400, height: 200, title: "Container Panel", layout :
 * "column", suspendLayut : true, });
 * 
 * 
 * containerPanel.add({ xtype : "panel", title : "child panel 1", height :
 * 100, columnWidth : 0.5 }); containerPanel.add({ xtype : "panel", title :
 * "child panel 2", height : 100, columnWidth : 0.5 });
 * 
 * 
 * containerPanel.suspendLayut = false; containerPanel.doLayout();
 */
		})