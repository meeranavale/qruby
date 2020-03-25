require 'rails_helper'

RSpec.describe Services::QrCodeGeneratorApi do
    describe 'self.create_qr_code' do
        it 'should return qr_url to create_qr_code API' do
          expect(described_class.create_qr_code('test')).to eq('http://api.qrserver.com/v1/create-qr-code/?data=test&size=100x100')
        end

        context 'when parameter is nil' do
            it 'should return nil' do
                expect(described_class.create_qr_code(nil)).to be_nil
            end
        end

        context 'when parameter is blank' do
            it 'should return nil' do
                expect(described_class.create_qr_code('')).to be_nil
            end
        end
    end

    describe 'self.read_qr_code' do
        let(:file) { double(tempfile: double(path: '')) }
        before do
            allow(HTTP::FormData::File).to receive(:new)
        end

        it 'should return qr code to associated with image' do
          expect(described_class.read_qr_code(file)).to eq('Content of the read QR code')
        end

        context 'when parameter is nil' do
            it 'should return nil' do
                expect(described_class.read_qr_code(nil)).to be_nil
            end
        end

        context 'when parameter is blank' do
            it 'should return nil' do
                expect(described_class.read_qr_code('')).to be_nil
            end
        end
    end
end
