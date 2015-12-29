class HomeController < ApplicationController
  def index
    @facilities = Facility.all
    @patients = Patient.all
    @meds = Med.all
  end
end
