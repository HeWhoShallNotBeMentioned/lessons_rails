class LessonsController < ApplicationController
  def index
    @section = Section.find(params[:section_id])
    @lessons = Lesson.all
    render :index
  end

  def show
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    redirect_to section_path(@lesson.section)
  end

  def new
    @section=Section.find(params[:section_id])
    @lesson = @section.lessons.new
  end

  def create
    @section= Section.find(params[:section_id])
    @lesson = @section.lessons.new(lesson_params)
    if @lesson.save
      flash[:notice] = "Lesson successfully added!"
      redirect_to section_path(@lesson.section)
    else
      render :new
    end
  end

  def edit
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    render :edit
  end

  def update
    @section = Section.find(params[:section_id])
    @lesson = Lesson.find(params[:id])
    if @lesson.update(lesson_params)
      flash[:notice] = "Lesson successfully updated!"
      redirect_to section_path(@lesson.section)
    else
      render :edit
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to section_lessons_path
  end

  private
  def lesson_params
    params.require(:lesson).permit(:name, :content, :number)
  end
end
