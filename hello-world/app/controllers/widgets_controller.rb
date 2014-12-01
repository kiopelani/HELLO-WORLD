class WidgetsController < ApplicationController

  def index
    @user = current_user
    @user_widgets = @user.widgets
  end

  def create
    @user = current_user
    user_has_widget = false
    @user.widgets.each do |widget|
      if widget.name == widget_params[:name]
        user_has_widget = true
        flash[:alert] = "You already have #{widget_params[:name]} widget"
      end
    end

    if user_has_widget
      redirect_to dashboard_path
    else
      @widget = @user.widgets.new(widget_params)
      if @widget.save
        redirect_to dashboard_path
      else
        flash[:alert] = "Your widget could not be saved. Please try again."
      end
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
    redirect_to dashboard_path
  end

  private
    def widget_params
      params.require(:widget).permit(:name)
    end
end
