//
//  TopBarViewFile.swift
//  newEvoApp
//
//  Created by Ashish Jain on 07/09/23.
//

import Foundation
import GameController
import SystemConfiguration

class TopBarViewFile{
    func getConsollerStatus()->UIImage{
        let controllers = GCController.controllers()
         if controllers.isEmpty{
             return UIImage(named: "GameConsoleNotConnected")!
        }else{
            return UIImage(systemName: "gamecontroller.fill")!
        }
    }
    
    func getNetworkConnectivityType() -> UIImage {
        var flags = SCNetworkReachabilityFlags()
        let reachability = SCNetworkReachabilityCreateWithName(nil, "https://www.google.com/")
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        if isNetworkReachable(with: flags) {
            if flags.contains(.isWWAN) {
                
                return UIImage(systemName: "cellularbars")! //"Cellular"
            } else {
                return UIImage(systemName: "wifi")! //WiFi
            }
        } else {
            return UIImage(systemName: "wifi.slash")! // No internet
        }
    }
    
    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return isReachable && !needsConnection
    }
    
    func getBatteryPercentage() -> String{
        let batteryLevel = UIDevice.current.batteryLevel
        return String("\(Int(abs(batteryLevel * 100)))%")
    }
    
    func getBatteryImage() -> UIImage? {
        //let device = UIDevice.current
        
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel: Float = abs(UIDevice.current.batteryLevel*100)
        let level = Int(abs(UIDevice.current.batteryLevel))*100
        print(level*100)
        
//        guard device.isBatteryMonitoringEnabled else {
//            // Battery monitoring is not enabled
//            return nil
//        }
        if batteryLevel <= 10 {
             print("below 10",level)
             return UIImage(systemName: "battery.0")
         }
       else if batteryLevel <= 25 {
            print("below 25",level)
            return UIImage(systemName: "battery.25")
        } else if batteryLevel <= 50 {
            return UIImage(systemName: "battery.50")
        } else if batteryLevel <= 75  && batteryLevel <= 99{
            return UIImage(systemName: "battery.75")
        }
        return UIImage(systemName: "battery.100")
    }

    
//    func getCurrentTime() -> String {
//        let currentDate = Date()
//        let formatter = DateFormatter()
//        formatter.timeStyle = .medium
//        return formatter.string(from: currentDate)
//    }

//    func getTime()->String{
//        let today = Date()
//        var hours = (Calendar.current.component(.hour, from: today))
//        var minutes = (Calendar.current.component(.minute, from: today))
//        var newMin = ""
//        var AM = "AM"
//
//        if hours>=12{
//            hours = hours%12
//            AM = "PM"
//            }
//        if minutes <= 9{
//            newMin = "0\(minutes)"
//        }else{
//            newMin = String(minutes)
//        }
//
//        return "\(hours):\(newMin)\(AM)"
//    }
    
    func getTime() -> String {
        let today = Date()
        var hours = (Calendar.current.component(.hour, from: today))
        let minutes = (Calendar.current.component(.minute, from: today))
        
        var timePeriod = "AM"
        
        if hours >= 12 {
            timePeriod = "PM"
            if hours > 12 {
                hours -= 12
            }
        } else if hours == 0 {
            hours = 12  // Midnight should be represented as 12:00 AM
        }
        
        let formattedMinutes = String(format: "%02d", minutes)
        
        return "\(hours):\(formattedMinutes) \(timePeriod)"
    }

}
