# Food

A solution to the [peck engineering assessment](https://github.com/peck/engineering-assessment) written in Elixir.

It is a simple live view page that displays the active food trucks and allows you to search for specific foods.

## Setup and Running

Run 
```sh
mix deps.get
mix ecto.setup
iex -S mix
```

### Caveats

I originally wanted to allow the user to filter the food trucks by day of week,
but the dataset is messy. After a cursory inspection of the data, it seemed that this 
would be possible, but after working with the data more the information was not available 
on the active food trucks. I thought linking to the schedule would be a good backup plan,
but links to the schedule of each food truck do not seem to work. I did not
investigate thoroughly, but it appears they may be behind a login. I believe there may be 
a separate API to find this information as well, but that was out of scope for this challenge.

```

