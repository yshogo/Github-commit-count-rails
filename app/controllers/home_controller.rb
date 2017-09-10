class HomeController < BaseController
  def index
  end

  def git_create
    User.save_github_account(params[:github_id], session[:user_id])
    redirect_to root_path
  end
end
