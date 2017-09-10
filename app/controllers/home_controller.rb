class HomeController < BaseController
  def index
  end

  def git_create
    p params[:github_id]
    redirect_to root_path
  end
end
