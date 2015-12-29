require 'rails_helper'

describe MedsController do
  let(:med) {
  FactoryGirl.create(:med)  
  }

  describe 'GET #index' do
    let!(:med1) {
      Med.create({name:"loracet", dose:"20 mg", description:"Painkiller"})
    }
    let!(:med2) {
      Med.create({name:"Valium", dose:"20 mg", description:"Painkiller"})
    } 
    let!(:med3) {
      Med.create({name:"Aderol", dose:"20 mg", description:"ADHD"})
    }
    it 'should not return any meds' do
      get :index, q: 'asdf', id: med
      expect(assigns(:meds)).not_to eq(nil)
      # expect(assigns(:meds)).to eq([])
    end

    it 'should return all meds' do
      get :index, q: "mg"
      expect(assigns(:meds)).not_to eq(nil)
      expect(assigns(:meds).length).to eq(3)
      expect(assigns(:meds)).to include(med1)
      expect(assigns(:meds)).to include(med2)
      expect(assigns(:meds)).to include(med3)
    end
  end

  describe 'GET #new' do
    it 'should initialize a new med' do
      get :new
      expect(assigns(:meds).class).to eq Med
      expect(assigns(:meds).new_record?).to eq(true)
    end

    it 'should have relation to all patients' do
      get :new 
      expect(assigns(:patients)).not_to eq(nil)
      expect(assigns(:patients)).to eq([])
    end
  end
end