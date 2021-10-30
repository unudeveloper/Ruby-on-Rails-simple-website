class SessionsController < ApplicationController

  def new
    
  end

  def create
    if user = login(params[:email], params[:password])
      flash[:notice] = "LogedIn"
      redirect_to root_path
    else
      flash[:notice] = "Failed"
      redirect_to new_session_path
    end
  end

  def destroy
    logout
    flash[:notice] = "LogedOut"
    redirect_to root_path
  end

end