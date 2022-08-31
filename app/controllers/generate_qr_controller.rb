
class GenerateQrController < ApplicationController
  before_action :generateQR
  after_action :createQR

  def createQR
    @id= cookies[:id] 
  end

  def generateQR
    @url = params[:url]
    @id= cookies[:id] 
    if @url.blank?
      @url = "https://thumbs.dreamstime.com/b/icono-de-ejemplo-c%C3%B3digo-qr-con-texto-hola-156385931.jpg"
      @url_codeImage = "https://thumbs.dreamstime.com/b/icono-de-ejemplo-c%C3%B3digo-qr-con-texto-hola-156385931.jpg"
    else
      response = HTTParty.post("https://codeqr-generate2.herokuapp.com/api/code/",
        body: {
          url: @url, 
          user: @id,
        }.to_json,
        headers: { "Content-Type" => "application/json" })
        @url_codeImage = response["qr_code"]["url_code"]
        cookies[:url_codeGenerate] = @url_codeImage
    end
  end
  
end
