
{ JSDOM } = require 'jsdom'
{ tidy } = require 'htmltidy'

MOUNTAINS = [
  {name: "Kilimanjaro", height: 5895, place: "Tanzania"},
  {name: "Everest", height: 8848, place: "Nepal"},
  {name: "Mount Fuji", height: 3776, place: "Japan"},
  {name: "Vaalserberg", height: 323, place: "Netherlands"},
  {name: "Denali", height: 6168, place: "United States"},
  {name: "Popocatepetl", height: 5465, place: "Mexico"},
  {name: "Mont Blanc", height: 4808, place: "Italy/France"}
]

html = """
<h1>Mountains</h1>
<div id="mountains"></div>
"""

dom = new JSDOM html
window = dom.window
document = window.document

buildTable = (data) ->
  table = document.createElement 'table'
  keys = Object.keys data[0]

  # header
  tr = document.createElement 'tr'
  keys.forEach (key) ->
    th = document.createElement 'th'
    th.textContent = key
    tr.appendChild th
  table.appendChild tr

  # body
  for row in data
    tr = document.createElement 'tr'
    keys.forEach (key) ->
      td = document.createElement 'td'
      value = row[key]
      td.textContent = value
      td.align = 'right' if typeof value == 'number'
      tr.appendChild td
    table.appendChild tr

  table

table = buildTable MOUNTAINS
mountains = document.querySelector '#mountains'
mountains.appendChild table

html = document.documentElement.innerHTML
options = { doctype: 'html5', indent: true }

tidy html, options, (err, html) ->
  console.log html
