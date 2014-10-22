relatedManager.controller('hashSizeCtrl', ['$scope', 'HashSize', '$location', function($scope, HashSize, $location){

  $scope.$on('searchSavedEvent', function(event, searchsubmission){
    var hashsizes = HashSize.query({hashtag_feed_id: searchsubmission});
        hashsizes.$promise.then(function(json) {
console.log(json)

          linelabelreturn = function(hashsizesjson) {

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
            for (var i = 0; i < loopsize(json); i++) {
              labels.push(hashsizesjson[i]['month'] + "/" + hashsizesjson[i]['day']);
              datar.push(hashsizesjson[i]['size']);
            }
            labelsanddata.push(labels,datar);
            return labelsanddata;
          };

          var finallinedata = linelabelreturn(json);
          console.log(json);

          $scope.lineData = {
        labels: finallinedata[0], 
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: finallinedata[1]
            }
        ]
        };
       console.log($scope.lineready);
        $scope.lineready = true;
       console.log($scope.lineready);
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

    $scope.lineChartOptions = {

        ///Boolean - Whether grid lines are shown across the chart
        scaleShowGridLines : true,

        //String - Colour of the grid lines
        scaleGridLineColor : "rgba(0,0,0,.05)",

        //Number - Width of the grid lines
        scaleGridLineWidth : 1,

        //Boolean - Whether the line is curved between points
        bezierCurve : true,

        //Number - Tension of the bezier curve between points
        bezierCurveTension : 0.4,

        //Boolean - Whether to show a dot for each point
        pointDot : true,

        //Number - Radius of each point dot in pixels
        pointDotRadius : 4,

        //Number - Pixel width of point dot stroke
        pointDotStrokeWidth : 1,

        //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
        pointHitDetectionRadius : 20,

        //Boolean - Whether to show a stroke for datasets
        datasetStroke : true,

        //Number - Pixel width of dataset stroke
        datasetStrokeWidth : 2,

        //Boolean - Whether to fill the dataset with a colour
        datasetFill : true,

        //String - A legend template
        legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"

    };
    });
}]);
