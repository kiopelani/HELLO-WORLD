angular.module('StockApp.controllers', [])
.controller('stockAppCtrl', function($scope, $http, stockAPIservice) {
  var self = this;
  $scope.stockList = [];
  stockAPIservice.getStocks().success(function (data) {
    $scope.StockList = data;
  })

  $scope.add = function() {
    $http( {method: 'post', url: "dashboard/stocks/add" , headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}, data: {symbol: $scope.text}})
    .success( function(data) {
      stockAPIservice.getStocks().success(function (data) {
        $scope.StockList = data;
      })
    })
    .error( function(data, status, headers, config) {
      console.log('Fail');
    });
  }

  $scope.remove = function() {
    $http( {method: 'delete', url: "dashboard/stocks/delete" , headers: {'X-Requested-With': 'XMLHttpRequest', 'Accept': 'application/json, text/plain, */*'}, params: {symbol: $scope.text}})
    .success( function(data) {
      stockAPIservice.getStocks().success(function (data) {
        $scope.StockList = data;
      })
    })
    .error( function(data, status, headers, config) {
      console.log('Fail');
    });
  }

});
