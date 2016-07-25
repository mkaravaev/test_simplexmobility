app.controller("PhoneController", ["$scope", '$http', function($scope, $http){

  var brands = [{name:"apple"},{name:"htc"},{name:"samsung"}];
  var http_config = { method: "GET" }

  $scope.modelSelectingActive = false;
  $scope.manufactorers = brands;

  $scope.modelSelectedVal = function(item){
    link = item.link
    http_config.url = '/api/phone_model?models_links=' + link

    $http(http_config).
      success(function(data, status, headers, config) {
        $scope.models = data;
    });
  };

  $scope.selectedVal = function(item){
    var query = item.name

    http_config.url = "/api/phone_models?brand_name=" + query
    $scope.models = {};

    $http(http_config).
      success(function(data, status, headers, config) {
        $scope.modelSelectingActive = true;
        $scope.brandModels = data;
    });
  };

  $scope.searchModel = function(query){
    http_config.url = "/api/phone_models/search?query=" + query
    $scope.models = {};

    $http(http_config).
      success(function(data, status, headers, config) {
        $scope.models = data;
    });
  };

}]);
