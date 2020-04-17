class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  skip_before_action :ensure_admin_logged_in
  skip_before_action :ensure_order_created

  def new
    render "users/new"
  end

  def create
    user = User.create!(
      first_name: params[:first_name].capitalize,
      last_name: params[:last_name].capitalize,
      email: params[:email],
      password: params[:password],
      role: "customer",
    )
    session[:current_user_id] = user.id
    redirect_to "/"
  end
end
