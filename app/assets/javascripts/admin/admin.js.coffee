@add_nested_form_for_courses = ->
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


      $("#tab#{count+1} form.articles").bind "ajax:success", (event, data) ->
        elem = $ @
        elem.parent().empty().append $ data

      $("#tab#{count+1} form.articles").bind "ajax:error", (xhr, status, error) ->
        response = JSON.parse(status.responseText)
        for error in response.errors
          log error

      wrapper_for_cancel()

      setTimeout ->
        $('#myTab a:last').tab('show')
      , 100


    false

  $('.add_tests').click ->
    $.ajax(
      url: "/tests/new?remote=true"
    ).done (data) ->
      #log data
      list      = $('#myTab1')
      container = list.parents('.tabbable')
      content   = container.find('.tab-content')

      count = list.find('li').length

      list.find('li').removeClass 'active'
      log 'removed'
      list.append $ "<li><a href='#tab1#{count+1}' data-toggle='tab'>Test #{count+1}</a></li>"
      log 'appended'
      content.append $ """<div id='tab1#{count+1}' class='tab-pane'>#{data}</div>"""
      log 'data appended'

      $("#tab1#{count+1} .wysihtml5").each (i, elem) -> 
        $(elem).wysihtml5()

      $("#tab1#{count+1} select").select2()
      $("#tab1#{count+1} input[type=checkbox],#tab#{count+1} input[type=radio],#tab#{count+1} input[type=file]").uniform();

      $("#tab1#{count+1} form.tests input[type='submit']").click (event) ->
        event.preventDefault()
        $("#tab1#{count+1} form").submit();
        false


      $("#tab1#{count+1} form.tests").bind "ajax:success", (event, data) ->
        elem = $ @
        elem.parent().empty().append $ data

      $("#tab1#{count+1} form.tests").bind "ajax:error", (xhr, status, error) ->
        response = JSON.parse(status.responseText)
        for error in response.errors
          log error

      wrapper_for_cancel()

      setTimeout ->
        $('#myTab1 a:last').tab('show')
      , 100


    false

@log = ->
  try
    console.log.apply(console, arguments)

@wrapper_for_cancel = ->
  $(".widget-content a.btn.cancel").click ->
    elem = $ @
    if elem.parents('a').length isnt 0
      elem = elem.parents('a')
    container = elem.parents('.tab-pane')
    id        = container.attr('id')
    link      = $(".nav a[href='##{id}']")
    link_cont = link.parents('li')
    menu_cont = link_cont.parents('.nav')
    link_cont.remove()
    container.remove()
    menu_cont.find('a').last().click()
    false

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
          ,
            value: "blocked"
            text: "blocked"
          ]

jQuery ->

  $("#myTab a").click (e) ->
    e.preventDefault()
    $(this).tab "show"

  $('#myTab1 li').click ->
    unless $('#collapseTwo').height() > 0
      $('.collapseTwo').click()

  $('#myTab li').click ->
    unless $('#collapseOne').height() > 0
      $('.collapseOne').click()

  # $('.widget-content a.btn:not(.btn-danger)').click ->
  #   elem = $ @
  #   $.ajax(
  #     url: "/articles/new?remote=true"
  #   ).done (data) ->
  #   false

  $(".widget-content a.btn.edit").bind "ajax:success", (event,  data) ->
    elem = $ @
    container = elem.parents('.tab-pane')
    new_elem = $ data
    container.empty().append new_elem
    $("select", container).select2()
    $(".wysihtml5", container).each (i, elem) -> 
      $(elem).wysihtml5()

  $(".widget-content a.btn-danger.delete").bind "ajax:success", (event,  data) ->
    elem = $ @
    if data is 'Ok'
      container = elem.parents('.tab-pane')
      id        = container.attr('id')
      link      = $(".nav a[href='##{id}']")
      link_cont = link.parents('li')
      menu_cont = link_cont.parents('.nav')
      link_cont.remove()
      container.remove()
      menu_cont.find('a').first().click()


  $('input[type=checkbox],input[type=radio],input[type=file]').uniform()

  add_nested_form_for_courses()

  define_data_tables()