angular.module('StockApp.controllers', [])
.controller('stockAppCtrl', function($scope, $http, $location) {
  // var url = ($location.$$absUrl+"toJS").replace("http://localhost:300","")
  url = "stocks/endpoint"
  $http.get(url)
  .success( function(data) {
    $scope.StockList = (data);
  })
  .error( function(error) {
    console.log(error);
  })
});
