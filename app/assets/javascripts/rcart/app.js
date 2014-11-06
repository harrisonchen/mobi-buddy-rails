angular.module('rcart', [
	'ui.router',
	'controllers.gasCtrl',
	'directives.nearbyGasList',
	'services.gas'
])
.config([
	'$stateProvider',
	'$urlRouterProvider',
	function($stateProvider, $urlRouterProvider){

		$stateProvider
		.state('home', {
			url: '/',
			templateUrl: 'assets/rcart/views/home.html'
		})
		.state('gas', {
			url: '/gas',
			controller: 'gasCtrl',
			templateUrl: 'assets/rcart/views/gas.html'
		})
		.state('signin', {
			url: '/sign_in',
			templateUrl: 'assets/rcart/views/sign_in.html'
		})

		$urlRouterProvider.otherwise('/');
	}
]);