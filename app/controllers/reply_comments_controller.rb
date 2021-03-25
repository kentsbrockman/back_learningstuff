class ReplyCommentsController < ApplicationController
  before_action :set_reply_comment, only: [:show, :update, :destroy]
  before_action :get_course
  before_action :get_chapter
  before_action :get_lesson
  before_action :authenticate_user!
  before_action :check_user_is_subscribed


  # GET /reply_comments
  def index
    @reply_comments = ReplyComment.all

    render json: @reply_comments
  end

  # GET /reply_comments/1
  def show
    render json: @reply_comment
  end

  # POST /reply_comments
  def create
    @reply_comment = ReplyComment.new(reply_comment_params)

    if @reply_comment.save
      render json: @reply_comment, status: :created
    else
      render json: @reply_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reply_comments/1
  def update
    if @reply_comment.update(reply_comment_params)
      render json: @reply_comment
    else
      render json: @reply_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reply_comments/1
  def destroy
    @reply_comment.destroy
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
end
