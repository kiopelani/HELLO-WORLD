
angular.module('StockApp.controllers', [])
.controller('stockAppCtrl', function($scope, $http, stockAPIservice) {
  var self = this;
  $scope.stockList = [];
  stockAPIservice.getStocks().success(function (data) {
    $scope.StockList = data;
  })

  $scope.add = function() {

    $http.post("dashboard/stocks/add", {symbol: $scope.text})
    // .success ( function(data) {
    //   console.log(data);
    //   debugger
    // })
    // .error ( console.log(error));
    // console.log(this)
    // console.log(this.$parent)
    // this.$parent.stockAPIservice.getStocks();
  }
});
