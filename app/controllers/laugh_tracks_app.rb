class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    @comedians = Comedian.all
    @specials = Special.all
    erb :comedians
  end

  get '/comedians' do
    @comedians = Comedian.find_by(params[:age])
    erb :comedians
  end

end
