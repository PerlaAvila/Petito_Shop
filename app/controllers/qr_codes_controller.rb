
class QrCodesController < ApplicationController
  def new
  end

  def create
    random = Array.new(7){[*"A".."Z", *"a".."z", *"0".."9"].sample}.join
    @qr = RQRCode::QRCode.new( qr_code_params[:text], size: 5, :level => :h)
    png = @qr.to_img                                             # returns an instance of ChunkyPNG
    png.resize(90, 90).save("#{random}.png")

  end

private
  def qr_code_params
    params.require(:qr_code).permit(:text)
  end
end