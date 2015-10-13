class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render :index
  end

  def show
    @lesson = Lesson.find(params[:id])
    render :show
  end

  def new
    @lesson = Lesson.new
    render :new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name)
  end
end
