class SessionsController < ApplicationController
  def new
    unless params[:session][:email].blank?
      if params[:pass] == params[:pass2]
        user = User.new(name: params[:name], email: params[:email].downcase, password: params[:pass])
        user.save!
        sign_in user
        render json: {url: url_for(controller: "work", action: "index")}
      end
    end
  end

  def create
    unless params[:session][:email].blank?
      begin
        user = User.find_by!(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          sign_in user
          render json: {url: url_for(controller: "work", action: "index")}
        else
          render json: {error: 'Login failed. Invalid email/password combination. Repeat'}
        end
      rescue ActiveRecord::RecordNotFound
        render json: {error: 'Login failed. Invalid email/password combination. Repeat'}
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
