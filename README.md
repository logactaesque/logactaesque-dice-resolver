# Logactaesque Dice Resolver
This service resolves which dice are to be employed when playing a Logactaesque match fixture. The dice it returns are aligned with dice rolled as part of the [the Logactaesque Dice Service](https://github.com/logactaesque/logactaesque-dice)

The application is a [Sinatra-based](http://www.sinatrarb.com/) ruby application. To run locally, clone the repository, navigate into the directory and then:

    # installs gems...
    bundle install

    # run the application on port 9292
    bundle exec rackup

The service presently holds a single endpoint called *resolve*, hence:

    localhost:9292/resolve?homeTeam=Wolves&awayTeam=WBA

will return:

    {"homeDice":"blue","awayDice":"green"}

Hence for a given match, the _blue_ dice will be used to determine home goals, and _green_ for away.  If a home team and away team name are supplied, it will (for the moment) always return the above JSON with a response code of 200, however in the near future the resolver will have additional logic to allow dice to be selected based upon:

- Competition
- Recent form
- Number of points between teams (for league matches)


If either team is missing in the request, then the response code is 400 and you will see something akin to the following error message:

    {"error":"Missing away team"}
