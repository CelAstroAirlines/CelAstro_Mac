
module Newebpay
  class Mpg
    attr_accessor :info
   
    def initialize()
      @key = ENV['Newebpay_Hashkey']
      @iv = ENV['Newebpay_HashIV']
      @merchant_id = ENV['Newebpay_MerchantID']
      @info = {} 
      set_info()
    end

    def form_info
      {
        MerchantID: @merchant_id,
        TradeInfo: trade_info,
        TradeSha: trade_sha,
        Version: "1.5"
      }
    end

    def trade_info
      # AES256 加密後的資訊
      aes_encode(url_encoded_query_string)
    end

    def trade_sha
      # SHA256 加密後的資訊
      sha256_encode(@key, @iv, trade_info)
    end

    def set_info()  
      info[:MerchantID] = @merchant_id
      info[:MerchantOrderNo] = "161151805477"
      info[:Amt] ="2500"
      info[:ItemDesc] = "test" 
      info[:Email] = "k_sky369@yahoo.com.tw"
      info[:TimeStamp] = Time.now.to_i 
      info[:RespondType] = "JSON"
      info[:Version] = "1.5"
      info[:ReturnURL] = "http://localhost:3000/orders/receivempg"
      info[:NotifyURL] = "https://ccore.newebpay.com/MPG/mpg_gateway"
      info[:LoginType] = 0 
      info[:CREDIT] =  1
      info[:TradeLimit] = "300"
      
    end

    def url_encoded_query_string
      URI.encode_www_form(@info)
    end

    def aes_encode(string)
      cipher = OpenSSL::Cipher::AES256.new(:CBC)
      cipher.encrypt
      cipher.key = @key
      cipher.iv = @iv
      cipher.padding = 0
      padding_data = add_padding(string)
      encrypted = cipher.update(padding_data) + cipher.final
      encrypted.unpack('H*').first
    end

    def add_padding(data, block_size = 32)
      pad = block_size - (data.length % block_size)
      data + (pad.chr * pad)
    end

    def sha256_encode(key, iv, trade_info)
      encode_string = "HashKey=#{key}&#{trade_info}&HashIV=#{iv}"
      Digest::SHA256.hexdigest(encode_string).upcase
    end
  end
end