jQuery ->
  $('.data-table').dataTable
    sPaginationType: "full_numbers"
    bJQueryUI: true
    sDom: "<\"\"l>tr<\"F\"fp>"
    bProcessing: true
    bServerSide: true
    aaSorting: [[ 0, "desc" ]]
    bAutoWidth: false
    sAjaxSource: $('#articles').data('source')

# $(".data-table").dataTable
#   bJQueryUI: true
#   bProcessing: true
#   bServerSide: true
#   sAjaxSource: $("#products").data("source")
#   sPaginationType: "full_numbers"
#   sDom: "<\"\"l>t<\"F\"fp>"
