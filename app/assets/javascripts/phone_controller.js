app.controller("PhoneController", ["$scope", '$http', function($scope, $http){

  var brands = [{name:"apple"},{name:"htc"},{name:"samsung"}];

  $scope.modelSelectingActive = false;
  $scope.manufactorers = brands;

  $scope.selectedVal = function(item){
    var query = item.name
    $http({
      mehtod: "GET",
      url: "/api/phone_models?brand=" + query
    }).
      success(function(data, status, headers, config) {
      //append data to select model
      $scope.modelSelectingActive = true;
      console.log("error!")
    }).
      error(function(data, status, headers, config) {
    });

  };

}]);
