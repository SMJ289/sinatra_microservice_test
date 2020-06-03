require 'sinatra'
require 'faraday'
require 'json'
require 'pry'
require './lib/video_serializer.rb'
require './lib/video.rb'
require './lib/youtube_service.rb'


before do
  content_type 'application/json'
end

get '/sad' do
  playlist_items = YouTubeService.get_playlist_items('PL2gVg27Uw-kfUnyNb_OHdvjBvv4tJRjPw')[:items]

  videos = playlist_items.map do |video_data|
    Video.new(video_data)
  end

  videos.to_json
end

get '/happy' do
  playlist_items = YouTubeService.get_playlist_items('PL2gVg27Uw-kcsCzSgn8Hufs4QKWdARfuv')[:items]

  videos = playlist_items.map do |video_data|
    Video.new(video_data)
  end
  
  videos.to_json
end

get '/neutral' do
  playlist_items = YouTubeService.get_playlist_items('PL2gVg27Uw-kcv9hsbiRXBQQGKg0h3k0kv')[:items]

  videos = playlist_items.map do |video_data|
    Video.new(video_data)
  end
  
  videos.to_json
end
