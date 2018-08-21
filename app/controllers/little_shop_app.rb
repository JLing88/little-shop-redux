class LittleShopApp < Sinatra::Base

  set :method_override, true

  get '/' do
    erb :homepage
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/merchants-dashboard' do
    @merchants = Merchant.all
    erb :"merchants/merchants-dashboard"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  put '/merchants/:id' do
    Merchant.update(params[:id], params[:merchant])
    redirect "/merchants/#{params[:id]}"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  delete '/merchants/:id' do
    Merchant.destroy(params[:id])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :"items/new"
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  put '/items/:id' do
    Item.update(params[:id], params[:item])
    redirect "/items/#{params[:id]}"
  end

  delete '/items/:id' do
    Item.destroy(params[:id])
    redirect '/items'
  end

  get '/items-dashboard' do
    @count = Item.all.count
    @avg_price = Item.average_price
    @newest_item = Item.newest_item
    @oldest_item = Item.oldest_item
    erb :"dashboards/items-dashboard"
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :"invoices/index"
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    erb :"invoices/show"
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :"invoices/edit"
  end

  put '/invoices/:id' do
    Invoice.update(params[:id], params[:invoice])
    redirect "/invoices/#{params[:id]}"
  end

  delete '/invoices/:id' do
    Invoice.destroy(params[:id])
    redirect '/invoices'
  end

  get '/invoices-dashboard' do
    # @invoices = Invoices.all
    @percent_pending = Invoice.status_percent('pending')
    @percent_shipped = Invoice.status_percent('shipped')
    @percent_returned = Invoice.status_percent('returned')

    erb :'dashboards/invoices-dashboard'
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % (number/100)).to_s
    end
  end
end
