class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]
  def payment
    @form_info = Newebpay::Mpg.new.form_info
  end

  def receivempg
    # render html:params
    # render 'pages/index', notice: "付款完成!!"
      @response = Newebpay::MpgResponse.new(params[:TradeInfo])
      if @response.status === "SUCCESS"
        flash.now[:notice] = "付款成功！"
      else
    end
  end
end
