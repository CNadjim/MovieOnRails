class CommentsController < ApplicationController
  before_action :authenticate_user!, only: %i[create_movies_comment,create_tvshows_comment]

  # POST /comments/movies/:id
  def create_movies_comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.date = Date.today
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.movie, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to '/'}
      end
    end
  end

  # POST /comments/tvshows/:id
  def create_tvshows_comment
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.date = Date.today
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.tvshow, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to '/'}
      end
    end
  end


  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:text, :date, :user_id, :movie_id, :tvshow_id)
  end
end
