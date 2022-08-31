class ListarQrController < ApplicationController

    def home
        @id= cookies[:id] 
        @response = HTTParty.post("https://codeqr-generate2.herokuapp.com/api/code/historial/",
            body: { 
              user: @id,
            }.to_json,
            headers: { "Content-Type" => "application/json" })
        @response["codes"].to_json
        render "listar_qr/listarQR"
    end

    def navbar
    end
end
