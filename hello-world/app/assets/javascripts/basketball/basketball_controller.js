angular.module('BasketballApp.controllers', [])
.controller('basketballAppCtrl', function($scope, $http, basketballAPIservice) {
  $scope.gameList = [];
  basketballAPIservice.getGames().success(function (data) {
    $scope.GameList = data;
    var count = $scope.GameList.length
    if (count < 3) {
      $('#basketbally').parent().attr("data-sizey","1");
    } else if (count < 7 ) {
      $('#basketbally').parent().attr("data-sizey","2");
    } else if (count < 13 ) {
      $('#basketbally').parent().attr("data-sizey","3");
    } else {
      $('#basketbally').parent().attr("data-sizey","4");
    }
  })
});
