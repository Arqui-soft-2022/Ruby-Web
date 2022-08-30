
class GenerateQrController < ApplicationController
  before_action :generateQR
  after_action :createQR

  def createQR
    @id = params[:id]
  end

  def generateQR
    @url = params[:url]
    @id = params[:id]
    if @url.blank?
      @url = "https://github.com/Arqui-soft-2022"
    end
      #url johnny https://codeqr-generate-johnny.herokuapp.com/
      #url api https://codeqr-generate.herokuapp.com
      
    response = HTTParty.post("https://codeqr-generate.herokuapp.com/api/code/",
      body: { 
        url: @url, 
        user: @id,
      }.to_json,
      headers: { "Content-Type" => "application/json" })
      @url_codeImage = response["qr_code"]["url_code"]

      end
end
