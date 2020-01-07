class PhonesController < ApplicationController
  before_action :set_contact, only: [:show]

  # GET contacts/1/phones
  def show
    render json: @contact.phones
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end
end
