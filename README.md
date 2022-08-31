# README

Hi guys, I'm having trouble with getting my start_time for the flights.  Right now I'm just trying to get the flights where the start time matches the start time of the flight in my DB.  However no matter what I do it's not finding the data I need.  

I think the reason is because the format of the date in my parameters don't match the format of the date in my database.  The database saves the object as a TimeWithZone but my parameters has the information as a string but I'm not sure how to fix this.

```Parameters: {"departure_airport"=>"1", "arrival_airport"=>"3", "number_of_passengers"=>"1", "start_time"=>"2022-08-31 23:13:33 UTC", "commit"=>"Search"}```

In my parameters the start_time is formatted with the year first, but if I run

```Flight.first.start_time = Wed, 31 Aug 2022 23:13:33.429568000 UTC +00:00```

It returns something with the day, written out first.  

The following is my code for my dropdown menu and the query I'm using to look for the object.

```
<%= select_tag(:start_time, options_for_select(@start_time)) %>

@time = Flight.where("start_time = ?", params[:start_time])
```
