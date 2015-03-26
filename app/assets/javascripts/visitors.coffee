# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
SO.create_user = (data) ->
    user = this.elem("user")
    info = this.elem("info")
    img  = this.elem("img")
    span = this.elem("span")
    a    = this.elem("a")

    img.src     = data.avatar_url + "&size=100"
    a.href      = data.html_url
    a.target    = "blank"

    span.className = "name"
    span.innerHTML = data.login

    a.appendChild(img)
    a.appendChild(span)

    user.appendChild(a)
    info.appendChild(user)


$ ->
   $.getJSON "https://api.github.com/search/users?q=followers:%3E100+sort:followers&per_page=20", (data) ->
     frag = document.createDocumentFragment()
     frag.appendChild SO.create_user user for user in data.items
     $(".users").html(frag)
