angular.module('troposApp').filter 'temperature', () ->
  (input) ->
    if input >= 0
      parseInt((input - 273.15) * 1.8 + 32.0)
    else
      0
