//
//  CategoryPageViewController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

class CategoryPageViewController: ContainerViewController {

    var sendURLString = "/new-arrivals.html"

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if (segue.identifier) == "categoryPageEmbedSegue" {

            var vc = segue.destinationViewController as WebViewController

            vc.receivedURL = sendURLString

        }
    }

    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }

}
