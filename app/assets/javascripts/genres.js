$(document).on("ready", function() {
  $.ajaxSetup({
    headers: {
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  $('#main .container').on('click', function() {
    $(this).toggleClass('chosen')
    if ($(this).hasClass('chosen')) {
      $(this).find('.content').hide()
      $(this).find('.description').fadeIn('slow')
    } else {
      $(this).find('.description').fadeOut('slow', () => $(this).find('.content').show())
    }
  })

  $('.choose-button').on('click', function(e) {
    e.preventDefault()

    var data = {}

    $('#main .container').each(function() {
      if ($(this).hasClass('chosen')) {
        var genreName = $(this).data('name')
        data[genreName] = true
      }
    })

    $.ajax({
      type: "POST",
      url: "/genres/choose",
      data: data,
      success: function() {
        window.location.reload()
      }
    })
  })

})
