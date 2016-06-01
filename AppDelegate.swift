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
        
        
        let aaa: NSDictionary = ["a": "123", "arr":["1", "2"], "dic":["b":"123", "c":["c", "cc"]]]
        let tModel = TestModel.init(info: aaa)

        print(tModel)
       
        
        
        
        
        
        return true
    }
}

