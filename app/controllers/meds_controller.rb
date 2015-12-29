class MedsController < ApplicationController
  require 'enumerator'

  def index
    @meds = if !params[:q].blank?
    Med.where("name LIKE ? OR dose LIKE ? OR description LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%", "%#{params[:q]}%")
    else
    Med.all
    end
    @meds = Med.paginate(:page => params[:page], :per_page => 10)
  end

  def new
    @meds = Med.new 
    @patients = Patient.all
  end

  def create
    @meds = Med.create med_params
    @patients = Patient.all
    if @med.save 
      flash[:notice] = 'Medication Record Created'
      redirect_to meds_path
    else 
      flash[:error] = 'No Record Created' 
      render :new
    end
  end

  def edit
    @meds = Med.find params[:id]
  end

  def update
    @med = Med.find params[:id]
    @med.update(med_params)
    if @med.save
      flash[:notice] = 'Medication Record Updated'
      redirect_to meds_path
    else 
      flash[:error] = 'Update Not Saved'
      render :edit
    end
  end

  def destroy
    @med = Med.find params[:id]
    @med.destroy
    redirect_to meds_path
  end

private 
  def med_params
    params.require(:med).permit(
  :name,
  :dose,
  :description,
  patient_ids: []
  )
  end

end