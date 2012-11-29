require 'sinatra'
require "sinatra/reloader"
require 'pusher'

configure do
  set :public_folder, Proc.new { File.join(root, "public") }
  Pusher.app_id = ENV['APP_ID']
  Pusher.key = ENV['KEY']
  Pusher.secret = ENV['SECRET']
  PUSHER_CHANNEL = 'board'
  PUSHER_PRESENCE_CHANNEL = 'presence-board'
end

get '/' do
  erb :home
end

post '/say' do
  quote = params[:quote]
  begin
    Pusher.trigger(PUSHER_CHANNEL, 'quote', {:quote => quote})
  rescue Pusher::Error => e
    # (Pusher::AuthenticationError, Pusher::HTTPError, or Pusher::Error)
  end
end

post '/pusher/auth' do
  if true # replace w/current_user
    response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
      :user_id => rand, # => required
      :user_info => {}
    })
    response.to_json
  else
    status 403
  end
end