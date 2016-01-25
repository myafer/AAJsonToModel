//
//  AppDelegate.swift
//  AAJsonToModel
//
//  Created by 口贷网 on 16/1/25.
//  Copyright © 2016年 Afer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        let diccc = ["a":"12312", "b":["12","2","3"], "c":["1":"2"]]
        let model = TestModel(info: diccc)
        print(model)
        print(model.b![0])
        
        print(model.toDictionary())

        
       
        
        
        
        
        
        return true
    }
}

