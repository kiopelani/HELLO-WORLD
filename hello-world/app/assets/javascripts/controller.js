function httpGet(theUrl) {
    var xmlHttp = null;
    xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false );
    xmlHttp.send( null );
    return xmlHttp.responseText
}

var response = JSON.parse(httpGet('/users/1/stocks/toJS'))

angular.module('StockApp.controllers', [])
.controller('stockAppController', function($scope, $http, $location) {
  console.log($location)
  var url = ($location.$$absUrl+"toJS").replace("http://localhost:300","")
  $http.get(url)
  .success( function(data) {
    console.log(data)
    $scope.StockList = (data);
  })
  .error( function(error) {
    console.log(error);
  })
  // $scope.StockList = [
  //   {
  //     Stock: {
  //       name: "Apple"
  //     }
  //   }
  // ];
});