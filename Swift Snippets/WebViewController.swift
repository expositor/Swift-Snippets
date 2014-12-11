//
//  WebViewController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: ContainerViewController, WKScriptMessageHandler {

    @IBOutlet var originalView: UIView! = nil
    
    var webView: WKWebView?

    var baseURL: NSURL!

    var receivedURL: String?
    
    override func viewDidLoad() {

        super.viewDidLoad()

        baseURL = NSURL(string: "http://paretodistribution.com/")
        
        let jsFile = NSBundle.mainBundle().pathForResource("script", ofType: "js")

        let cssFile = NSBundle.mainBundle().pathForResource("style", ofType: "css")
        
        var jsSource = NSString(contentsOfFile: jsFile!, encoding: NSUTF8StringEncoding, error: nil)!
        
        var cssSource = String(contentsOfFile: cssFile!)!

        var cssFormatted = " ".join(cssSource.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))

        var cssScript = WKUserScript(
            
            source: "document.getElementsByTagName('head')[0].innerHTML += '<style>\(cssFormatted)</style>';",
            
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            
            forMainFrameOnly: true
        )

        var userScript = WKUserScript(

            source: jsSource,

            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,

            forMainFrameOnly: true
        )
        
        var contentController = WKUserContentController();
        
        contentController.addUserScript(cssScript)
        
        contentController.addUserScript(userScript)
        
        contentController.addScriptMessageHandler(self, name: "hello")
        
        contentController.addScriptMessageHandler(self, name: "goodbye")
        
        var config = WKWebViewConfiguration()

        config.userContentController = contentController

        self.webView = WKWebView(frame: self.view.frame, configuration: config)

        self.view = self.webView!

        var fullURL = NSURL(string: receivedURL!, relativeToURL: baseURL)

        var req = NSURLRequest(URL:fullURL!)
        
        self.webView!.loadRequest(req)

        println(self.webView!.URL)

    }

    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        
        if(message.name == "hello") {
            
            println("JavaScript is sending a message: \(message.body)")
            
        } else if (message.name == "goodbye") {
            
            println("JavaScript is sending a message: \(message.body)")
        }
        
        let aColor:String = String("green")
        
        webView?.evaluateJavaScript("changeHeaderColor('\(aColor)')", completionHandler: nil)
        
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
}


