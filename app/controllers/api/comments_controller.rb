class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.persisted?
      render json: {message: 'This comment has been posted'},
      status: 200
    else
      render json: {message: 'Something went wrong'}
  end
end


  private
  def comment_params 
    params.require(:comment).permit(:body, :article_id)
  end
end
