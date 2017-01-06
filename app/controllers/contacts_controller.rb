class ContactsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @contacts = current_user.contacts.paginate(page: params[:page], per_page: 10)
  end

  def new
    @contact = current_user.contacts.build
    @fields = current_user.custom_fields
    @fields.each do |field|
      @contact.contact_fields.build custom_field: field
    end
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: 'Contato cadastrado com sucesso'
    else
      render :new
    end
  end

  def show
    begin
      @contact = current_user.contacts.find(params[:id])
    rescue
      redirect_to root_path, notice: "Você não tem acesso a este contato"
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :email, contact_fields_attributes: [:custom_field_id, :value, :contact_id])
  end
end
