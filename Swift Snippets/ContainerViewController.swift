//
//  ViewController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit
import WebKit

class ContainerViewController: UIViewController, WKScriptMessageHandler {

    @IBOutlet var originalView: UIView! = nil

    var webView: WKWebView?

    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        
        if(message.name == "hello") {
        
            println("JavaScript is sending a message: \(message.body)")
            
        } else if (message.name == "goodbye") {
            
            println("JavaScript is sending a message: \(message.body)")
        }
        
        let aColor:String = String("green")

        webView?.evaluateJavaScript("changeHeaderColor('\(aColor)')", completionHandler: nil)

    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }

}

// Button Controllers Here Yo

extension ContainerViewController{
    
}
