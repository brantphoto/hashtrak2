relatedManager.factory('HashtagFeed', ['$resource', function($resource){

	return $resource('/hashtag_feeds/:id.json',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);

relatedManager.factory('HashSize', ['$resource', function($resource){

	return $resource('/hash_sizes/:id',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);

