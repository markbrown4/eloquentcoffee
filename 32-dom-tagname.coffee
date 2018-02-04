
{ JSDOM } = require 'jsdom'

html = """
<h1>Heading with a <span>span</span> element.</h1>
<p>A paragraph with <span>one</span>, <span>two</span> spans.</p>
"""

dom = new JSDOM html
window = dom.window
document = window.document

byTagName = (node, tagName) ->
  find = (node, tagName) ->
    results = []
    for node in node.childNodes
      if tagName.toUpperCase() == node.tagName
        results.push node
      results = results.concat find(node, tagName)
    results

  find node, tagName.toUpperCase()

console.log byTagName(document.body, "h1").length
# 1
console.log byTagName(document.body, "span").length
# 3
para = document.querySelector "p"
console.log byTagName(para, "span").length
# 2
