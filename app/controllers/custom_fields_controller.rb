class CustomFieldsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @custom_fields = current_user.custom_fields.paginate(page: params[:page], per_page: 10)
  end

  def new
    @custom_field = current_user.custom_fields.build
  end

  def create
    @custom_field = current_user.custom_fields.build(field_params)
    if @custom_field.save
      redirect_to custom_fields_path, notice: "Campo cadastrado com sucesso"
    else
      flash[:notice] = "There's something wrong!"
      render :new
    end
  end
  private

  # TODO: set in before action parse to string if choices was a array
  def field_params
    new_params = params.require(:custom_field).permit(:user_id, :kind, :name, :choices => [])
    new_params[:choices] = new_params[:choices].join(",") if new_params[:choices].present?
    new_params
  end
end
