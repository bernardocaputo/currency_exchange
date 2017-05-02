require 'rest-client'
require 'json' # é bom colocar para garantir que no enviroment test funcione

module Currency
  def self.exchange currency, currency_destination, quantity
    begin #se esse código não funcionar, vai pro rescue
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}"
      value = JSON.parse(res.body)['rates'][currency_destination]
      return (value * quantity).round(2)
    rescue
      return 'Problem in Conversion'
    end
  end
end