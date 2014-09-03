relatedManager.controller('RelatedCtrl', ['$scope', 'Related_Hashtag', function($scope, Related_Hashtag){

	this.test = 'fuck yeah angular';

	Related_Hashtag.query(function(json){
      $scope.tags = json;
	})



	}]);