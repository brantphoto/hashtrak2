relatedManager.factory('HashtagFeed', ['$resource', function($resource){

	return $resource('/hashtag_feeds/:id.json',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);
