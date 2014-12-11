//
//  ViewControllerTwo.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

protocol MainPageViewControllerDelegate {
    func toggleLeftPanel()
    func toggleRightPanel()
    func collapseSidePanels()
}

class MainPageViewController: ContainerViewController {

    var sendURLString = "/"
    
    var delegate: MainPageViewControllerDelegate?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier) == "mainPageEmbedSegue" {
            
            var vc = segue.destinationViewController as WebViewController
            
            vc.receivedURL = sendURLString

        }
    }

    @IBAction func openModalButton(sender: AnyObject) {
        
        toggleLeftPanel()

        activateSegueID("modalSegue")
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }
}
