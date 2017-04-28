require 'sinatra'
require 'json'
require_relative 'app/services/dice_resolver_service'
require_relative 'app/models/match_dice'

# Using Sinatra modular style...

class ResolverApp < Sinatra::Base

  set :root, File.dirname(__FILE__)

  enable :sessions

  get '/resolve' do
    return [400, {"error" => "Missing home team"}.to_json ] unless params[:homeTeam]
    return [400, {"error" => "Missing away team"}.to_json ] unless params[:awayTeam]

    match_dice = DiceResolverService.instance.resolve(:homeTeam, :awayTeam)

    [200, {"homeDice" => match_dice.home_dice, "awayDice" => match_dice.away_dice }.to_json]
  end

end
