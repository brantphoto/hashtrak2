relatedManager.factory('Related_Hashtag', ['$resource', function($resource){
	return $resource('/hashtag_feeds/:id/related_hashtags',
		{id: '@id'},
		{update: {method: 'PATCH'}});
}]);