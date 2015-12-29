class FacilitiesController < ApplicationController
  require 'enumerator'
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  def index
    @facilities = if !params[:q].blank?
    Facility.where("name LIKE ? OR address LIKE ? OR zip LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
    Facility.all
    end
    @facilities = Facility.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create fac_params
    if @facility.save
      flash[:notice] = 'Facility Created'
      redirect_to facilities_path
    else 
      flash[:error] = 'No Record Created' 
      render :new
    end 
  end

  def create_doctor
    @facility = Facility.find params[:id]
    @doctor = @facility.doctors.create doctor_params
    if @doctor.save
      flash[:notice] = 'Doctor Record Created'
      redirect_to facility_path(@facility)
    else
      flash[:error] = 'No Record Created'
      redirect_to facilities_path
    end
  end
  
  def edit
  end

  def update
    @facility.update(fac_params)
    if @facility.save
      flash[:notice] = 'Facility Updated'
      redirect_to @facility
    else
      flash[:error] = 'Updates not saved'
      render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to facilities_path
  end

  def show
    @facility = Facility.find params[:id]
    @patients = @facility.patients
    @doctor = Doctor.new
    @doctors = @facility.doctors
  end


  private

  def doctor_params
    params.require(:doctor).permit(
      :name,
      :specialty
    )
  end
  
  def set_facility
    @facility = Facility.find(params[:id])
  end
  
  def fac_params 
    params.require(:facility).permit(
      :name,
      :address,
      :zip,
      :specialty
    )
  end

end

