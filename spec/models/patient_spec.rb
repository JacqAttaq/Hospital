require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject do
    FactoryGirl.create(:patient)
  end

  it "should have full name" do
    expect(subject.first_name).to eq("Alice")
    expect(subject.last_name).to eq("Cooper")
  end

  it "should not have a full name" do
    expect(subject.first_name).not_to eq(nil)
    expect(subject.last_name).not_to eq(nil)
  end

  it "should have complete patient description" do
    expect(subject.d_o_b).to eq("1999-01-02")
    expect(subject.description).to eq("Heart Attack")
    expect(subject.gender).to eq("Female")
    expect(subject.blood_type).to eq("A+")
  end

  it "should start in state of deactivated" do
    expect(subject.current_state).to eq("deactivated")
  end

  it "should be able to transfer to 4 states from waiting" do
    subject.save
    subject.wait!
    expect(subject.current_state.events.keys).to eq([
      :check,
      :xray,
      :surgery,
      :leave
      ])
  end

  it "should be able to transfer to 4 states from checked" do
    subject.save
    subject.wait!
    subject.check!
    expect(subject.current_state.events.keys).to eq([
      :wait,
      :xray,
      :surgery,
      :pay
      ])
  end

  it "should be able to transfer to 4 states from xrayed" do
    subject.save
    subject.wait!
    subject.xray!
    expect(subject.current_state.events.keys).to eq([
      :wait,
      :check,
      :surgery,
      :pay
      ])
  end

  it "should be able to transfer to 4 states from surgery" do
    subject.save
    subject.wait!
    subject.surgery!
    expect(subject.current_state.events.keys).to eq([
      :wait,
      :check,
      :xray,
      :pay
      ])
  end

  it "should be able to transfer to one state from paying" do
    subject.save
    subject.wait!
    subject.surgery!
    subject.pay!
    expect(subject.current_state.events.keys).to eq([
      :leave
      ])
  end
end