app.controller("PhoneController", ["$scope", '$http', function($scope, $http){

  var brands = [{name: "Acer"}, {name: "Alcatel"}, {name: "Allview"}, {name: "Amazon"}, {name: "Amoi"}, {name: "Apple"}, {name: "Archos"}, {name: "Asus"}, {name: "Benefon"}, {name: "Benq"}, {name: "Benq-Siemens"}, {name: "Bird"}, {name: "Blackberry"}, {name: "Blu"}, {name: "Bosch"}, {name: "BQ"}, {name: "Casio"}, {name: "Cat"}, {name: "Celkon"}, {name: "Chea"}, {name: "Coolpad"}, {name: "Dell"}, {name: "Emporia"}, {name: "Energizer"}, {name: "Ericsson"}, {name: "Eten"}, {name: "Fujitsu Siemens"}, {name: "Garmin Asus"}, {name: "Gigabyte"}, {name: "Gionee"}, {name: "Google"}, {name: "Haier"}, {name: "Hp"}, {name: "Htc"}, {name: "Huawei"}, {name: "I_mate"}, {name: "I_mobile"}, {name: "Icemobile"}, {name: "Innostream"}, {name: "Inq"}, {name: "Intex"}, {name: "Jolla"}, {name: "Karbonn"}, {name: "Kyocera"}, {name: "Lava"}, {name: "Leeco"}, {name: "Lenovo"}, {name: "Lg"}, {name: "Maxon"}, {name: "Maxwest"}, {name: "Meizu"}, {name: "Micromax"}, {name: "Microsoft"}, {name: "Mitac"}, {name: "Mitsubishi"}, {name: "Modu"}, {name: "Motorola"}, {name: "Mwg"}, {name: "Nec"}, {name: "Neonode"}, {name: "Niu"}, {name: "Nokia"}, {name: "Nvidia"}, {name: "O2"}, {name: "Oneplus"}, {name: "Oppo"}, {name: "Orange"}, {name: "Palm"}, {name: "Panasonic"}, {name: "Pantech"}, {name: "Parla"}, {name: "Philips"}, {name: "Plum"}, {name: "Posh"}, {name: "Prestigio"}, {name: "Qmobile"}, {name: "Qtek"}, {name: "Sagem"}, {name: "Samsung"}, {name: "Sendo"}, {name: "Sewon"}, {name: "Sharp"}, {name: "Siemens"}, {name: "Sonim"}, {name: "Sony"}, {name: "Sony_ericsson"}, {name: "Spice"}, {name: "T_mobile"}, {name: "Tel_me_"}, {name: "Telit"}, {name: "Thuraya"}, {name: "Toshiba"}, {name: "Unnecto"}, {name: "Vertu"}, {name: "Verykool"}, {name: "Vivo"}, {name: "Vk_mobile"}, {name: "Vodafone"}, {name: "Wiko"}, {name: "Wnd"}, {name: "Xcute"}, {name: "Xiaomi"}, {name: "Xolo"}, {name: "Yezz"}, {name: "Yota"}, {name: "Yu"}, {name: "Zte"}]

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
