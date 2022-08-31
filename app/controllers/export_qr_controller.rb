class ExportQrController < ApplicationController
    def export_QR
        puts "entra aca"
        puts url_codeImage
        redirect_to "/generate_qr/createQR/user"
    end

end
