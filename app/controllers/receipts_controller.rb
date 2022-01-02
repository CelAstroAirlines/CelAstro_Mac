class ReceiptsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:receivempg]

  def receivempg
    render html:params
  end
end
