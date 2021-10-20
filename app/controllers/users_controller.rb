class UsersController < ApplicationController
  def index
    users = User.all
    render json: users.as_json
  end
  def create
    user = User.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"]
    )
    if user.save
      render json: user.as_json
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end
  def update
    user = User.find(params["id"])
    user.first_name = params["first_name"] || user.first_name
    user.last_name = params["last_name"] || user.last_name
    user.email = params["email"] || user.email

    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}, status: 422
    end
  end
  def show
    users = User.find(params["id"])
    render json: users.as_json
  end
  def destroy
    User.destroy_by(id: params["id"])
    render json: {message: "hakai"}
  end
end
