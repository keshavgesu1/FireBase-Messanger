//
//  AppDelegate.swift
//  FireBase Messanger
//
//  Created by Keshav Raj Kashyap on 10/02/22.
//
var apiKey = "AIzaSyD-u0T18I1fZM9YTVkhY9l7QmzWAS5Cr5I"
import UIKit
import Firebase
import FirebaseCrashlytics
import IQKeyboardManager
import FirebaseAnalytics
import GoogleMaps
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let navigationController = UINavigationController()
   
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        IQKeyboardManager.shared().isEnabled = true
        GMSServices.provideAPIKey(apiKey)
        checkUserIsLogin()
        //GMSPlacesClient.provideAPIKey(apiKey)
        return true
    }
    
    func checkUserIsLogin(){
        let rootViewController = self.window!.rootViewController as! UINavigationController
        if let userAvailable = UserDefaults.standard.value(forKey: "homeScreen"){
            if userAvailable as! String == "true"{
                if let homeVc = self.storyboard.instantiateViewController(withIdentifier: "HomeViewController")as? HomeViewController {
                    rootViewController.pushViewController(homeVc, animated: true)
                }
                
            }else{
                if let homeV = self.storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                    rootViewController.pushViewController(homeV, animated: true)
                }
                
            }
        }
    }
    
}

