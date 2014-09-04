relatedManager.controller('RelatedCtrl', ['$scope', 'RelatedHashtag', function($scope, RelatedHashtag){

	this.test = 'fuck yeah angular';

	RelatedHashtag.query(function(json){
      tags = json;
      $scope.tags = tags;
      $scope.x1 = tags[0][0]
      $scope.x2 = tags[1][0]
      $scope.x3 = tags[2][0]
      $scope.x4 = tags[3][0]
      $scope.x5 = tags[4][0]
      $scope.y1 = tags[0][1]
      $scope.y2 = tags[1][1]
      $scope.y3 = tags[2][1]
      $scope.y4 = tags[3][1]
      $scope.y5 = tags[4][1]
      $scope.chartAxis = [tags[0][0],tags[1][0],tags[2][0],tags[3][0],tags[4][0]]

      // $scope. = tags[0];


	})



	}]);