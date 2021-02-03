class Api::CommentsController < ApplicationController
  def create
    comment = Comment.create(commment_params)
    if comment.persisted?
      render json: {message: 'This comment has been posted'},
      status: 200
  end
end
