require 'rspec'
require_relative '../../app/models/match_dice'

describe 'Match Dice Behaviour' do


  it 'should default to BLUE dice for home team' do
    match_dice = MatchDice.new
    expect(match_dice.home_dice).to eq 'blue'
  end

  it 'should default to GREEN dice for away team' do
    match_dice = MatchDice.new
    expect(match_dice.away_dice).to eq 'green'
  end
end
