# Striim.in - Angular services

# Module definition

angular.module "Lasy.services", []

angular.module("Lasy.services").constant("API_PREFIX", "/data")
angular.module("Lasy.services").constant("API_SUFFIX", ".json")

# Video service

angular.module("Lasy.services").factory "Contacts", ($resource, $q, API_PREFIX, API_SUFFIX, $filter)->

  # Define API resource
  resource = $resource(
    API_PREFIX + "/videos/1" + API_SUFFIX,
      getAll:
        params: {}
        method: "GET"
        headers: {"Content-Type": "application/json"}
        isArray: false
        cache: false
  )

  # Define public methods

  # Gets all contacts from the API
  getAllContacts: ->
    deferred = $q.defer()
    resource.getAll().$promise.then(
      (data) ->
        deferred.resolve(data)
      (e) ->
        deferred.reject(e)
    )
    deferred.promise
