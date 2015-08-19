require 'bundler'
Bundler.require

  # set folder for templates to ../views, but make the path absolute
  set :views, File.expand_path('../views', __FILE__)
  set :public, File.expand_path('../public', __FILE__)

## postgres adapter
ActiveRecord::Base.establish_connection(
	:adapter => 'postgresql',
	:database => 'restfulphish'
	)

get '/' do
	erb :index
end

get '/api/songs' do
	Song.all.to_json
end

get '/api/songs/:id' do
	Song.find(params[:id]).to_json
end

post '/api/songs' do
	song_params = { :name => params[:name], :album => params[:album], :track_length => params[:track_length], :release_date => params[:release_date], :album_cover => params[:album_cover] }
	Song.create(song_params).to_json		
end

patch '/api/songs/:id' do
	safe_params = ['name', 'album', 'track_length', 'release_date', 'album_cover']
	song_params = {}
	params.keys.each do |param|
		if safe_params.include?(param)
			song_params.merge!(param => params[param])
		end
	end
	puts '-----song_params-----'
	puts song_params
	puts '---------------------'
	Song.find(params[:id]).update(song_params).to_json
end

put '/api/songs/:id' do
	safe_params = ['name', 'album', 'track_length', 'release_date', 'album_cover']
	song_params = {}
	params.keys.each do |param|
		if safe_params.include?(param)
			song_params.merge!(param => params[param])
		end
	end
	puts '-----song_params-----'
	puts song_params
	puts '---------------------'
	Song.find(params[:id]).update(song_params).to_json
end

delete '/api/songs/:id' do
	Song.find(params[:id]).destroy.to_json
end