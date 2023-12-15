class LecturersController < ApplicationController
  before_action :set_lecturer, only: %i[ show edit update destroy ]
  before_action :set_subject, only: [:new, :create]
  before_action :require_admin, only: [:new, :create, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
  end

  def new
    @lecturer = Lecturer.new
  end

  def edit
  end

  def create
    @lecturer = @subject.lecturers.build(lecturer_params)

    respond_to do |format|
      if @lecturer.save
        format.html { redirect_to subjects_url}
        format.json { render :show, status: :created, location: @lecturer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @lecturer.update(lecturer_params)
        format.html { redirect_to lecturer_url(@lecturer), notice: "Lecturer was successfully updated." }
        format.json { render :show, status: :ok, location: @lecturer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lecturer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @lecturer.destroy!

    respond_to do |format|
      format.html { redirect_to lecturers_url, notice: "Lecturer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_lecturer
    @lecturer = Lecturer.find(params[:id])
  end

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def lecturer_params
    params.require(:lecturer).permit(:name, :start_date, :end_date)
  end
end
