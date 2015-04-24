console.log 'things'

# # loadCSS '../bower_components/bootstrap/dist/css/bootstrap.css'
# # loadCSS 'css/style.css'
# # loadCSS 'css/index.css'

cb = ->
  l = document.createElement('link')
  l.rel = 'stylesheet'
  l.href = 'css/bundle.css'
  h = document.getElementsByTagName('head')[0]
  h.parentNode.insertBefore l, h
  return

raf = requestAnimationFrame or mozRequestAnimationFrame or webkitRequestAnimationFrame or msRequestAnimationFrame
if raf
  raf cb
else
  window.addEventListener 'load', cb