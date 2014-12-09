//
//  ViewExtensionController.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

extension UIViewController{

    enum GoToViewAnimation {

        case FlipHorizontal

        case CoverVertical

        case CrossDissolve

        case PartialCurl

        case None

    }
    
    func activateSegueID(segueID: NSString) {

        performSegueWithIdentifier(segueID, sender: AnyObject?())

        return

    }

    func closeAnimatedView(){
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        return
        
    }
    
    func jumpToView(storyboard destinationstoryboard: NSString = "Main", viewID desinationViewID: NSString, animate animation: GoToViewAnimation = .None) -> Self {

        var viewController: UIViewController!

        viewController = UIStoryboard(name: destinationstoryboard, bundle: nil).instantiateViewControllerWithIdentifier(desinationViewID) as UIViewController

        switch animation {

            case .FlipHorizontal:

                viewController.modalTransitionStyle = .FlipHorizontal

            case .CoverVertical:

                viewController.modalTransitionStyle = .CoverVertical

            case .CrossDissolve:

                viewController.modalTransitionStyle = .CrossDissolve

            case .PartialCurl:

                viewController.modalTransitionStyle = .PartialCurl

            case .None:

                self.presentViewController(viewController!, animated: false, completion: nil)

            return self

        }
        
        self.presentViewController(viewController!, animated: true, completion: nil)
        
        return self
        
    }
    
    
}