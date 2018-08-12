//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
let postController = PostRequestController()
let getController = GetRequestController()
var routes = Routes()

routes.add(method: .post, uri: "/register", handler: postController.register)
routes.add(method: .post, uri: "/updateProfile", handler: postController.updateProfile)
routes.add(method: .get, uri: "/getProducts", handler: getController.productsList)
routes.add(method: .get, uri: "/getProductByID", handler: getController.productDetailByID)
routes.add(method: .post, uri: "/login", handler: postController.login)
routes.add(method: .post, uri: "/logout", handler: postController.logout)
routes.add(method: .post, uri: "/addReview", handler: postController.addReview)
routes.add(method: .post, uri: "/deleteReview", handler: postController.deleteReview)
routes.add(method: .get, uri: "/getReviews", handler: getController.reviewsList)
routes.add(method: .post, uri: "/addToBasket", handler: postController.addProductToBasket)
routes.add(method: .post, uri: "/deleteFromBasket", handler: postController.deleteProductToBasket)
routes.add(method: .post, uri: "/basketPay", handler: postController.basketPay)

server.addRoutes(routes)
server.serverPort = 8080

do {
	try server.start()
} catch {
	fatalError("Network error - \(error)")
}

