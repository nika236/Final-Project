class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[ show edit update destroy ]
  before_action :require_admin, only: [:new, :create, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to new_subject_lecturer_path(@subject)}
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subject_url(@subject)}
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subject.destroy!
    respond_to do |format|
      format.html { redirect_to subjects_url, notice:}
      format.json { head :no_content }
    end
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    def subject_params
      params.require(:subject).permit(:name, :description, :lecturer_id)
    end
end
