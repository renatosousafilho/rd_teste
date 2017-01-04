class CustomFieldsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @custom_fields = current_user.custom_fields
  end

  def new
    @custom_field = CustomField.new(user: current_user)
  end

  def create
    @custom_field = CustomField.new(custom_field_params)
    @custom_field.user = current_user
    if @custom_field.save
      flash[:notice] = "Campo cadastrado com sucesso"
      redirect_to custom_fields_path
    else
      render :new
    end
  end

  private 

  def custom_field_params
    params.require(:custom_field).permit(:user_id, :kind, :name)
  end
end
