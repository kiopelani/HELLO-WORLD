angular.module('BasketballApp.controllers', [])
.controller('basketballAppCtrl', function($scope, $http, basketballAPIservice) {
  $scope.gameList = [];
  basketballAPIservice.getGames().success(function (data) {
    $scope.GameList = data;
    var count = $scope.GameList.length
    if (count < 1) {
      $('#basketbally').parent().attr("data-sizey","1");
    } else if (count < 5 ) {
      $('#basketbally').parent().attr("data-sizey","2");
    } else if (count < 9 ) {
      $('#basketbally').parent().attr("data-sizey","3");
    } else if (count < 14 ) {
      $('#basketbally').parent().attr("data-sizey","4");
    } else {
      $('#basketbally').parent().attr("data-sizey","5");
    }
  })
});
