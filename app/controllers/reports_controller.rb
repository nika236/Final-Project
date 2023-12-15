class ReportsController < ApplicationController
  before_action :require_admin, only: [:booking_report]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  def booking_report
    if current_user.admin?
      @filters = [:start_date, :end_date, :lecturer_id]
      @bookings = filter(Booking.all)
    else
      @filters = [:start_date, :end_date]
      @bookings = Booking.all.where(user_id: current_user.id)
      @bookings = filter(@bookings)
    end
  end

  private

  def took_param(param)
    @filters.include?(param) && params[param].present?
  end

  def filter(bookings)
    if took_param(:lecturer_id)
      bookings = bookings.where(lecturer_id: params[:lecturer_id])
    end
    bookings
  end
end