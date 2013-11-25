# Filename:
#   main.coffee
# 
# Author:
#   fantasyshao (me@fantasyshao.com)
#
# Copyright (c) fantasyshao, 2013
# 
# License:
#   the MIT License
#

class GitHub
    #
    # Initialize
    # 
    init: () ->
        @.bindEvent()
        @.render()
        true
    #
    # Bind click and other events to elements
    #
    bindEvent: () ->
        $('#save-user').bind 'click', (event) ->
            if $('#name').val().trim() isnt ''
                localStorage.setItem 'github-user', $('#name').val()
                $('#accountNoty > p').text('Account name saved.').parent().popup('open')
            else
                $('#accountNoty > p').text('Cannot be empty').parent().popup('open')
            false
        true
    #
    # Render pages
    # 
    render: () ->
        if localStorage.getItem 'github-user' is null
            console.log 'user not seted'
        else
            console.log 'user seted'
        true

G = new GitHub()
G.init()
