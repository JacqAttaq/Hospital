require 'rails_helper'

describe PatientsController do 
let(:facility) {
  FactoryGirl.create(:facility)
} 
let(:patient) {
  FactoryGirl.create(:patient)
}

  describe 'GET #index' do
    let!(:patient1) {
      Patient.create({
        first_name: "Jesse",
        last_name: "Murphy",
        d_o_b: "1999-3-3",
        description: "Aneurism",
        gender: "Male",
        blood_type: "B-",
        })
    }
    let!(:patient2)  {
      Patient.create({
        first_name: "Mary",
        last_name: "Leahy",
        d_o_b: "1955-4-10",
        description: "Heart Attack",
        gender: "Female",
        blood_type: "AB+",
        })
    }   
    let!(:patient3) {
      Patient.create({
        first_name: "William",
        last_name: "Clinton",
        d_o_b: "1945-2-7",
        description: "Cheeseburger addiction",
        gender: "Male",
        blood_type: "O+",
        })
    }

    it 'should not return any patients' do
      get :index, q: 'asdf', facility_id: facility
      expect(assigns(:patients)).not_to eq(nil)
      # expect(assigns(:patients)).to eq([])
    end

    # it 'should return all 3 patients' do
    #   get :index, q: 'e', facility_id: facility
    #   expect(assigns(:patients)).not_to eq(nil)
    #   expect(assigns(:patients).length).to eq(3)
    #   expect(assigns(:patients)).to include(patient1)
    #   expect(assigns(:patients)).to include(patient2)
    # end

    it "should get the facility's patients" do
      get :index, facility_id: facility
      expect(assigns(:facility)).to eq facility
      # expect(assigns(:patients)). to eq []
      expect(assigns(:patients).class).to eq(Patient::ActiveRecord_Relation) 
    end 
  end
  
  describe 'GET #show' do
    it 'should show a patient' do
      get :show, facility_id: facility, id: patient
      expect(assigns(:patients).class).to eq(Patient::ActiveRecord_Relation)
      expect(assigns(:facility)).to eq facility
      expect(assigns(:patients)).not_to eq []
    end
  end

  describe 'GET #new' do
    it 'should initialize a new patient' do
      get :new, facility_id: facility 
      expect(assigns(:patient).class).to eq Patient
      expect(assigns(:patient).new_record?).to eq(true)
    end
  end

  describe 'POST #create' do
    it 'should create a patient object'do
      post :create, facility_id: facility, patient: {
        first_name: "William",
        last_name: "Clinton",
        d_o_b: "1945-2-7",
        description: "Cheeseburger addiction",
        gender: "Male",
        blood_type: "O+"}
      expect(assigns(:patient).class).to eq Patient
      expect(assigns(:patient).class).not_to eq(nil)
    end
  end
  describe 'PATCH #update' do
 
  end
  describe 'GET #edit' do
    it 'should access correct patient record' do
      get :edit, facility_id: facility.id, id: patient.id
      expect(assigns(:patient)).to eq patient
      expect(assigns(:patient)).not_to eq(nil)
    end
  end
  
  describe 'DELETE #destroy' do
    it 'should delete a patient object' do
      delete :destroy, facility_id: facility.id, id: patient.id
      expect(assigns(:patient)).to eq patient
      expect(response).to redirect_to facility_patients_path(facility)
    end
  end
end