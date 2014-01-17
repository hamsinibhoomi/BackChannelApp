class LoginController < ApplicationController
  def index
    if session[:username]
      if session[:admin]
        redirect_to categories_path
      else
        redirect_to posts_path
      end
    end
    @login_fail = 0
    if user = User.authenticate(params[:id],params[:password])
      session[:nameuser] = user.name
      session[:username] = params[:id]
      session[:id1]=user.id
      session[:admin] = user.admin

      if user.admin == false
      redirect_to :controller => 'posts', :action => 'index'
      else
      redirect_to :controller => 'categories', :action => 'index'
      end
    end

  else
    @login_fail = 1


  end

  def logout
    session[:username] = nil
    session[:admin] = nil
    session[:id1] = nil
    session[:nameuser] = nil
    flash[:success] = "You are logged out"
    redirect_to :controller => 'login', :action => 'index'
  end
end
