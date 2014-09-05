relatedManager.factory('RelatedHashtag', ['$resource', '$location',  function($resource, $location){
  var og = $location.path();

	return $resource(og + "related_hashtags.json",
		{id: '@id'},
		{update: {method: 'PATCH'}});
}]);
