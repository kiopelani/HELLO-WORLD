
angular.module('SportApp.controllers', [])
.controller('sportAppCtrl', function($scope, $http, sportAPIservice) {
  $scope.sportList = [];

  sportAPIservice.getSports().success(function (data) {
    $scope.SportList = data;
  })
});
