class WidgetsController < ApplicationController

  def index
    @user = current_user
    @user_widgets = @user.widgets
  end

  def create
    @user = current_user
    @widget = @user.widgets.new(widget_params)
    if @widget.save
      redirect_to dashboard_path
    else
      @message = params
    end
  end

  def update
    @user = current_user
    @widget = Widget.find(params[:id])
    if @answer.update_attributes(widget_params)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    @user = current_user
    @widget = Widget.find(params[:id])
    @widget.destroy
    redirect_to root_path
  end

  private
    def widget_params
      params.require(:widget).permit(:name)
    end
end
