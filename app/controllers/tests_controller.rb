class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  include TesterControllers::StateMachine

  # GET /tests
  def index
    @tests = params[:course_id] ? Test.where(:course_id => params[:course_id]) : Test.all
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    if request.xhr?
      render layout: false
    end
  end

  # GET /tests/1/edit
  def edit
    if request.xhr?
      render layout: false
    end
  end

  # POST /tests
  def create
    @test = Test.new(test_params)

    if @test.save
      if request.xhr?
        render :show, :layout => false, notice: 'Test was successfully created.'
      else
        redirect_to @test, notice: 'Test was successfully created.'
      end
    else
      if request.xhr?
        render json: { :errors => @test.errors.full_messages }, status: 422
      else
        render action: 'new'
      end
    end
  end

  # PATCH/PUT /tests/1
  def update
    # if @test.update(test_params)
    #   redirect_to @test, notice: 'Test was successfully updated.'
    # else
    #   render action: 'edit'
    # end
    if !!params[:pk]
      define_state_for_object()
    else
      if @test.update(test_params)
        redirect_to @test, notice: 'Test was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to tests_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.require(:test).permit(:title, :short, :state)
    end
end
