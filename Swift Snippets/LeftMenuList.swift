//
//  leftMenuList.swift
//  Swift Snippets
//
//  Created by Daniel Lee on 12/11/14.
//  Copyright (c) 2014 Oitmain Mobile. All rights reserved.
//

import UIKit

@objc
class Menu {
    
    let title: String
    let creator: String
    let image: UIImage?
 
    init(title: String, creator: String, image: UIImage?) {
        self.title = title
        self.creator = creator
        self.image = image
    }
    
    class func leftMenu() -> Array<Menu> {
        return [ Menu(title: "Sleeping Cat", creator: "papaija2008", image: UIImage(named: "ID-100113060.jpg")),
                 Menu(title: "Pussy Cat", creator: "Carlos Porto", image: UIImage(named: "ID-10022760.jpg")),
                 Menu(title: "Korat Domestic Cat", creator: "sippakorn", image: UIImage(named: "ID-10091065.jpg")),
                 Menu(title: "Tabby Cat", creator: "dan", image: UIImage(named: "ID-10047796.jpg")),
                 Menu(title: "Yawning Cat", creator: "dan", image: UIImage(named: "ID-10092572.jpg")),
                 Menu(title: "Tabby Cat", creator: "dan", image: UIImage(named: "ID-10041194.jpg")),
                 Menu(title: "Cat On The Rocks", creator: "Willem Siers", image: UIImage(named: "ID-10017782.jpg")),
                 Menu(title: "Brown Cat Standing", creator: "aopsan", image: UIImage(named: "ID-10091745.jpg")),
                 Menu(title: "Burmese Cat", creator: "Rosemary Ratcliff", image: UIImage(named: "ID-10056941.jpg")),
                 Menu(title: "Cat", creator: "dan", image: UIImage(named: "ID-10019208.jpg")),
                 Menu(title: "Cat", creator: "graur codrin", image: UIImage(named: "ID-10011404.jpg")) ]
    }

    class func allDogs() -> Array<Menu> {
        return [ Menu(title: "White Dog Portrait", creator: "photostock", image: UIImage(named: "ID-10034505.jpg")),
                 Menu(title: "Black Labrador Retriever", creator: "Michal Marcol", image: UIImage(named: "ID-1009881.jpg")),
                 Menu(title: "Anxious Dog", creator: "James Barker", image: UIImage(named: "ID-100120.jpg")),
                 Menu(title: "Husky Dog", creator: "James Barker", image: UIImage(named: "ID-100136.jpg")),
                 Menu(title: "Puppy", creator: "James Barker", image: UIImage(named: "ID-100140.jpg")),
                 Menu(title: "Black Labrador Puppy", creator: "James Barker", image: UIImage(named: "ID-10018395.jpg")),
                 Menu(title: "Yellow Labrador", creator: "m_bartosch", image: UIImage(named: "ID-10016005.jpg")),
                 Menu(title: "Black Labrador", creator: "Felixco, Inc.", image: UIImage(named: "ID-10012923.jpg")),
                 Menu(title: "Sleepy Dog", creator: "Maggie Smith", image: UIImage(named: "ID-10021769.jpg")),
                 Menu(title: "English Springer Spaniel Puppy", creator: "Tina Phillips", image: UIImage(named: "ID-10056667.jpg")),
                 Menu(title: "Intelligent Dog", creator: "James Barker", image: UIImage(named: "ID-100137.jpg")) ]
    }
}