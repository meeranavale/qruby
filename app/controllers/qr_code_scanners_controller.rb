class QrCodeScannersController < ApplicationController
  def create_qr
  end

  def create_qr_code
    @qr_url = Services::QrCodeGeneratorApi.create_qr_code(params[:data])
  end

  def read_qr
  end

  def read_qr_code
    @file = params[:file]
    if params[:file].present?
      upload_img
      @code = Services::QrCodeGeneratorApi.read_qr_code(params[:file])
    end
  end

  private

  def upload_img
    dir = Rails.root.join('public', 'uploads')
    Dir.mkdir(dir) unless Dir.exist?(dir)
    File.open(dir.join(params[:file].original_filename), 'wb') do |file|
      file.write(params[:file].read)
    end
  end
end
