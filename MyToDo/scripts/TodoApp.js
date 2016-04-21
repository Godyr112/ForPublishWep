var TodoApp = angular.module('TodoApp', []);

TodoApp.controller("mainController", function ($scope, $http) {
    $http.get('/Home/GetTaskList')
    .success(function (result) {
        $scope.TodoList = result;

    })
    .error(function (data) {
        console.log(data)
    })

});