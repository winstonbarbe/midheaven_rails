class Api::UsersController < ApplicationController
  def index
    render json: { message: "working route" }
  end
end
