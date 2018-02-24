###

One of the things that HTTP can do, but that we have not discussed in this
chapter, is called content negotiation. The Accept header for a request can be
used to tell the server what type of document the client would like to get. Many
servers ignore this header, but when a server knows of various ways to encode a
resource, it can look at this header and send the one that the client prefers.

The URL eloquentjavascript.net/author is configured to respond with either
plaintext, HTML, or JSON, depending on what the client asks for. These formats
are identified by the standardized media types text/plain, text/html, and
application/json.

Send requests to fetch all three formats of this resource. Use the
setRequestHeader method of your XMLHttpRequest object to set the header named
Accept to one of the media types given earlier. Make sure you set the header
after calling open but before calling send.

Finally, try asking for the media type application/rainbows+unicorns and see
what happens.

###

{ JSDOM } = require 'jsdom'

dom = new JSDOM()
{ XMLHttpRequest } = dom.window

fetch = (accept) ->
  new Promise (resolve) ->
    xhr = new XMLHttpRequest()
    xhr.open 'GET', 'http://eloquentjavascript.net/author', true
    xhr.setRequestHeader 'Accept', accept
    xhr.addEventListener 'load', () ->
      resolve xhr
    xhr.send null

contentTypes = [
  'text/plain'
  'text/html'
  'application/json'
  'application/rainbows+unicorns'
]
contentTypes.forEach (contentType) ->
  xhr = await fetch(contentType)
  console.log contentType
  console.log xhr.status
  console.log xhr.responseText
