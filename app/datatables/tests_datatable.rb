class TestsDatatable < AjaxDatatablesRails
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Test.count,
      iTotalDisplayRecords: Test.count,
      aaData: data
    }
  end

private

  def data
    tests.map do |test|
      [
        check_box('id',test.id, {}, test.id, test.id),
        test.updated_at.strftime("%B %e, %Y"),
        link_to(test.title, test),
        test.short,
        "<a name='state' class='state_select' data-type='select' data-pk='#{test.id}' data-url='#{test_path(test)}'>#{test.state}</a>",
        link_to(test.course.title, test.course),
        "
          #{link_to('edit', edit_test_path(test), :class => 'btn btn-mini')}
          #{link_to('destroy', test_path(test), :method => :delete, :data => { :confirm => 'confirm', :default => 'Are you sure?'}, :class => 'btn btn-mini btn-danger')}
        "
      ]
    end
  end

  def tests
    @tests ||= fetch_tests
  end

  def fetch_tests
    tests = Test.order("#{sort_column} #{sort_direction}")
    tests = tests.page(page).per(per_page)
    if params[:sSearch].present?
      tests = tests.where("title like :search or short like :search", search: "%#{params[:sSearch]}%")
    end
    tests
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[updated_at title short state image_url course_id]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end