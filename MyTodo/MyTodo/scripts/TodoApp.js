var TodoApp = angular.module('TodoApp', ['ngRoute']);

//Configure angular ng-Route
TodoApp.config(["$routeProvider", '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider
        .when("/CategoryList", {
            templateUrl: "Template/CategoryList.html",
            controller: "mainController"
        })
        .when("/TodoList", {
            templateUrl: "Template/TodoList.html",
            controller: "mainController"
        })
        .otherwise({
            redirectTo: "/CategoryList"
        })
    $locationProvider.html5Mode(true);
}]);
//AngularJs main controller
TodoApp.controller("mainController", function ($scope, $http, $location) {
    

    //Show categorys
    $http.get('/Home/GetTodoCategorys')
        .success(function (result) {
            $scope.CategoryList = result;
        })
        .error(function (data) {
            console.log(data)
    });
    //show to do items      
        $http.get('/Home/GetTodoList')
         .success(function (result) {
             
             $scope.TodoList = result;
         })
         .error(function (data) {
             console.log(data)
         });           
    //Add new ategory
    $scope.newCategory = "";
    $scope.addCategory = function () {
        $http.post("/Home/AddCategory", { newCategory: $scope.newCategory })
        .success(function (result) {
            $scope.CategoryList = result;
            $scope.newCategory = "";
        })
        .error(function (data) {
            console.log(data)
        });
    }

   //Delete category
    $scope.deleteCategory = function (CategoryList) {
        $http.post("/Home/DeleteCategory", { delCategory: CategoryList })
        .success(function (result) {
            $scope.CategoryList = result;            
        })
        .error(function (data) {
            console.log(data)
        });
    }
//reset filter
	/*
	$scope.reset = function () {
		$scope.offset = 0;
		$scope.items = [];
		$scope.search();
	};
//search
	$scope.search = function () {
		Todo.query({ q: $scope.query, limit: $scope.limit, offset: $scope.offset },
			function (items) {
				var cnt = items.length;
				$scope.no_more = cnt < 20;
				$scope.items = $scope.items.concat(items);
			}
		);
	};
	*/
   
   
//redirect to TaskList template
    $scope.goToTodoList = function (hash) {
        $location.path(hash)
    };
//Add new todo TodoText and note
    $scope.newTodoText = "";
    $scope.newTodoNote = "";
    $scope.addTodo = function () {
        $http.post("/Home/AddTodo", { newTodoText: $scope.newTodoText, newTodoNote: $scope.newTodoNote })
        .success(function (result) {
            $scope.TodoList = result;           
        })
        .error(function (data) {
            console.log(data)
        });
    }
//Delete todo from database
    $scope.deleteTodo = function (TodoList) {
        $http.post("/Home/DeleteTodo", { delTodo: TodoList })
        .success(function (result) {
            $scope.TodoList = result;
        })
        .error(function (data) {
            console.log(data)
        });
    }

});

