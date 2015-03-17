module Admin::ApplicationHelper

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end
end
