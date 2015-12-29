require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject do
    FactoryGirl.create(:doctor)
  end

  it 'should have a name' do
    expect(subject.name).to eq("Dr. Danny Castellano")
    expect(subject.name).not_to eq(nil)
  end

  it 'should not have a name' do
    expect(subject.name).not_to eq(nil)
    expect(subject.name).not_to eq("Dr. Mindy Lahiri")
  end

  it 'should have a specialty' do
    expect(subject.specialty).not_to eq(nil)
    expect(subject.specialty).to eq("Ob/gyn")
  end

  it 'should not have a specialty' do
    expect(subject.specialty).not_to eq(nil)
    expect(subject.specialty).not_to eq("Rhinoplasty")
  end
end