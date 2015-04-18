class Admin::PagesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:success] = "You have successfully created a Page!"
      redirect_to admin_page_path(@page)
    else
      flash[:error] = "Please review required fields."
      render :new
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:success] = "Successfully updated Page."
      redirect_to admin_page_path(@page)
    else
      render :edit
    end
  end

  def index
    @pages = Page.all.order("created_at DESC")
  end

  def show
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to root_path
  end

  private

  def require_admin
    if !current_user.admin?
      flash[:error] = "You do not have access."
      redirect_to root_path
    end
  end

  def page_params
    params.require(:page).permit(:title, :body)
  end
end
