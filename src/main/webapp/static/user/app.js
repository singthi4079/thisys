Ext.application({
    requires: ["Ext.container.Viewport"],
    name: "userManager",

    appFolder: "app",

    controllers : ["UserController"],
    
    launch: function() {
        Ext.create("Ext.container.Viewport", {
            layout: "fit",
            items: [
                {
                    xtype: "userList",
                    title: "Users",
                    html : "List of users will go here"
                }
            ]
        });
    }
});