relatedManager.factory('RelatedHashtag', ['$resource', function($resource){
	return $resource('/hashtag_feeds/758/related_hashtags.json',
		{id: '@id'},
		{update: {method: 'PATCH'}});
}]);
