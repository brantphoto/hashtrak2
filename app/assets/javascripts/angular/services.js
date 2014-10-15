relatedManager.factory('HashtagFeed', ['$resource', '$location', function($resource, $location){
    var og = $location.url()
	return $resource('/api/hashtag_feeds/:id',
		{ id: '@id' },
		{update: {method: 'PATCH'} }
		);
}]);
