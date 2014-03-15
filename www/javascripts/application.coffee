# Kiertueläsy 2014

# Define app and required modules

LasyApp = angular.module "LasyApp", [
	"Lasy.controllers"
	"Lasy.services"
	"Lasy.filters"
	"ngRoute"
	"ngResource"
	"ngAnimate"
]

# Configure app before running it

LasyApp.config ["$routeProvider", ($routeProvider)->
  # Show frontpage
  $routeProvider.when("/frontpage",
    templateUrl: "/partials/frontpage.html"
    controller: "FrontpageCtrl"
  ).otherwise(
    redirectTo: "/frontpage"
  )
]

steroids.view.setBackgroundColor "#FFFFFF"