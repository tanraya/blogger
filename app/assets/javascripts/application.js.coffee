#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap

$ ->
  $('.post-image.processing').each ->
    count    = 0
    attempts = 30
    image    = $(@)

    interval = setInterval(->
      $.ajax
        url     : image.data('lookup-uri')
        success : (data) ->
          clearInterval(interval) if count == attempts
          count += 1

          if data.uri
            image.attr('src', data.uri)
            image.removeClass('processing')
            clearInterval(interval)
        error: ->
          clearInterval(interval)
    , 1000)

    
