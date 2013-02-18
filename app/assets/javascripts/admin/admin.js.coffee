@add_nested_form_for_questions = ->
  $('.add_articles').click ->
    $.ajax(
      url: "/articles/new?remote=true"
    ).done (data) ->
      #log data
      list      = $('#myTab')
      container = list.parents('.tabbable')
      content   = container.find('.tab-content')

      count = list.find('li').length

      list.find('li').removeClass 'active'
      log 'removed'
      list.append $ "<li><a href='#tab#{count+1}' data-toggle='tab'>Article #{count+1}</a></li>"
      log 'appended'
      content.append $ """<div id='tab#{count+1}' class='tab-pane'>#{data}</div>"""
      log 'data appended'

      $("#tab#{count+1} .wysihtml5").each (i, elem) -> 
        $(elem).wysihtml5()

      $("#tab#{count+1} select").select2()
      $("#tab#{count+1} input[type=checkbox],#tab#{count+1} input[type=radio],#tab#{count+1} input[type=file]").uniform();

      $("#tab#{count+1} form.articles input[type='submit']").click (event) ->
        event.preventDefault()
        $("#tab#{count+1} form").submit();
        false


      $("#tab#{count+1} form.articles").bind "ajax:success", (data) ->
        alert "Success! #{data}"
        elem = $ @
        log elem
        elem.parent().empty().append $ data

      $("#tab#{count+1} form.articles").bind "ajax:error", (xhr, status, error) ->
        response = JSON.parse(status.responseText)
        for error in response.errors
          log error

      setTimeout ->
        $('#myTab a:last').tab('show')
      , 100


    false

@log = ->
  try
    console.log.apply(console, arguments)

@define_data_tables = ->
  elem_arr = $('.data-table')

  for elem in elem_arr
    elem = $ elem
    id = elem.attr('id')
    log id

    $("##{id}").dataTable
      sPaginationType: "full_numbers"
      bJQueryUI: true
      sDom: "<\"\"l>tr<\"F\"fp>"
      bProcessing: true
      bServerSide: true
      aaSorting: [[ 0, "desc" ]]
      bAutoWidth: false
      sAjaxSource: $("##{id}").data('source')
      fnDrawCallback: (oSettings) ->
        #this function called after rendering table
        $('input[type=checkbox],input[type=radio],input[type=file]').uniform()
        $(".state_select").editable
          ajaxOptions:
            type: 'PATCH'
          name:  'state'
          value: 2
          source: [
            value: "published"
            text: "published"
          ,
            value: "draft"
            text: "draft"
          ]


jQuery ->

  $("#myTab a").click (e) ->
    e.preventDefault()
    $(this).tab "show"

  $('input[type=checkbox],input[type=radio],input[type=file]').uniform()

  add_nested_form_for_questions()

  define_data_tables()