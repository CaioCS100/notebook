class AddressesController < ApplicationController
  before_action :set_contact, only: [:show, :update, :create, :destroy]

  # GET contacts/1/address
  def show
    render json: @contact.address
  end

  # POST /contacts/1/address
  def create
    @contact.address = Address.new(address_params)

    if @contact.save
      render json: @contact.address, status: :created, location: contact_address_url(@contact)
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1/address
  def update
    if @contact.address.update(address_params)
      render json: @contact.address
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1/address
  def destroy
    @contact.address.destroy
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def address_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, only: [:street, :city])
  end
end
