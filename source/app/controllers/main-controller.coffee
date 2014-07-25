angular.module('troposApp').controller 'mainController', ($scope, WeatherService) ->
  $scope.currentWeather = WeatherService.fetch({ q: 'New York', APPID: 'bd6887a5eb390980467255326a3fda10' })

  $scope.$watch 'currentWeather.weather', (weather) ->
    if weather
      $scope.currentWeatherIcon = switch weather[0].id
        # Thunderstorms
        when 200, 210, 230 then 'wi-storm-showers'
        when 201, 202, 211, 212, 221, 231, 232 then 'wi-thunderstorm'
        #Drizzle
        when 300, 310 then 'wi-day-sprinkle'
        when 301, 311, 313, 321 then 'wi-day-showers'
        when 302, 312, 314 then 'wi-day-rain'
        # Rain
        when 500, 520 then 'wi-sprinkle'
        when 501, 521, 531 then 'wi-showers'
        when 502, 503, 504, 522  then 'wi-rain'
        when 511 then 'wi-snow'
        # Snow
        when 600, 620, 621 then 'wi-snow'
        when 601, 602, 621, 622 then 'wi-snow-wind'
        when 615, 616 then 'wi-rain-mix'
        when 611, 612 then 'wi-day-sleet-storm'
        # Atmosphere
        when 701, 712, 731 then 'wi-dust'
        when 711 then 'wi-smoke'
        when 741, 751, 761 then 'wi-day-fog'
        when 762 then 'wi-smog'
        when 771 then 'wi-strong-wind'
        when 781 then 'wi-tornado'
        # Clouds
        when 800 then 'wi-day-sunny'
        when 801, 802, 803, 804 then 'wi-day-sunny-overcast'
        # Extreme
        when 900 then 'wi-tornado'
        when 901 then 'wi-cloudy-windy'
        when 902 then 'wi-hurricane'
        when 903 then 'wi-snowflake-cold'
        when 904 then 'wi-hot'
        when 905 then 'wi-cloudy-windy'
        when 906 then 'wi-hail'
        # Additional
        when 950, 951, 952, 953, 954, 955, 956 then 'wi-windy'
        when 957, 958, 959 then 'wi-cloudy-gusts'
        when 960, 961 then 'wi-day-thunderstorm'
        when 962 then 'wi-hurricane'


  $scope.currentDay = (dayIndex) ->
    today = new Date()
    'today' if today.getDay() == dayIndex

