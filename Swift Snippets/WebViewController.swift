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
    
    override func loadView() {
        
        super.loadView()

        baseURL = NSURL(string: "http://nicoleleeonline.com/")

        let jsFile = NSBundle.mainBundle().pathForResource("script", ofType: "js")

        let cssFile = NSBundle.mainBundle().pathForResource("style", ofType: "css")

        let jsSource = NSString(contentsOfFile: jsFile!, encoding: NSUTF8StringEncoding, error: nil)!

        let cssFormatted = " ".join(String(contentsOfFile: cssFile!)!.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))

        let cssScript = WKUserScript(
            
            source: "document.getElementsByTagName('head')[0].innerHTML += '<style>\(cssFormatted)</style>';",
            
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            
            forMainFrameOnly: true
        )

        let userScript = WKUserScript(
            
            source: jsSource,
            
            injectionTime: WKUserScriptInjectionTime.AtDocumentEnd,
            
            forMainFrameOnly: true
        )
        
        let contentController = WKUserContentController();

        contentController.addUserScript(cssScript)

        contentController.addUserScript(userScript)

        contentController.addScriptMessageHandler(self, name: "hello")
        
        contentController.addScriptMessageHandler(self, name: "goodbye")
        
        let config = WKWebViewConfiguration()
        
        config.userContentController = contentController
        
        self.webView = WKWebView(frame: self.view.frame, configuration: config)

    }
    
    override func viewDidLoad() {

        super.viewDidLoad()

        self.view = self.webView!

        let fullURL = NSURL(string: receivedURL!, relativeToURL: baseURL)

        let req = NSURLRequest(URL:fullURL!)
        
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


