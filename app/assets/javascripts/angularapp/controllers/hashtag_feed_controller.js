relatedManager.controller('hashtagFeedCtrl', ['$scope', 'HashtagFeed', '$location', function($scope, HashtagFeed, $location){
  $scope.$on('searchSavedEvent', function(event, searchsubmission){
      console.log(searchsubmission);  
      var relatedhashtags = HashtagFeed.get({id: searchsubmission });
      relatedhashtags.$promise.then(function(json){
        var tags = json.sorted_hash;
        barlabelreturn = function(relatedtagsjson) {

          loopsize = function(objectcollection) {
            if (objectcollection.length < 10) {
              return objectcollection.length;
            } else {
              return 10;
            }
          };

          var labelsanddata = new Array;
          var labels = new Array;
          var datar = new Array;
          for (var i = 0; i < loopsize(relatedtagsjson); i++) {
            labels.push(tags[i][0]);
            datar.push(tags[i][1]);
          }
          labelsanddata.push(labels,datar);
          return labelsanddata;
        };

        var finalbardata = barlabelreturn(tags);
        console.log(json);
        $scope.myData = {
          labels: finalbardata[0],
          datasets: [
            {
            fillColor: "#c0392b",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "#FF5E4B",
            highlightStroke: "rgba(220,220,220,1)", 
            data: finalbardata[1]
          }
          ]
        };
      $scope.barready = true;
      $scope.category = json['category']['name'];
      $scope.definition = json['definition'];
      $scope.hashfeedname = json['name'];
      console.log($scope.category);
    });
  });
}]);
