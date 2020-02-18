require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "8cce7274e1f85a1faa1553e47d98095c"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`

# Example output:
#
# In Chicago, it is currently 33.89 degress and Clear
# Extended forecast:
# A high temperature of 36.47 and Possible flurries in the afternoon.
# A high temperature of 33.98 and Mostly cloudy throughout the day.
# A high temperature of 33.94 and Possible light snow until evening.
# A high temperature of 32.73 and Mostly cloudy throughout the day.
# A high temperature of 32.51 and Partly cloudy throughout the day.
# A high temperature of 40.42 and Clear throughout the day.
# A high temperature of 23.21 and Overcast throughout the day.
# A high temperature of 29.12 and Clear throughout the day.

current_temperature = forecast["currently"]["temperature"]
current_summary = forecast["currently"]["summary"]
puts "In Chicago it is currently #{current_temperature} and #{current_summary}"

puts "Forecast:"
for day in forecast["daily"]["data"] do
    # forecast_high_temperature = forecast["daily"]["data"][a]["temperatureHigh"]
    # forecast_low_temperature = forecast["daily"]["data"][a]["temperatureLow"]
    # forecast_summary = forecast["daily"]["data"][a]["summary"]
    puts "A high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
end