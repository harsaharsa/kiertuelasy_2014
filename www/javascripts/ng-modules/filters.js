/*
 * Striim.in - Angular filters
 */

////////////////////////////////////////////////////////////////
// Module definition
////////////////////////////////////////////////////////////////

angular.module("Lasy.filters", []);

////////////////////////////////////////////////////////////////
// Deep groupBy for movie categories
////////////////////////////////////////////////////////////////

// Based on SO answer: http://stackoverflow.com/a/19537809

angular.module("Lasy.filters").filter("groupBy", [function () {

	return function (data, key) {
		if (data === null) return;
		var result = {};
		for (var i = 0; i < data.length; i++) {
			// Check that the array is present with the key
			if (!result[data[i][key]]) result[data[i][key]] = [];
			// Push the item to the group
			result[data[i][key]].push(data[i]);
		}
		return result;
	};

}]);