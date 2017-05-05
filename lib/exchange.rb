require 'rest-client'
require 'json' # é bom colocar para garantir que no enviroment test funcione

module Currency
  def self.exchange currency, currency_destination, quantity
    begin #se esse código abaixo não funcionar, pula pro rescue sem quebrar pro usuário
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}" # gem rest client responsável por chamar a API externa.
      value = JSON.parse(res.body)['rates'][currency_destination] # pega no res.body o value correspondente a key 'rates' : taxa da currency_destination
      return (value * quantity).round(2)
    rescue
      return 'Problem in Conversion'
    end
  end
end
