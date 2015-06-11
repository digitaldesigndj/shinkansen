# Shinkansen

Nginx + Node Delivered HTML, Omakase

## A Developer Environment & Static Website Generator

* Grunt
* Jade
* Stylus/Nib
* Bower
* Live Reload
* Live Linting
* Page Speed Optimizations


#### Kind of like Rails, Shinkansen is Omakase. Using Node JS and Grunt it brings together 3 templating languages.

* Jade -> HTML
* Stylus -> CSS
* CoffeeScript -> JavaScript

### Directory Structure

##### External Dependencies

bower_components -> bower.json -> frontend
node_modules -> package.json -> backend

##### Source Directories

src -> .jade
	css -> .styl
	jade -> .jade [includes]
	js -> .js or .coffee

src -> source code
src_files -> static assets

Output Directories

dev -> human friendly output + livereload
public_html -> final optmized output


### Drawbacks

Testing! -> Optmization adds a new layer of complexity we have to account for. You need to test your /dev code and the /public_html generated output. Ocassionaly there are issues that arise only after the final generation.

### Benefits

Testing! -> Lints and Templating languages enforce rules that make you code in a better way.

Chuo -> Build and Deploy Server

<!-- bash -->

Lints

* Stylus -> stylint -> CSS (Use Seperate CLI)


Minification

* Stylus -> stylint -> CSS -> cssmin
* CoffeeScript -> JavaScript -> jshint -> uglify

### Installing Client Side Deps with BOWER

1. `bower install --save SOMETHING`
1. Add scripts to `src/jade/footer.jade`
1. Add stylesheets to `src/jade/header.jade`
1. Add scripts the uglify task in `Gruntfile.coffee`
1. Add stylesheets to the cssmin task in `Gruntfile.coffee`

Adding your includes to `header.jade` and `footer.jade` files allows thier use in the `/dev` version of the site. Files are included in the exported `/dest` version of the site when you add them to the Gruntfile tasks.


### Get Started

#### Webserver

You will also need an HTTP server, I prefer nginx.

## OSX

brew install nginx
nano 

## Ubuntu

``` bash
apt-get install nginx
cd /etc/nginx/sites-enabled
rm default
nano /etc/nginx/nginx.conf
cd /etc/nginx/sites-available
mv default example.com
nano examples.com
ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com
```

## Operating Nginx

If you are using port 80, you'll need `sudo`

``` bash
# Test config
nginx -t
# Reload config
nginx -s reload
```



If you don't already have a local server, SimpleHTTPServer can also be good option. You'll need another terminal window.

```bash
cd /path/to/project
python -m SimpleHTTPServer
```

You should serve up the whole `project` directory on your webserver. This means you will develop your site at the url `/project/dev`

#### Command Line Stuff

* Clone the repo `git clone ...`
* Install Global Dependancies `npm install -g bower grunt-cli`
* Install Server Side Dependancies `npm install`
* Install Client Side Dependancies `bower install`
* Run Grunt `grunt` or `grunt watch`


### Jade Templating

There is a data.json file in the root dir that handles site wide template data. Define variables in that file to use them in your templates.


### Commands

* `grunt` default task is watch (LiveReload with Stylus and Jade templates)
* `grunt watch` same as above, outputs a dev version of the site to `dev/` and starts a livereload server
* `grunt stylus` compile stylus
* `grunt jade` compile jade
* `grunt clean` clean up the out & dest directories
* `grunt build` clean, jade then stylus
* `grunt export` builds, concatonates and minifies to `dest/`


### Edge Cases

Fontawesome - You'll need to copy the /fonts directory into `src_files` to make it work in production, any bower component that does an relative internal 'require', 'url' or 'import' call will run into this sort of thing.

Google Fonts - I really wish Bower and Google Fonts would play nice together, but they just don't. For now just use the `bypass` configuration section to include the stylesheet directly from the CDN. (even in production)
