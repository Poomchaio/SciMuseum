//
//  Data.swift
//  Bio Museum
//
//  Created by Poomchai Taechaprapasrat on 8/25/2560 BE.
//  Copyright © 2560 Poomchai Taechaprapasrat. All rights reserved.
//

import Foundation
import RealmSwift

class Collection:Object{
    @objc dynamic var id:String = ""
    @objc dynamic var name:String = ""
    let item = List<Item>()
    @objc dynamic var currentProgress:Int = 0
    @objc dynamic var totalProgress:Int = 0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}

class Item: Object{
    @objc dynamic var id:String = ""
    @objc dynamic var nameTH:String = ""
    @objc dynamic var nameEN:String = ""
    @objc dynamic var scientificName: String = ""
    @objc dynamic var isRevealedTrail = false
    @objc dynamic var isRevealedCollection = false
    @objc dynamic var roomName:String = ""
    let informations = List<StringObject>()
    let figures = List<Figure>()
//    override static func primaryKey() -> String? {
//        return "id"
//    }
}

class Figure: Object {
    @objc dynamic var image = ""
    @objc dynamic var figureDescription = ""
    @objc dynamic var reference = ""
    
}

class StringObject: Object {
    @objc dynamic var text:String = ""
}

class Total: Object {
    @objc dynamic var currentProgress:Int = 0
    @objc dynamic var totalProgress: Int = 0
}

class Trail: Object {
    @objc dynamic var id:String = ""
    @objc dynamic var name:String = ""
    let quest = List<Quest>()
    override static func primaryKey() -> String? {
        return "id"
    }
}

class Quest: Object {
    @objc dynamic var name:String = ""
    @objc dynamic var introduction:String = ""
    @objc dynamic var summary:String = ""
    let objective = List<Objective>()
}

class Objective: Object {
    @objc dynamic var name:String = ""
    let target = List<Target>()
}

class Target: Object{
    //dynamic var item: Item = Item()
    @objc dynamic var hint:String = ""
    @objc dynamic var introduction:String = ""
    @objc dynamic var summary:String = ""
    @objc dynamic var item:Item? = nil
}
