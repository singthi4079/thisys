Ext.define("userManager.store.Users", {
	extend : "Ext.data.Store",

	model : "userManager.model.User",

	/*	local data
	data : [{
		name : "Ed",
		email : "ed@sencha.com"
	},{
		name : "Tommy",
		email : "tommy@sencha.com"
	}]
	 */

	/*server data*/
	autoLoad : true,
	/*data in static file
	proxy : {
		type : "ajax",
		//url : "data/users.json",
		api : {
			read : thisys.util.Gload.WEBCONTENTSTATIC +"/user/data/users.json",
			update : thisys.util.Gload.WEBCONTENTSTATIC +"/user/data/updateUsers.json"
		},
		reader : {
			type : "json",
			root : "users",
			successProperty : "success"
		}
	}
	*/
	
	
	proxy : {
		type : "ajax",
		url : "listJson",
		reader : {
			type : "json",
			root : "users",
			successProperty : "success",
			idProperty : "id",
			//record : "User",
			totalRecords : "results"
		}
	}
});

/*
 * 
 * Ext.create('Ext.data.Store', {
 model: 'User',

 sorters: ['name', 'id'],
 filters: {
 property: 'name',
 value   : 'Ed'
 },
 groupField: 'age',
 groupDir: 'DESC'
 });

 这段代码创建的store，数据会先根据name后根据id来排序，name不是Ed的Users会被过滤掉，而且数据还会根据年龄分组并且倒序。通过Store的api改变排序、过滤、分组都很容易
 * */

