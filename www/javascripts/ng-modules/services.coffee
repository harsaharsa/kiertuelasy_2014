# Striim.in - Angular services

# Module definition

angular.module "Lasy.services", []

angular.module("Lasy.services").constant("API_PREFIX", "/data")
angular.module("Lasy.services").constant("API_SUFFIX", ".json")

# Video service

angular.module("Lasy.services").factory "Data", ($resource, $q, API_PREFIX, API_SUFFIX, $filter)->

  resourceForName = (resourceName) ->
    resource = $resource(
      "#{API_PREFIX}/#{resourceName}/1#{API_SUFFIX}", {}, {
        get:
          params: {}
          method: "GET"
          headers: {"Content-Type": "application/json"}
          isArray: true
          cache: false
      }
    )

  # Define public methods

  # Gets all contacts from the API
  get: (resourceName)=>
    deferred = $q.defer()
    resourceForName(resourceName).get().$promise.then(
      (data) ->
        deferred.resolve(data)
      (e) ->
        deferred.reject(e)
    )
    deferred.promise
