barlabelreturn = function(relatedtagsjson) {

  loopsize = function(objectcollection) {
    if objectcollection.length < 10 {
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


sudocode

first we need to find out how many things on the api were returned. let's count the number

next we need to feed that number in as an arguement
