relatedManager.controller('searchCtrl', ['$scope', 'Search', '$location', function($scope, Search, $location){

  this.search = '';

  this.addSearch = function(topic){
    
      var newSearch = new Search();
      newSearch.topic = topic
      console.log(newSearch);
      newSearch.$save();
  };
      
    
  
}]);