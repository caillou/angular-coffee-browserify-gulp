angular = require('angular')
require('angular-ui-router')
require('angular-resource')

ArticlesCreateController = require './articles/articles_create_controller'

angular.module('rga', ['ui.router', 'ngResource'])

angular.module('rga')
.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise("")
  $stateProvider.state 'index',
    url: ''
    templateUrl: 'index.html'
  .state 'articles',
    parent: 'index'
    url: '/articles'
    templateUrl: 'articles.html'
  .state 'articles.create',
    url: '/create',
    templateUrl: 'articles_create.html',
    controller: 'ArticlesCreateController',
    controllerAs: 'articlesCreateController'

.factory 'ArticlesService', ($resource) ->
  $resource('http://jsonplaceholder.typicode.com/users/')

.controller('ArticlesCreateController', ArticlesCreateController)
