require_relative '../resolver.rb'
require 'rspec'
require 'rack/test'

set :environment, :test

describe 'Dice Resolver Web Service Behaviour' do
  include Rack::Test::Methods

  def app
    ResolverApp
  end

  it 'should return BLUE dice for home team and RED dice for away team when home and away teams supplied' do
    get '/resolve?homeTeam=Wolves&awayTeam=WBA'
    expect(last_response).to be_ok

    json = JSON.parse(last_response.body)
    expect(json['homeDice']).to eq 'blue'
    expect(json['awayDice']).to eq 'red'
  end

  it 'should return error when home team missing from request' do
    get '/resolve?homeTeam=Wolves'
    expect(last_response).to_not be_ok

    json = JSON.parse(last_response.body)
    expect(json['error']).to eq 'Missing away team'
  end

  it 'should return error when away team missing from request' do
    get '/resolve?awayTeam=WBA'
    expect(last_response).to_not be_ok

    json = JSON.parse(last_response.body)
    expect(json['error']).to eq 'Missing home team'
  end

end
