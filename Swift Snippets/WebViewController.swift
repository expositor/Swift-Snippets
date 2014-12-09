//
//  WebViewController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: ContainerViewController {

    var receivedURL: String?

    override func viewDidLoad() {

        super.viewDidLoad()

        var url = NSURL(string:receivedURL!)

        var req = NSURLRequest(URL:url!)

        self.webView!.loadRequest(req)

    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }
    
}


