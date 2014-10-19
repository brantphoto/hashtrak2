relatedManager.factory('HashtagFeed', ['$resource', function($resource){

	return $resource('/hashtag_feeds/:id.json',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);

relatedManager.factory('HashSize', ['$resource', function($resource){

	return $resource('/hashtag_feeds/:hashtag_feed_id/hash_sizes/:id',
		{ id: '@id' },
    { hashtag_feed_id: '@hashtag_feed_id'},
		{update: {method: 'PATCH'} }
		);
}]);

