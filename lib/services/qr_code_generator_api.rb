require 'http'
require 'json'

class Services::QrCodeGeneratorApi
    BASE_URL = 'http://api.qrserver.com/v1/'
    DEFUALT_SIZE = '100x100'

    def self.create_qr_code(data)
        return if data.blank?
        BASE_URL + 'create-qr-code/?data=' + data + '&size=' + DEFUALT_SIZE
    end

    def self.read_qr_code(file)
        return if file.blank?
        url = BASE_URL + 'read-qr-code/'

        response = HTTP.post(url, :form => {
            file: HTTP::FormData::File.new(file.tempfile.path)
        })

        if response.status == 200
            JSON.parse(response.body)[0]['symbol'][0]['data']
        end
    end
end