class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :id_invalid
  before_action :detect_device

  private

  def id_invalid(e)
    render 'shared/record_not_found', status: 404
  end

  def detect_device
    case params[:type]
    when 'mobile'
      request.variant = :mobile
    when 'tablet'
      request.variant = :tablet
    end
  end
end
