//
//  AppDelegate.swift
//  AudioWeather
//
//  Created by 최인국 on 2017. 5. 1..
//  Copyright © 2017년 최인국. All rights reserved.
//

import UIKit
import UserNotifications

import MapKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    
    let locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        isAuthorizedtoGetUserLocation()
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        
            print(granted)
        }
        
        center.delegate = self
        
        return true
    }

    
    func showAlert(){
        
        let alert = UIAlertController(title: "날씨 방송중", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "멈춰요", style: .default) { (action:UIAlertAction)->Void in
            
            print("stop")
        }
        
        alert.addAction(action)
        
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 30) {
            
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void){
        
        updateAlarmState()
        showAlert()
    }
    
    
    func isAuthorizedtoGetUserLocation() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse     {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    
    
    func updateAlarmState(){
        
        let alarms = AlarmManager().alarms
        
        for index in 0..<alarms.count{
            
            let alarm = alarms[index]
            
            if alarm.enabled == true && alarm.isRepeatWeek() == false{
                
                if alarm.date <= Date() {
                    
                    AlarmManager().alarms[index].enabled = false
                }
            }
        }

        
        AlarmManager().setNotification()
        
        NotificationCenter.default.post(name: Notification.Name("reloadAlarm"), object: nil)
    }
    

    
    public func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void){
        
        updateAlarmState()
        showAlert()
        completionHandler()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

