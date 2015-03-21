class LessonsController < ApplicationController
  def show
    @lesson = Lesson.find(params[:id])
    @comments = @lesson.comments
    # raise "The Roof!"
    @comment = @lesson.comments.new
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      flash[:success] = "You Added a New Song... Hazaaah!!!!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(lesson_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy

  end

  private

  def lesson_params
    params.require(:lesson).permit(:name, :description, :video_url)
  end
end
