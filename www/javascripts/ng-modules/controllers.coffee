# Kiertueläsy - Angular controllers

# Module definition

angular.module "Lasy.controllers", []

# Root Controller
angular.module("Lasy.controllers").controller "RootCtrl", ["$scope", "$location", "$timeout",
  ($scope, $location, $timeout)->

    # Animation
    $scope.animationIsReversed = false

    $scope.reverseAnimation = ->
      $scope.animationIsReversed = true

    # Loading

    $scope.isLoading = false

    $scope.$on "$routeChangeStart", ->
      $scope.isLoading = true

    $scope.$on "$routeChangeSuccess", ->
      $scope.isLoading = false
      $timeout ->
        $scope.animationIsReversed = false
      , 50
]
     # Navigation

    # $scope.showVideoList = function () {
    #   $location.path("/list-videos");
    # };
    #
    # $scope.showVideoDetails = function (id) {
    #   $location.path("/show-video-details/" + id);
    # };

  # Frontpage controller

angular.module("Lasy.controllers").controller "FrontpageCtrl", ($scope, Contacts, $filter) ->

    $scope.contacts = [];

    Contacts.getAllContacts().then(
      (data) ->
        $scope.videos = data
    )

]