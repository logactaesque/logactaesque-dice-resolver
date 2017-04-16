require 'rspec'
require_relative '../../app/services/dice_resolver_service'

describe 'Dice Resolver Service Behaviour' do

  it 'should resolve to return a match dice' do
    expect(DiceResolverService.instance.resolve('Leeds United', 'Liverpool')).to be_an_instance_of MatchDice
  end
end