module.exports =
  build_dir: 'build'
  compile_dir: 'bin'

  app_files:
    js: [ 'source/app/**/*.js' ]
    coffee: [ 'source/app/**/*.coffee' ]
    html: [ 'source/index.html' ]
    scss: [ 'source/app/assets/stylesheets/*.scss' ]
    assets: [ 'source/app/assets/images/**/*' ]
  vendor_files:
    js: [
      'vendor/angular/angular.js'
      'vendor/angular-resource/angular-resource.js'
      'vendor/angular-route/angular-route.js'
    ],
    css: [
      'vendor/weather-icons/css/weather-icons.css'
    ]
    scss: [
      'vendor/bootstrap-sass-official/assets/stylesheets/bootstrap.scss'
    ],
    assets: []
    fonts: [
      'vendor/weather-icons/fonts/WeatherIcons-Regular.otf'
      'vendor/weather-icons/fonts/weathericons-regular-webfont.eot'
      'vendor/weather-icons/fonts/weathericons-regular-webfont.svg'
      'vendor/weather-icons/fonts/weathericons-regular-webfont.ttf'
      'vendor/weather-icons/fonts/weathericons-regular-webfont.woff'
    ]

