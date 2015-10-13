class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    render :index
  end

  def show
    @lesson = Lesson.find(params[:id])
    render :show
  end
end
