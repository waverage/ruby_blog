$ ->
    setTimeout(closeAlerts, 3000)
    
closeAlerts = () ->
    $('.alert').alert('close');