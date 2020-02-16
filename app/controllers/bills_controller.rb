class BillsController < Sinatra::Base
  helpers Numbers

  get '/' do
    @bills = Bill.all
    erb :index
  end

  post '/api/bills/create' do
    Bill
      .new(params[:form])
      .save!

    redirect '/'
  end

  post '/api/bills/:id/delete' do
    Bill
      .find(params[:id])
      .destroy!

    redirect '/'
  end
end
