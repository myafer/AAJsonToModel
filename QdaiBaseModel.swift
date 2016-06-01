//
//  QdaiBaseModel.swift
//  Qdai2
//
//  Created by 口贷网 on 16/1/14.
//  Copyright © 2016年 1211. All rights reserved.
//

import UIKit

class QdaiBaseModel: NSObject {
    
    var selfDic: NSDictionary?
    
    lazy var mirror: Mirror = {Mirror(reflecting: self)}()
    
    init(info: NSDictionary?) {
        super.init()
        selfDic = info
        for p in mirror.children {
            let va = info![p.label!]
            let ke = p.label!
            
            if (va is NSArray || va is NSMutableArray) {
                self.setValue(va, forKeyPath: ke)
            } else if (va is NSDictionary || va is NSMutableDictionary) {
                //                self.setValue(QdaiBaseModel.init(info: va as? NSDictionary), forKeyPath: ke)
            } else {
                self.setValue(QdaiBaseModel.anyObjectToString(((va == nil ? "" : va) as AnyObject?)!), forKeyPath: ke)
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
        var restr =     "\n---------------------------  \(self.dynamicType) description \n"
        for p in mirror.children {
            restr = restr + "\(p.label!)    = \(unwrap(p.value))\n"
        }
        restr = restr.stringByReplacingOccurrencesOfString("Optional(", withString: "")
        restr = restr.stringByReplacingOccurrencesOfString(")", withString: "")
        restr = restr + "---------------------------  \(self.dynamicType) end "
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
    
    func unwrap(any:Any) -> Any {
        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .Optional {
            return any
        }
        
        if mi.children.count == 0 { return any }
        let (_, some) = mi.children.first!
        return some
    }
}
