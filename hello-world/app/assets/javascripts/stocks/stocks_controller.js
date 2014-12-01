
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
        debugger
      })
      .error( function(data, status, headers, config) {
        console.log('Fail');
      });
    // $http.post("dashboard/stocks/add", {symbol: $scope.text})
    // .success ( function(data) {
    //   console.log(data);
    //   debugger
    // })
    // .error ( console.log(error));
    // console.log(this)
    // console.log(this.$parent)
  }
});
