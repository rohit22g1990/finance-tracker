class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    # client = IEX::Api::Client.new(publishable_token: 'Tpk_9d7f945f4edd48e3a87e69cdce4dc309',
    client = IEX::Api::Client.new(publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key] ,
                                  endpoint: 'https://sandbox.iexapis.com/v1')
    
    client.price(ticker_symbol)
  end

end
