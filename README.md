Everyday MLB Advanced Media releases a bevy of information about the previous day's games, in XML format. I would like to take this data and render in an app.
My app will display the previous day's fastest pitch, as well as perhaps the slowest, the pitch with the most vertical break, and horizontal break. It will also display season leaders for those categories.
Users can sign in and have favorite pitchers. They can search for a pitcher, and select them as a favorite. They can display their favorites, as well as various information about them.
Two possible ideas are a heatmap of fastest pitches (ie where in the country) as well as a formula resulting in a pitcher making $x per mph per pitch, based on his salary.

Possible models are Pitcher, Pitch, Team, and Location. A Pitcher has many pitches and belongs to one team. A Pitch belongs to one Pitcher, and belongs to one location. A Pitcher belongs to one team. A team has many pitchers. A location has many pitches.

There are various APIs that I hope can accomplish the task of taking the data from MLBAM and putting it in a useful format. These include GamedayAPI and GreenMonster, with perhaps others.