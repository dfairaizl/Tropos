angular.module('troposApp').directive 'trTempChanger', ($interval) ->
  restrict: 'A'
  scope:
    temp: '=trTemp'
    property: '@trProp'
  link: ($scope, $element, $attrs) ->
    $scope.$watch 'temp', () ->
      unless $scope.temp == ""
        coldK = 273.15
        hotK = 299.817
        currentK = $scope.temp
        ratio = (currentK - coldK) / (hotK - coldK)

        coldColor = [66, 115, 161]
        hotColor = [226, 161, 67]

        interpolatedColor = []

        for i in [0..coldColor.length - 1]
          interpolatedColor[i] = parseInt(coldColor[i] * (1 - ratio) + hotColor[i] * ratio)

        newRGB = "rgb(" + interpolatedColor[0]  + ", " + interpolatedColor[1] + ", " + interpolatedColor[2] + ")"

        $element.css($scope.property, newRGB)


