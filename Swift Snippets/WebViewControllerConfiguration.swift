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

        baseURL = NSURL(string: "http://nicoleleeonline.com/")

        let jsFile = NSBundle.mainBundle().pathForResource("script", ofType: "js")

        var jsSource = String(contentsOfFile: jsFile!, encoding: NSUTF8StringEncoding, error: nil)!

        var userScript = WKUserScript(

            source: jsSource,

            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,

            forMainFrameOnly: true
        )
        
        var contentController = WKUserContentController();
        
        contentController.addUserScript(userScript)

        contentController.addScriptMessageHandler(self, name: "hello")

        contentController.addScriptMessageHandler(self, name: "goodbye")

        var config = WKWebViewConfiguration()

        config.userContentController = contentController

        self.webView = WKWebView(frame: self.view.frame, configuration: config)/*.loadHTMLString(string: String, baseURL: NSURL?)*/
        
        self.view = self.webView!
    }
    
}