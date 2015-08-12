class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def find_object model, id
    begin
      model.find id
    rescue ActiveRecord::RecordNotFound
      flash[:danger] = "Can not find this object!"
      redirect_to root_path
    end
  end

end
