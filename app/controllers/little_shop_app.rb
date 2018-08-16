class LittleShopApp < Sinatra::Base
  get '/' do
    erb :homepage
  end
end
