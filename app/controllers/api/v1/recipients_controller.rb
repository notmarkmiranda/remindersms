class Api::V1::RecipientsController < Api::ApiController
  before_action :authenticate_api_request!
  before_action :set_recipient, except: [:index, :create]

  def index
    render json: current_user.recipients
  end

  def show
    render json: @recipient
  end

  def create
    recipient = current_user.recipients.new(recipient_params)
    if recipient.save
      render json: recipient
    else
      render json: {errors: recipient.errors.full_messages}
    end
  end

  def update
    if @recipient.update(recipient_params)
      render json: @recipient
    else
      render json: {errors: recipient.errors.full_messages}
    end
  end

  def destroy
    @recipient.destroy
    head :no_content
  end

  private

  def set_recipient
    @recipient = current_user.recipients.find(params[:id])
  end

  def recipient_params
    params.require(:recipient).permit(:first_name, :last_name, :phone_number)
  end
end
