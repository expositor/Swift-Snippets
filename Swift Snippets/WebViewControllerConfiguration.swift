//
//  WebViewControllerExtension.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import WebKit

extension WebViewController{
    
    override func loadView() {

        super.loadView()

        var contentController = WKUserContentController();

        var userScript = WKUserScript(
            source: "changeHeaderColor('red')",
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            forMainFrameOnly: true
        )

        contentController.addUserScript(userScript)

        contentController.addScriptMessageHandler(
            self,
            name: "hello"
        )

        contentController.addScriptMessageHandler(
            self,
            name: "goodbye"
        )

        var config = WKWebViewConfiguration()

        config.userContentController = contentController

        self.webView = WKWebView(
            frame: self.view.frame,
            configuration: config
        )

        self.view = self.webView!
    }
    
}