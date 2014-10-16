relatedManager.factory('HashtagFeed', ['$resource', function($resource){

	return $resource('/hashtag_feeds/:id',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);
