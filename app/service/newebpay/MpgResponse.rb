module Newebpay
  class MpgResponse
    attr_reader :status, :message, :result, :order_no, :trans_no, :amt

    def initialize(params)
      @key = ENV["Newebpay_Hashkey"]
      @iv = ENV["Newebpay_HashIV"]
      response = decrypt(params)
      @status = response['Status']
      @message = response['Message']
      @result = response['Result']
      @order_no = @result["MerchantOrderNo"]
      @trans_no = @result["TradeNo"]  
      @amt = response['Amt']
    end

    def success?
      status === 'SUCCESS'
    end

    private
    # AES 解密
    def decrypt(encrypted_data)
      encrypted_data = [encrypted_data].pack('H*')
      decipher = OpenSSL::Cipher::AES256.new(:CBC)
      decipher.decrypt
      decipher.padding = 0
      decipher.key = @key
      decipher.iv = @iv
      data = decipher.update(encrypted_data) + decipher.final
      raw_data = strippadding(data)
      JSON.parse(raw_data)
    end

    def strippadding(data)
      last_word = data[-1].ord
      slastc = last_word.chr
      string_match = /#{slastc}{#{last_word}}/ =~ data
      if string_match.present?
        data[0, string_match]
      else
        false
      end
    end
  end
end