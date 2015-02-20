require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'sinatra/activerecord'
require 'pg'
require './models/artist'
require './models/songs'


require 'better_errors'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

get '/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all
  erb :'artists/index'
end

get '/artists/new' do
  erb :'artists/add'
end

post '/artists' do
  Artist.create params
  redirect '/artists'
end

get '/artists/:id' do
  @artist = Artist.find params[:id].to_i
  erb :'artists/show'
end

get '/artists/:id/edit' do
  @artist = Artist.find params[:id].to_i
  erb :'artists/edit'
end

put '/artists/:id' do
  artist = Artist.find params[:id].to_i
  artist.name = params[:name]
  artist.save
  redirect '/artists'
end

delete '/artists/:id' do
  Artist.find(params[:id].to_i).destroy
  redirect '/artists'
end

#=== Songs ===#
get '/artists/:artist_id/songs' do
  @songs = Songs.where(:artist_id => params[:artist_id])
  @artist_id = params[:artist_id].to_i
  erb :'songs/index'
end

get '/artists/:artist_id/songs/new' do
  @artist_id = params[:artist_id].to_i
  erb :'songs/add'
end

post '/artist/:artist_id/songs' do
  Songs.create({:name => params[:name], :artist_id => params[:artist_id]})
  # Songs.create params
  redirect '/artists'
end

get '/artists/:artist_id/songs/:song_id' do
  @song = Songs.find params[:song_id]
  @artist_id = params[:artist_id].to_i
  erb :'songs/show'
end

get '/artists/:artist_id/songs/:song_id/edit' do
  p params
  @song = Songs.find params[:song_id]
  @artist_id = params[:artist_id].to_i
  erb :'songs/edit'
end

put '/artists/:artist_id/songs/:song_id' do
  song = Songs.find params[:song_id]
  p song
  song.name = params[:name]
  song.save
  # redirect '/artists/params[:artist_id]/songs'
  redirect '/artists'
end

