require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject do
    FactoryGirl.create(:facility)
  end


  it "should have a name" do
    facility = Facility.new
    facility.name = "MUSC"
    expect(facility.name).to eq("MUSC") 
  end

  it "should not have a name" do 
    facility = Facility.new
    expect(facility.name).not_to eq("MUSC")
  end
  
  it "should have an address" do
    expect(subject.address).to eq("Charleston")
    expect(subject.zip).to eq("29400")
  end

  it "should have an address" do
    expect(subject.address).not_to eq(nil)
    expect(subject.zip).not_to eq(nil)
  end
end