//
//  QdaiBaseModel.swift
//  Qdai2
//
//  Created by 口贷网 on 16/1/14.
//  Copyright © 2016年 1211. All rights reserved.
//

import UIKit

class QdaiBaseModel: NSObject {
    
    
    lazy var mirror: Mirror = {Mirror(reflecting: self)}()
    
    init(info: NSDictionary?) {
        super.init()
        for p in mirror.children {
            
            let va = info![p.label!]
            let ke = p.label!
            
            if (va is NSArray || va is NSMutableArray) {
                self.setValue(va, forKeyPath: ke)
            } else {
                self.setValue(QdaiBaseModel.anyObjectToString((va as AnyObject?)!), forKeyPath: ke)
            }
            
        }
    }
    
    func toDictionary() -> NSMutableDictionary {
        let mdic: NSMutableDictionary = NSMutableDictionary()
        for p in mirror.children {
            mdic.setValue( self.valueForKeyPath(p.label!) , forKeyPath:  p.label!)
        }
        
        return mdic
    }

     override var description: String {
        var restr =     "##############  \(self.dynamicType) description ###############\n"
        for p in mirror.children {
            restr = restr + "\(p.label!)    = \(p.value)\n"    + "----------------------\n"
        }
        restr = restr + "######################## description end #######################\n"
        return restr
    }
    
    class func anyObjectToString(any: AnyObject?) -> String {
        if any is NSNumber {
            return NSString(format: "%@", any as! NSNumber) as String
        } else if any is String {
            return any as! String
        } else if any is NSString {
            return any as! String
        } else {
            print("ERROR: Type is error")
            return ""
        }
    }
}
