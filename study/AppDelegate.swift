//
//  AppDelegate.swift
//  study
//
//  Created by 邹樟晴 on 15/11/19.
//  Copyright © 2015年 邹樟晴. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
//        
//        let version = Float(UIDevice.currentDevice().systemVersion)
//        if version < 8.0 {
//            application.registerForRemoteNotificationTypes(UIRemoteNotificationType.NewsstandContentAvailability)
//        }
//        else{
////            egisterForRemoteNotifications and registerUserNotificationSettings
//            application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: UIUserNotificationType.Badge, categories: nil))
//        }
        
        return true
    }
//    //收到本地通知
//    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
//        let alertView = UIAlertView(title: "系统本地通知", message: notification.alertBody, delegate: nil, cancelButtonTitle: "返回")
//        alertView.show()
//    }
//    
//    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
//       //这里把 deviceToken传给服务器
//        print(deviceToken.description)
//        
//    }
    
//    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
//        
//        if error.code == 3010 {
//            print ( "Push notifications are not supported in the iOS Simulator." )
//        } else {
//            print ( "application:didFailToRegisterForRemoteNotificationsWithError: \(error) " )
//        }
//    }
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

