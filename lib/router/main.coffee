Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "layout"

  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        subs.subscribe 'posts'
        subs.subscribe 'comments'
        subs.subscribe 'attachments'
      ]
    data: ->
      posts: Posts.find({},{sort: {createdAt: -1}}).fetch()

#migrate from old Router.
#index对应模板名字．path对应url,layoutTemplate对应模板(header,nav,footer组合的)
  @route "index",
    path: "/index"
    layoutTemplate: "layout"

  @route "product",
    path: "/product"
    layoutTemplate: "layout"

  @route "customerService",
    path: "/customerService"
    layoutTemplate: "Layout"

  @route "newinformation",
    path: "/newinformation"
    waitOn: ->
      subs.subscribe 'news'
      subs.subscribe 'attachments'
    data: ->
      news: News.find({},{sort: {createdAt: -1}}).fetch()
    layoutTemplate: "layout"

  @route "cooperativePartner",
    path: "/cooperativePartner"
    layoutTemplate: "Layout"

  @route "community",
    path: "/community"
    layoutTemplate: "Layout"

  @route "aboutus",
    path: "/aboutus"
    layoutTemplate: "layout"

  @route "informationDet",
    path: "/newinformation/informationDet"
    layoutTemplate: "Layout"

  @route "informationpage",
    path: "/newinformation/:_id"
    data:-> Newinformation.findOne(this.params.__id)
    # layoutTemplate: ""
