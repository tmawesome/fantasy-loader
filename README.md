# Notes

target_variable = player fantasy_points for a week given previous weeks
who is going to score the most fantasy points?
See PlayerGameStatsByWeek.

(5 player types) which positions will get the most points? so you can decide
which position to draft first.

using previous weeks cumulative, what would be the current prediction for points?
See PlayerGameStatsByWeek Further Suggestions.

team cumulative stats

# PlayerGameStatsByWeek

`PlayerGameStatsByWeek` has 1:many relationship between
`PlayerGame`:`ScoringDetail`

![Entity Relationship Diagram][2]

Table `viewAggregatePlayerGameStatsByWeek` was created from a [complex query][3]
using many derived tables and correlated subqueries from the data contained in
`PlayerGame` and `ScoringDetail`

Each Scoring Type is aggregated for count, minimum, maximum, and average. The
columns are conventionally named as such:

- `ScoringCountsScoringType`
- `ScoringLenMinScoringType`
- `ScoringLenMaxScoringType`
- `ScoringLenAvgScoringType`

Finally, the target variable `FantasyPointsNextWeek` is given.
Note that this value is `NULL` for all week 17 records.

## Further Suggestions

This table is a snapshot week by week. A more robust query would contain
cumulative statistics for all previous weeks.


# References

[Data Dictionary][1]

[1]:https://fantasydata.com/resources/data-dictionary.aspx?league=nflv3
[2]:./data/PlayerGameStatsByWeek/2015/erd.png
[3]:./data/PlayerGameStatsByWeek/2015/viewAggregatePlayerGameStatsByWeek.sql
