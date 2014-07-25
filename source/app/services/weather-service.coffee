angular.module('troposApp').factory 'WeatherService', ($resource) ->
  $resource '',
  {
    APPID: '@APPID'
  },
  {
    fetch:
      method: 'GET'
      url: 'http://api.openweathermap.org/data/2.5/weather'
  }

