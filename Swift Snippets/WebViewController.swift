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

        var fullURL = NSURL(string: receivedURL!, relativeToURL: baseURL)

        var req = NSURLRequest(URL:fullURL!)

        self.webView!.loadRequest(req)

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


