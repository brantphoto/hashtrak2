relatedManager.controller('RelatedCtrl', ['$scope', 'RelatedHashtag', function($scope, RelatedHashtag){

	this.test = 'fuck yeah angular';

	RelatedHashtag.query(function(json){
      $scope.tags = json;
      console.log(json);
	})



	}]);