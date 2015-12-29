class PatientsController < ApplicationController
 require 'enumerator'
  
  before_action :set_patient, only: [
    :show,
    :edit,
    :update,
    :destroy,
    :wait_patient,
    :check_patient,
    :xray_patient,
    :surgery_patient,
    :pay_patient,
    :leave_patient,
    :deactivate_patient,
  ]
  def index
    if params[:facility_id]
    @facility = Facility.find params[:facility_id]
    @patients = @facility.patients
  elsif !params[:q].blank?
    @patients = Patient.where("first_name LIKE ? OR last_name LIKE ? OR d_o_b LIKE ? OR description LIKE ? OR gender LIKE ? OR blood_type LIKE ?", "%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%")
    @searchentry = "Search results for: #{params[:q]}"
    else
    Patient.all 
    end
  @patients = Patient.paginate(:page => params[:page], :per_page => 10)
  end

  def search_results
    Patient.where("first_name LIKE ? OR last_name LIKE ? OR d_o_b LIKE ? OR description LIKE ? OR gender LIKE ? OR blood_type LIKE ?", "%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%","%#{params[:q]}%")
    p @patients
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @facility = Facility.find params[:facility_id]
    @patient = @facility.patients.new
    @meds = Med.all
  end

  def create 
    @facility = Facility.find params[:facility_id]
    @patient = @facility.patients.create pat_params
    @meds = Med.all
    if @patient.save
      flash[:notice] = 'Patient Record Created'
      redirect_to facility_patients_path
    else
      flash[:error] = 'No Record Created'
      render :new
    end
  end

  def edit
    @patients = Patient.find params[:id]
    @facility = Facility.find params[:facility_id]
    @meds = Med.all
  end

  def update
    @patient.update_attributes pat_params 
    if @patient.save  
      flash[:notice] = 'Patient Record Update'
    else
      flash[:error] = 'Update Incomplete'
    end
  redirect_to facility_patients_path 
  end

  def show
    @patients = Patient.all
    @facility = Facility.find params[:facility_id]
    @patient = Patient.find params[:id]
    @meds = @patient.meds
    @doctor = Doctor.new
    @doctors = @patient.doctors
  end

  def create_doctor
    @patient = Patient.find params[:id]
    @doctor = @patient.doctors.create doctor_params
    redirect_to facility_patients_path(@facility)
  end

  def destroy
    @facility = Facility.find params[:facility_id]
    @patient = Patient.find params[:id]
    @patient.destroy
    redirect_to facility_patients_path(@facility)
  end

  def deactivated_patient 
    @facility = Facility.find params[:facility_id]
    set_patient
    @patient.deactivate!
    respond_to do |format|
      format.js
    end   
  end 

  def wait_patient
    @facility = Facility.find params[:facility_id]
    set_patient
    @patient.wait!
    redirect_to facility_patients_path
    
  end

  def check_patient
    @facility = Facility.find params[:facility_id]    
    set_patient
    @patient.check!
    redirect_to facility_patients_path
  end

  def xray_patient
    set_patient
    @patient.xray!
    redirect_to facility_patients_path
  end

  def surgery_patient
    set_patient
    @patient.surgery!
    redirect_to facility_patients_path
  end

  def pay_patient
    set_patient
    @patient.pay!
    redirect_to facility_patients_path
  end

  def leave_patient
    set_patient
    @patient.leave!
    redirect_to facility_patients_path
  end

private

  def set_patient
    @patient = Patient.find params[:id]
  end
  
  def doctor_params
    params.require(:doctor).permit(
      :name,
      :specialty
      )
  end

  def find_patient
    @patient = Patient.find params[:id]
  end 

  def pat_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :d_o_b,
      :description,
      :gender,
      :blood_type, 
      med_ids: [],
      patient_ids: []
      )
  end
end