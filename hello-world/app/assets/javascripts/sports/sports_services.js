angular.module('SportApp.services', []).
  factory('sportAPIservice', function($http) {
    var sportAPI = {};
    sportAPI.getSports = function() {
      return $http({
        method: 'get',
        url: '/dashboard/sports/endpoint'
      });
    }
    return sportAPI;
  });
