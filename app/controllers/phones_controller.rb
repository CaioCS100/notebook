class PhonesController < ApplicationController
  before_action :set_contact, only: [:show, :create, :update, :destroy]

  # GET contacts/1/phones
  def show
    render json: @contact.phones
  end

  # POST contacts/1/phone
  def create
    @contact.phones << Phone.new(phone_params)

    if @contact.save
      render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PUT OR PATCH contacts/1/phone
  def update
    if find_phone(phone_params[:id]).update(phone_params)
      render json: @contact.phones
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE contacts/1/phone
  def destroy
    find_phone(phone_params[:id]).destroy
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def phone_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:id, :number])
  end

  def find_phone(id)
    Phone.find(id)
  end
end
