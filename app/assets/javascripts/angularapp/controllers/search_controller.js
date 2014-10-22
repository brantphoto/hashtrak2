relatedManager.controller('searchCtrl', ['$scope', 'Search', '$location', function($scope, Search, $location){

  this.search = '';

  this.addSearch = function(topic){
    
      $scope.newSearch = new Search();
      $scope.newSearch.topic = topic;
      console.log("this is the topic" + topic);
      console.log("this is the search object " + $scope.newSearch.topic);
      $scope.newSearch.$save()
      $scope.$broadcast('searchSavedEvent', topic);
  };


}]);
