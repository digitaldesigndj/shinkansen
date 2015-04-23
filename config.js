module.exports = {
	title: "Shinkansen"
	, description: "HTML/CSS/JS Developer Tools"
	, javascripts: [
		'bower_components/jquery/dist/jquery.js'
		, 'bower_components/bootstrap/dist/js/bootstrap.js'
		, 'dev/js/ga.js'
		, 'dev/js/script.js'
	]
	, stylesheets: [
		'bower_components/bootstrap/dist/css/bootstrap.css'
		, 'bower_components/bootstrap-select/dist/css/bootstrap-select.css'
		, 'bower_components/pace/themes/green/pace-theme-barber-shop.css'
		, 'dev/css/style.css'
	]
	, bypass: {
		stylesheets: []
		, javascripts: ['//use.typekit.net/aop6lzk.js']
	}
};