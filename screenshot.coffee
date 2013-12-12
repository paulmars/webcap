# fs      = require('fs')
# sys     = require('system')
# webpage = require('webpage')

# screenSize =
#   width : sys.args[2] || 1024
#   height : sys.args[3] || 768
# imageSize =
#   width : sys.args[4] || 400
#   height : sys.args[5] || 300

# filename = Math.random().toString(36).substring(2)
# console.log "filename", filename

# captureFile = "#{filename}.jpg"

# url = "https://google.com"

# page = webpage.create()
# page.viewportSize = screenSize
# page.clipRect = { top: 0, left: 0, width: screenSize.width, height: screenSize.height }

# page.onAlert = (msg) ->
#   console.log msg

# page.onError = (msg, trace) ->
#   console.log msg
#   trace.forEach (item) -> console.log "  ", item.file, ":", item.line

# page.open url, (status) ->
#   console.log "status", status
#   page.render(filename)
#   console.log "open", captureFile
#   phantom.exit()

WebPage = require("webpage")
page = WebPage.create()

url = "http://google.com"

page.open url, (status) ->
  console.log "status", url, status

# page.onAlert = (msg) ->
#   console.log msg

# page.onError = (msg, trace) ->
#   console.log msg
#   trace.forEach (item) -> console.log "  ", item.file, ":", item.line

page.onLoadFinished = ->
  console.log "finished"
  page.render "googleScreenShot" + ".png"
  console.log "written"
  phantom.exit()
