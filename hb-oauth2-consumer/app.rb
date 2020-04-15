require 'sinatra'
require 'oauth2'
require 'json'
enable :sessions

def client
  OAuth2::Client.new("1kmW8Ab4rn7YPyvJGOR64j1LlRIGy2Xn5mfdN6hl", "5zETo6K42N83OTIkFHAHqSaOeFFQTgVkxgdiD2fl", :site => "http://localhost:3000")
end

get "/auth/test" do
  redirect client.auth_code.authorize_url(:redirect_uri => redirect_uri)
end

get '/auth/test/callback' do
  access_token = client.auth_code.get_token(params[:code], :redirect_uri => redirect_uri)
  session[:access_token] = access_token.token
  @message = "Successfully authenticated with the server"
  erb :success
end

get '/page_2' do
  @message = get_response('data.json')
  erb :success
end
get '/page_1' do
  @message = get_response('data.json')
  erb :page1
end

def get_response(url)
  access_token = OAuth2::AccessToken.new(client, session[:access_token])
  p access_token
  JSON.parse(access_token.get("/api/v1/#{url}").body)
end

def redirect_uri
  uri = URI.parse(request.url)
  uri.path = '/auth/test/callback'
  uri.query = nil
  uri.to_s
end
