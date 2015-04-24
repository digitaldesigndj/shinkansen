module.exports = {
	title: "Shinkansen"
	, description: "HTML/CSS/JS Developer Tools"
	, javascripts: [
		// 'bower_components/jquery/dist/jquery.js'
		// , 'bower_components/bootstrap/dist/js/bootstrap.js'
		'dev/js/tag.js'
		, 'dev/js/script.js'
	]
	, stylesheets: [
		'bower_components/bootstrap/dist/css/bootstrap.css'
		, 'dev/css/style.css'
	]
	, bypass: {
		stylesheets: []
		, javascripts: ['//use.typekit.net/aop6lzk.js']
	}
};