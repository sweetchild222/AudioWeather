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
    var locationFixAchieved:Bool = false
    var playWeather:PlayWeather? = nil
    var alert:UIAlertController? = nil
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initLocationService()
        
        initNotificationService()
        
        return true
    }
    
    
    func initNotificationService(){
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            
            print(granted)
        }
        
        center.delegate = self

    }
    
    func initLocationService(){
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        }
    }
    
    
    func closeAlert(completion: (() -> Swift.Void)? = nil){
        
        guard let gAlert = self.alert else{
            return
        }
        
        gAlert.dismiss(animated: true, completion:completion)
    }

    
    func showError(error:String){
        
        let alert = UIAlertController(title: error, message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default) { (action:UIAlertAction)->Void in
            
        }
        
        alert.addAction(action)
        
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
        
    }
    
    func showAlert(){
        
        self.alert = UIAlertController(title: "날씨 방송중", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "멈춰요", style: .default) { (action:UIAlertAction)->Void in
            
            if self.playWeather == nil {
                return
            }
            
            self.playWeather?.stop()
            self.playWeather = nil
            NotificationCenter.default.post(name: Notification.Name("showRescent"), object: nil)
        }
        
        self.alert?.addAction(action)
        
        self.window?.rootViewController?.present(alert!, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 40) {
            
            self.alert?.dismiss(animated: true, completion: nil)
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
    
    
    
    func performWeatherAudioAlarm(uuid:String){
        
        let index = AlarmManager().findIndex(uuid: uuid)
        
        if index == -1{
            return
        }
        
        updateAlarmState()
        showAlert()
        
        if AlarmManager().alarms[index].address.getUpper() == AddressMap.instance.current{
            
            requestLocation()
        }
        else{
        
            self.playWeather = PlayWeather(address:AlarmManager().alarms[index].address, completionHandler:{ error in
                
                self.closeAlert()
                NotificationCenter.default.post(name: Notification.Name("showRescent"), object: nil)
            })
            self.playWeather?.play()
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Swift.Void){
        
        let uuid = notification.request.content.userInfo["uuid"]
        
        performWeatherAudioAlarm(uuid:uuid as! String)
    }
    
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Swift.Void){
        
        let uuid = response.notification.request.content.userInfo["uuid"]
        
        performWeatherAudioAlarm(uuid:uuid as! String)

        completionHandler()
    }
    
    
    func requestLocation(){
        
        locationFixAchieved = false
        self.locationManager.requestLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationFixAchieved == false {
            
            locationFixAchieved = true
            
            let location = locations.last! as CLLocation
            
            requestAddr(lat:location.coordinate.latitude, lgt:location.coordinate.longitude)
        }
    }
    
    
    func requestAddr(lat:Double, lgt:Double){
        
        AddrRequester.instance.request(lat:lat, lgt:lgt){ response in
            
            guard let address = response else {
                
                self.closeAlert(completion: {
                    
                    self.showError(error:"현재 지역 정보를 가져 올 수 없습니다. 네트워크 상태를 확인 해주세요")
                })
    
                return
            }
            
            self.playWeather = PlayWeather(address:address, completionHandler:{ error in
                
                self.closeAlert(completion: {
                    
                    if error == true {
                        
                        self.showError(error:"날씨 정보를 가져 올 수 없습니다. 네트워크 상태를 확인 해주세요")
                    }
                    else{
                        
                        NotificationCenter.default.post(name: Notification.Name("showRescent"), object: nil)
                    }
                })
            })
            self.playWeather?.play()
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.showError(error:"현재 위치 정보를 가져 올 수 없습니다. GPS 상태를 확인 해주세요")
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

