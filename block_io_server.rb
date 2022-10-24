require 'sinatra'

get '/' do
  sleep 10
  "OK"
end