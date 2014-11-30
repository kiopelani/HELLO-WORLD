
angular.module('SportApp.controllers', [])
.controller('sportAppCtrl', function($scope, $http, $location) {
  // var url = ($location.$$absUrl+"toJS").replace("http://localhost:300","")
  url = "/dashboard/sports/endpoint"
  $http.get(url)
  .success( function(data) {
    $scope.SportList = (data);
  })
  .error( function(error) {
    console.log(error);
  })
});
