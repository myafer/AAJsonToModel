//
//  TestModel.swift
//  Qdai2
//
//  Created by 口贷网 on 16/1/25.
//  Copyright © 2016年 1211. All rights reserved.
//

import UIKit

class TestModel: QdaiBaseModel {
    
    var a: String?
    var arr: NSArray?
    var dic: Bmodel?
    
    override init(info: NSDictionary?) {
        super.init(info: info)
        self.setValue(Bmodel.init(info: info!["dic"] as? NSDictionary), forKeyPath: "dic")
    }

}


class Bmodel: QdaiBaseModel {
    var b: String?
    var c: NSArray?
}
