angular.module('StockApp.services', []).
factory('stockAPIservice', function($http) {
  var stockAPI = {};
  stockAPI.getStocks = function() {
    var count = $('#stocky')[0].childElementCount
    if (count === 4) {
      $('#stocky').parent().attr("data-sizey","2");
    }
    // console.log($('#stocky'))
    return $http({
      method: 'get',
      url: '/dashboard/stocks/endpoint'
    });
  }
  return stockAPI;
});

