require 'sinatra'
require 'JSON'

# Using Sinatra modular style...

class ResolverApp < Sinatra::Base

  set :root, File.dirname(__FILE__)

  enable :sessions

  get '/resolve' do
    return [400, {"error" => "Missing home team"}.to_json ] unless params[:homeTeam]
    return [400, {"error" => "Missing away team"}.to_json ] unless params[:awayTeam]

    home_dice = 'blue'
    away_dice = 'green'
    [200, {"homeDice" => home_dice, "awayDice" => away_dice }.to_json]
  end

end
