module.exports = class ArticlesCreateController
  @$inject: ['ArticlesService', '$state']
  constructor: (@ArticlesService, @$state) ->
    @article = {}
  create: ->
    @isLoading = true
    @ArticlesService.save this.article, =>
      this.$state.go('articles')
