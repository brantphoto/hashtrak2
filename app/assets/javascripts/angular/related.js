relatedManager.controller('RelatedCtrl', ['$scope', 'HashtagFeed', 'HashSize', '$location', function($scope, HashtagFeed, HashSize, $location){
   
 
   // var urlz = $location.path();
   // var urlz = urlz.split('/');
   // $scope.hash_id = urlz[urlz.length - 1];
   //relatedhashtags = HashtagFeed.all;

   // console.log(gon.hashfeed_name);


   //$scope.x1 = "testing";
   var relatedhashtags = HashtagFeed.get({id: gon.hashfeed_name }, function(json){
     var tags = json.sorted_hash;
     console.log('hello');
     $scope.x1 = "testing";
     console.log(json);
     $scope.myData = {
      labels: [tags[0][0],tags[1][0], tags[2][0],tags[3][0],tags[4][0],tags[5][0],tags[6][0],tags[7][0],tags[8][0],tags[9][0],tags[10][0]],
      datasets: [
        {
        fillColor: "rgba(220,220,220,0.5)",
        strokeColor: "rgba(220,220,220,0.8)",
        highlightFill: "rgba(220,220,220,0.75)",
        highlightStroke: "rgba(220,220,220,1)", 
        data: [tags[0][1], tags[1][1], tags[2][1], tags[3][1], tags[4][1], tags[5][1], tags[6][1],tags[7][1], tags[8][1], tags[9][1], tags[10][1]]
        }
      ]
     };

      });



   var hashsizesmeow = HashSize.query();
    hashsizesmeow.$promise.then(function(json) {
      console.log(json);
    });
   

$scope.myChartOptions = {
    //Boolean - Whether the scale should start at zero, or an order of magnitude down from the lowest value
    scaleBeginAtZero : true,

    //Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : true,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 1,

    //Boolean - If there is a stroke on each bar
    barShowStroke : true,

    //Number - Pixel width of the bar stroke
    barStrokeWidth : 2,

    //Number - Spacing between each of the X value sets
    barValueSpacing : 5,

    //Number - Spacing between data sets within X values
    barDatasetSpacing : 1,

    //String - A legend template
    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

};

}]);
