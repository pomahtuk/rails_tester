class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  include TesterControllers::StateMachine

  # GET /courses
  def index
    @courses = Course.all
  end

  # GET /admin/courses
  def admin_index
    if params[:format] == 'json'
      render :json => CoursesDatatable.new(view_context)
    else
      per_page = if params[:per_page]
        params[:per_page]
      else
        5
      end
      @courses = if params[:course_id] 
        Course.where(:course_id => params[:course_id]).order("id").page(params[:page]).per(per_page)
      else
        Course.all.order("id").page(params[:page]).per(per_page)
      end
    end
  end

  # GET /courses/1
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /courses/1
  def update
    if !!params[:pk]
      define_state_for_object()
    else
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :short, :full, :state)
    end
end
