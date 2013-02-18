class CoursesDatatable < AjaxDatatablesRails
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: courses.count,
      iTotalDisplayRecords: courses.count,
      aaData: data
    }
  end

private

  def data
    courses.map do |course|
      [
        check_box('id',course.id, {}, course.id, course.id),
        course.updated_at.strftime("%B %e, %Y"),
        link_to(course.title, course),
        course.short,
        "<a name='state' class='state_select' data-type='select' data-pk='#{course.id}' data-url='#{course_path(course)}'>#{course.state}</a>",
        "
          #{link_to('edit', edit_course_path(course), :class => 'btn btn-mini')}
          #{link_to('destroy', course_path(course), :method => :delete, :data => { :confirm => 'confirm', :default => 'Are you sure?'}, :class => 'btn btn-mini btn-danger')}
        "
      ]
    end
  end

  def courses
    @courses ||= fetch_courses
  end

  def fetch_courses
    courses = Course.order("#{sort_column} #{sort_direction}")
    courses = Course.page(page).per(per_page)
    if params[:sSearch].present?
      courses = Course.where("title like :search or short like :search", search: "%#{params[:sSearch]}%")
    end
    courses
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