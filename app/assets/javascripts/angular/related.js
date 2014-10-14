relatedManager.controller('RelatedCtrl', ['$scope', 'RelatedHashtag',  function($scope, RelatedHashtag){

   $scope.relatedhashtags =  RelatedHashtag.query(function(json){
     var tags = json;
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
      //$scope.tags = tags;
      //$scope.x1 = tags[0][0]
      //$scope.x2 = tags[1][0]
      //$scope.x3 = tags[2][0]
      //$scope.x4 = tags[3][0]
      //$scope.x5 = tags[4][0]
      //$scope.y1 = tags[0][1]
      //$scope.y2 = tags[1][1]
      //$scope.y3 = tags[2][1]
      //$scope.y4 = tags[3][1]
      //$scope.y5 = tags[4][1]
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
