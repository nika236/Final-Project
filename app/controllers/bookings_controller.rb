class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :set_lecturer, only: [:new, :create]
  before_action :not_require_admin, only: [:new, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = @lecturer.bookings.build(booking_params)
    @booking.user = current_user
    respond_to do |format|
      if @booking.save
        flash[:notice] = "Booking Created Successfully"
        format.html { redirect_to booking_url(@booking)}
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy!

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_lecturer
    @lecturer = Lecturer.find(params[:lecturer_id])
  end
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:user_id, :start_date, :end_date, :lecturer_id)
    end
end
