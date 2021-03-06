class ArticlesDatatable < AjaxDatatablesRails
  delegate :params, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Article.count,
      iTotalDisplayRecords: Article.count,
      aaData: data
    }
  end

private

  def data
    articles.map do |article|
      [
        check_box('id',article.id, {}, article.id, article.id),
        article.updated_at.strftime("%B %e, %Y"),
        link_to(article.title, article),
        article.short,
        image_tag(article.picture.url(:original)),
        "<a name='state' class='state_select' data-type='select' data-pk='#{article.id}' data-url='#{article_path(article)}'>#{article.state}</a>",
        link_to(article.course.title, article.course),
        "
          #{link_to('edit', edit_article_path(article), :class => 'btn btn-mini')}
          #{link_to('destroy', article_path(article), :method => :delete, :data => { :confirm => 'confirm', :default => 'Are you sure?'}, :class => 'btn btn-mini btn-danger')}
        "
      ]
    end
  end

  def articles
    @articles ||= fetch_articles
  end

  def fetch_articles
    articles = Article.order("#{sort_column} #{sort_direction}")
    articles = articles.page(page).per(per_page)
    if params[:sSearch].present?
      articles = articles.where("title like :search or short like :search", search: "%#{params[:sSearch]}%")
    end
    articles
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