//
//  ModalViewController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

class ModalViewController: ContainerViewController {


    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

    }

    @IBAction func closeModalButton(sender: AnyObject) {
        
        closeAnimatedView()
        
    }

}
