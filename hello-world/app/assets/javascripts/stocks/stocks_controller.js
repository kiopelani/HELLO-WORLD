
angular.module('StockApp.controllers', [])
.controller('stockAppCtrl', function($scope, $http, $location) {
  url = "/dashboard/stocks/endpoint"
  $http.get(url).success( function(data) {
    debugger
    $scope.StockList = (data);
  });
  $scope.add = function(data) {
    $scope.StockList.push()
  }
});
