angular.module('troposApp').directive 'trCurrentTime', ($interval, dateFilter) ->
  link = (scope, element, attrs) ->
    update = () ->
      element.text(dateFilter(new Date(), 'h:mm a'))

    scope.$watch attrs.trCurrentTime, () ->
      update()

    element.on '$destroy', () ->
      $interval.cancel timeoutId

    timeoutId = $interval () ->
      update()
    , 1000

