angular.module('directives.navBar', [])
.directive('navBar', function(){
	return{
		restrict: 'AE',
		templateUrl: 'assets/rcart/directives/nav_bar/nav_bar.html',
		controller: function($scope, $element){
			
		},
		link: function(scope, element, attrs){

		}
	}
});