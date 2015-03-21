class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_lesson

  def edit
    @comment = Comment.find(params[:id])
    if @comment.user != current_user
      redirect_to @lesson, notice: "Sorry Charlie!"
    end
  end

  def create
    @comment = @lesson.comments.build(comment_params)
    if @comment.save
      redirect_to @lesson
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @lesson
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
      redirect_to @post
    else
      redirect_to @lesson, notice: "Sorry Charlie!"
    end
  end



  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end


  def comment_params
    params.require(:comment).permit(:body, :user_id, :lesson_id)
  end
end
