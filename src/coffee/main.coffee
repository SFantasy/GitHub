# Filename:
#   main.coffee
# 
# Author:
#   fantasyshao (me@fantasyshao.com)
#
# Copyright (c) 2013 fantasyshao
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
    # Get the url of 'https://api.github.com'
    # 
    getAction: () ->
        basicUrl: 'https://api.github.com/users/'
    #
    # Bind click and other events to elements
    #
    bindEvent: () ->
        $('#save-user').bind 'click', (event) ->
            if $('#name').val().trim() isnt ''
                localStorage.setItem 'github-user', $('#name').val()
                $('#accountNoty > p').text('Account name saved.').parent().popup('open')
                location.reload()
            else
                $('#accountNoty > p').text('Cannot be empty').parent().popup('open')
            false
        true
    #
    # Render pages
    # 
    render: () ->
        self = this
        if localStorage.getItem 'github-user' is null
            console.log 'user not seted'
        else
            USER_NAME = localStorage.getItem 'github-user'
            # Render news for specificed user
            $.ajax
                url: self.getAction().basicUrl + USER_NAME + '/received_events'
                success: (data) ->
                    for item in data
                        if item.type isnt 'GistEvent'
                            console.log item
                            if item.payload.action is ''
                                word = 'created '
                            else
                                word = 'starred '

                            $('#newsList').append '<li>' +
                                                '<img src="' + item.actor.avatar_url + '">' +
                                                '<h2>' + item.actor.login + '</h2>has ' + word +
                                                item.repo.name + '</a>' + '</li>'

                    $('#newsList').listview 'refresh'

            # Render information of the specificed user
            $.ajax
                url: self.getAction().basicUrl + USER_NAME
                success: (data) ->
                    $('#ghAvatar').attr 'src', data.avatar_url
                    $('#ghFollow').text data.followers
                    $('#ghFollowing').text data.following

                    $.ajax
                        url: self.getAction().basicUrl + USER_NAME + '/starred'
                        success: (data) ->
                            $('#ghStar').text data.length

                    $('#ghName a').text "Name: #{data.login}"
                    $('#ghLocation a').text "Located in #{data.location}"
                    $('#ghCompany a').text "Working at #{data.company}"
                    $('#ghBlog a')
                        .attr("href", data.blog)
                        .text "Blogged at #{data.blog}"

                    $('#ghEmail a')
                        .attr('href', 'mailto:' + data.email)
                        .text "Email: #{data.email}"
        true

G = new GitHub()
G.init()
