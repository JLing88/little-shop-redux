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

    # ____________________________INVOICES______________________________
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
    Invoice.update(id.to_i, params[:invoices])
    redirect "/invoices/#{id}"
  end
end
