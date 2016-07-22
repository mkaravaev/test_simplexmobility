app.controller("PhoneController", ["$scope", function($scope){

  var names = [{name:"apple"},{name:"htc"},{name:"samsung"}];
  $scope.modelSelectingActive = false;

  $scope.manufactorers = names;

  $scope.selectedVal = function(item){
    $scope.modelSelectingActive = true;
  }

}]);
