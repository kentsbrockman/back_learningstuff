class ReplyCommentsController < ApplicationController
  before_action :set_reply_comment, only: %i[show update destroy]
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed
  before_action :set_comment

  # GET /reply_comments
  def index
    @reply_comments = @comment.reply_comments

    render json: @reply_comments
  end

  # POST /reply_comments
  def create
    @reply_comment = @comment.reply_comments.new(reply_comment_params)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reply_comment
    @reply_comment = ReplyComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def reply_comment_params
    params.require(:reply_comment).permit(:content, :user_id, :comment_id)
  end

  def set_comment
    @comment = Comment.find(params[:comment_id])
  end
end
