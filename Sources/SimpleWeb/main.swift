  import Kitura
  import KituraStencil
  
  let router = Router()

  router.add(templateEngine: StencilTemplateEngine())

  router.get("/articles") { _, response, next in
    let context: [String: [[String:Any]]] =
        [
            "articles": [
                ["title" : "Using Stencil with Swift", "author" : "IBM Swift"],
                ["title" : "Server-Side Swift with Kitura", "author" : "Kitura"],
            ]
        ]
    try response.render("Example.stencil", context: context)
    response.status(.OK)
    next()
  }
  
  Kitura.addHTTPServer(onPort: 8080, with: router)
  
  // Should never return
  Kitura.run()
  
  print("Yikes: Server failed to start")
