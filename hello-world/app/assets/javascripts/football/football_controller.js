angular.module('FootballApp.controllers', [])
.controller('footballAppCtrl', function($scope, $http, footballAPIservice) {
  debugger
  $scope.gameList = [];
  footballAPIservice.getGames().success(function (data) {
    $scope.GameList = data;
  })
});
