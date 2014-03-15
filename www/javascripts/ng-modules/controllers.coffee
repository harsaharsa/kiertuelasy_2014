# Kiertueläsy - Angular controllers

# Module definition

angular.module "Lasy.controllers", ['ionic', 'ngAnimate']

# Root Controller
angular.module("Lasy.controllers").controller "RootCtrl", ($scope, $location, $timeout)->

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

     # Navigation

    # $scope.showVideoList = function () {
    #   $location.path("/list-videos");
    # };
    #
    # $scope.showVideoDetails = function (id) {
    #   $location.path("/show-video-details/" + id);
    # };

  # Frontpage controller

angular.module("Lasy.controllers").controller "FrontpageCtrl", ($scope, Data, $filter) ->

  $scope.contacts = [];

  $scope.visibleCategory = 'none'
  $scope.toggleVisibleCategory = (name) ->
    $scope.visibleCategory = if $scope.visibleCategory is name
      'none'
    else
      name

  $scope.openMap = (mapUrl) ->
    steroids.openURL mapUrl

  $scope.openPhone = (phoneNumber) ->
    steroids.openURL "tel:#{phoneNumber}"

  Data.get('contacts').then(
    (data) ->
      $scope.contacts = data
  )

  Data.get('maps').then(
    (data) ->
      $scope.maps = data
  )


  $scope.toggleShowContacts = ->
    $scope.showContacts = !$scope.showContacts