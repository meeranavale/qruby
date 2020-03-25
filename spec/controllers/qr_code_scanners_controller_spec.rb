require 'rails_helper'

RSpec.describe QrCodeScannersController, :type => :controller do
  describe 'GET create_qr' do
    it 'returns a 200' do
      get :create_qr
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST create_qr_code' do
    subject { post :create_qr_code, 'data' => 'test' }

    it 'returns a 200' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should set qr_url to create_qr_code API' do
      subject
      expect(assigns(:qr_url)).to eq('http://api.qrserver.com/v1/create-qr-code/?data=test&size=100x100')
    end
  end

  describe 'GET read_qr' do
    it 'returns a 200' do
      get :read_qr
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST read_qr_code' do
    let(:file) { fixture_file_upload("test.png", 'image/png') }
    subject { post :read_qr_code, 'file' => file }

    it 'returns a 200' do
      subject
      expect(response).to have_http_status(:ok)
    end
  end
end

 