require_relative '../models/match_dice'
require 'singleton'

class DiceResolverService

  include Singleton

  def resolve (home_team, away_team)
    MatchDice.new
  end

end