Ext.application({
    requires: ["Ext.container.Viewport","thisys.util.Gload"],
    name: "userManager",

    appFolder: thisys.util.Gload.WEBCONTENTSTATIC + "/user/app",

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