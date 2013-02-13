class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  def index
    if params[:format] == 'json'
      render :json => ArticlesDatatable.new(view_context)
    else
      per_page = if params[:per_page]
        params[:per_page]
      else
        5
      end
      @articles = if params[:course_id] 
        Article.where(:course_id => params[:course_id]).order("id").page(params[:page]).per(per_page)
      else
        Article.all.order("id").page(params[:page]).per(per_page)
      end
    end
  end

  # GET /articles/1
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
    if request.xhr?
      render layout: false
    end
  end

  # GET /articles/1/edit
  def edit
    if request.xhr?
      render layout: false
    end
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
    redirect_to articles_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:id, :title, :short, :full, :image_url, :state, :picture, :course_id)
    end
end
