angular.module('troposApp').directive 'trTempCount', ($timeout) ->
  restrict: 'A'
  scope:
    countStart: '=trStart'
    countEnd: '=trEnd'
  link: (scope, element, attrs) ->
    tick = () ->
        scope.current++
        element.text(scope.current)

        unless scope.current == scope.countEnd
          time = ease(scope.current, 0, scope.countEnd, 1000)
          timer = $timeout(tick, time)

    ease = (time, begin, change, duration) ->
      change * (time = time/duration)*time + begin

    scope.$watch 'countEnd', () ->
      if scope.countEnd
        scope.current = 0
        tick()

