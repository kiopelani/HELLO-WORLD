// 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20rss%20where%20url%3D%22http%3A%2F%2Frss.news.yahoo.com%2Frss%2Ftopstories%22&format=json&diagnostics=true&callback=top_stories'

// angular.module('StockApp.controllers', [])
// .controller('stockAppCtrl', function($scope, $http, $location) {
//   // var url = ($location.$$absUrl+"toJS").replace("http://localhost:300","")
//   url = "dashboard/stocks/endpoint"
//   $http.get(url)
//   .success( function(data) {
//     $scope.StockList = (data);
//   })
//   .error( function(error) {
//     console.log(error);
//   })
// });