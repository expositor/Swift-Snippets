//
//  Persist.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/8/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

public class Persist {
    
    var persist: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    var key: NSString!
    
    init(key: NSString){
        
        self.key = key
    }
    
    func store(obj: AnyObject) -> Self{
        
        persist.setObject(obj, forKey: key)
        
        persist.synchronize()
        
        return self
    }
    
    func get() -> AnyObject{
        
        var storedValue: AnyObject {
            
            get{
                
                var result: AnyObject! = persist.objectForKey(key) as AnyObject!
                
                if result == nil{
                    
                    result = "default string"
                }
                
                return result!
                
            } set(newValue) {
                
                persist.setObject(newValue, forKey: key)
                
                persist.synchronize()
            }
        }
        
        return storedValue
        
    }
}

