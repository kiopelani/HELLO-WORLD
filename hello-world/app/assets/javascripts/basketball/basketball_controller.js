angular.module('BasketballApp.controllers', [])
.controller('basketballAppCtrl', function($scope, $http, basketballAPIservice) {
  $scope.gameList = [];
  basketballAPIservice.getGames().success(function (data) {
    $scope.GameList = data;
  })
});
