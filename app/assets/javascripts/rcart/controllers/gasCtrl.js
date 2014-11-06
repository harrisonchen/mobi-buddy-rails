angular.module('controllers.gasCtrl', [])
.controller('gasCtrl', ['$scope', '$http', function($scope, $http){
	$scope.stations = {};

	var config = { headers: {
			'Access-Control-Allow-Origin': '*'
		}
	};
	url = "http://localhost:3000.herokuapp.com/nearby_gas.json?lat=34.04775455&long=-118.132893&dist=1&sortBy=price";
	
	$http.get(url)
	.success(function(data, config){
		console.log(data);
	});
}]);