class CustomFieldsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_field, only: [:show, :edit, :update]

  def index
    @custom_fields = current_user.custom_fields
  end

  def new
    @custom_field = CustomField.new(user: current_user)
  end

  def create
    p field_params
    @custom_field = CustomField.new(field_params)
    @custom_field.user = current_user
    if @custom_field.save
      flash[:notice] = "Campo cadastrado com sucesso"
      redirect_to custom_fields_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @custom_field.update(field_params)
      redirect_to custom_fields_path, notice: "Campo atualizado com sucesso"
    else
      render :edit
    end
  end

  private

  def set_field
    @custom_field = current_user.custom_fields.find(params[:id])
  end

  def field_params
    new_params = params.require(:custom_field).permit(:user_id, :kind, :name, :choices => [])
    new_params[:choices] = new_params[:choices].join(",")
    new_params
  end
end
