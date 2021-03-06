class WeatherModel {
  //https://api.openweathermap.org/data/2.5/onecall?lat=33.441792&lon=-94.037689&exclude=hourly,daily&appid={API key}
  //current
  // minutely
  // hourly
  // daily
  // alerts

  //For temperature in Fahrenheit and wind speed in miles/hour, use units=imperial
  // For temperature in Celsius and wind speed in meter/sec, use units=metric

  //lat Geographical coordinates of the location (latitude)
  // lon Geographical coordinates of the location (longitude)
  // timezone Timezone name for the requested location
  // timezone_offset Shift in seconds from UTC
  // current Current weather data API response
  // current.dt Current time, Unix, UTC
  // current.sunrise Sunrise time, Unix, UTC
  // current.sunset Sunset time, Unix, UTC
  // current.temp Temperature. Units - default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
  // current.feels_like Temperature. This temperature parameter accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  // current.pressure Atmospheric pressure on the sea level, hPa
  // current.humidity Humidity, %
  // current.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  // current.clouds Cloudiness, %
  // current.uvi Current UV index
  // current.visibility Average visibility, metres
  // current.wind_speed Wind speed. Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
  // current.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
  // current.wind_deg Wind direction, degrees (meteorological)
  // current.rain
  // current.rain.1h (where available) Rain volume for last hour, mm
  // current.snow
  // current.snow.1h (where available) Snow volume for last hour, mm
  // current.weather
  // current.weather.id Weather condition id
  // current.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
  // current.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
  // current.weather.icon Weather icon id. How to get icons
  // minutely Minute forecast weather data API response
  // minutely.dt Time of the forecasted data, unix, UTC
  // minutely.precipitation Precipitation volume, mm
  // hourly Hourly forecast weather data API response
  // hourly.dt Time of the forecasted data, Unix, UTC
  // hourly.temp Temperature. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
  // hourly.feels_like Temperature. This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  // hourly.pressure Atmospheric pressure on the sea level, hPa
  // hourly.humidity Humidity, %
  // hourly.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  // hourly.uvi UV index
  // hourly.clouds Cloudiness, %
  // hourly.visibility Average visibility, metres
  // hourly.wind_speed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour.How to change units used
  // hourly.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
  // chourly.wind_deg Wind direction, degrees (meteorological)
  // hourly.pop Probability of precipitation
  // hourly.rain
  // hourly.rain.1h (where available) Rain volume for last hour, mm
  // hourly.snow
  // hourly.snow.1h (where available) Snow volume for last hour, mm
  // hourly.weather
  // hourly.weather.id Weather condition id
  // hourly.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
  // hourly.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
  // hourly.weather.icon Weather icon id. How to get icons
  // daily Daily forecast weather data API response
  // daily.dt Time of the forecasted data, Unix, UTC
  // daily.sunrise Sunrise time, Unix, UTC
  // daily.sunset Sunset time, Unix, UTC
  // daily.temp Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
  // daily.temp.morn Morning temperature.
  // daily.temp.day Day temperature.
  // daily.temp.eve Evening temperature.
  // daily.temp.night Night temperature.
  // daily.temp.min Min daily temperature.
  // daily.temp.max Max daily temperature.
  // daily.feels_like This accounts for the human perception of weather. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit. How to change units used
  // daily.feels_like.morn Morning temperature.
  // daily.feels_like.day Day temperature.
  // daily.feels_like.eve Evening temperature.
  // daily.feels_like.night Night temperature.
  // daily.pressure Atmospheric pressure on the sea level, hPa
  // daily.humidity Humidity, %
  // daily.dew_point Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form. Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  // daily.wind_speed Wind speed. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
  // daily.wind_gust (where available) Wind gust. Units – default: metre/sec, metric: metre/sec, imperial: miles/hour. How to change units used
  // daily.wind_deg Wind direction, degrees (meteorological)
  // daily.clouds Cloudiness, %
  // daily.uvi The maximum value of UV index for the day
  // daily.pop Probability of precipitation
  // daily.rain (where available) Precipitation volume, mm
  // daily.snow (where available) Snow volume, mm
  // daily.weather
  // daily.weather.id Weather condition id
  // daily.weather.main Group of weather parameters (Rain, Snow, Extreme etc.)
  // daily.weather.description Weather condition within the group (full list of weather conditions). Get the output in your language
  // daily.weather.icon Weather icon id. How to get icons
  // alerts National weather alerts data from major national weather warning systems
  // alerts.sender_name Name of the alert source. Please read here the full list of alert sources
  // alerts.event Alert event name
  // alerts.start Date and time of the start of the alert, Unix, UTC
  // alerts.end Date and time of the end of the alert, Unix, UTC
  // alerts.description Description of the alert
  final double temperature;
  final double wind;
  final int humidity;
  final String city;
  final double longitude;
  final double latitude;
  final String main;
  final String description;

  WeatherModel({
    this.temperature,
    this.wind,
    this.humidity,
    this.city,
    this.latitude,
    this.longitude,
    this.description,
    this.main,
  });

  // static WeatherModel fromJson(Map map) {
  //   WeatherModel weatherModel = WeatherModel(
  //     latitude: map['coord']['lon'],
  //     longitude: map['coord']['lat'],
  //     main: map['weather'][0]['main'],
  //     description: map['weather'][0]['description'],
  //     temperature: map['main']['temp'],
  //     humidity: map['main']['humidity'],
  //     city: map['name'],
  //     wind: map['wind']['speed'],
  //   );
  //   return weatherModel;
  // }

// String getWeatherIcon(int condition) {
  //   if (condition < 300) {
  //     return '🌩';
  //   } else if (condition < 400) {
  //     return '🌧';
  //   } else if (condition < 600) {
  //     return '☔️';
  //   } else if (condition < 700) {
  //     return '☃️';
  //   } else if (condition < 800) {
  //     return '🌫';
  //   } else if (condition == 800) {
  //     return '☀️';
  //   } else if (condition <= 804) {
  //     return '☁️';
  //   } else {
  //     return '🤷‍';
  //   }
  // }
  //
  // String getMessage(int temp) {
  //   if (temp > 25) {
  //     return 'It\'s 🍦 time';
  //   } else if (temp > 20) {
  //     return 'Time for shorts and 👕';
  //   } else if (temp < 10) {
  //     return 'You\'ll need 🧣 and 🧤';
  //   } else {
  //     return 'Bring a 🧥 just in case';
  //   }
  // }

}
