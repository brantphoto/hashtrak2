relatedManager.factory('HashtagFeed', ['$resource', function($resource){

	return $resource('/api/hashtag_feeds/:id',
		{id: '@id'},
		{update: {method: 'PATCH'}});
}]);
