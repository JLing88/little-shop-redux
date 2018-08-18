class LittleShopApp < Sinatra::Base
  get '/' do
    erb :homepage
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % number).to_s
    end
  end
end
