class CommentsController < ApplicationController
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_comment, only: %i[show]

  # GET /comments
  def index
    @comments = @lesson.comments.order("created_at DESC")

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = @lesson.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
