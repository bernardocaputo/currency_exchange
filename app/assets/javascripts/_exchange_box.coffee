$(document).ready ->
  $('form').submit ->
    if $('form').attr('action') == '/exchange'
      $.ajax '/exchange',
          type: 'POST'
          dataType: 'json'
          data: {
                  currency: $("#currency").val(),
                  currency_destination: $("#currency_destination").val(),
                  quantity: $("#quantity").val()
                }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false;

$(document).ready ->
  currency = $('#currency')
  currency_destination = $('#currency_destination')
  $(document).on 'click', '#changevalue', ->
    aux = currency.val()
    currency.val currency_destination.val()
    currency_destination.val aux
    console.log aux
    $('form').submit()
    return
  return



# ---
# generated by js2coffee 2.2.0
