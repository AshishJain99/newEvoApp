//
//  NetworkMonitor.swift
//  newEvoApp
//
//  Created by Ashish Jain on 08/09/23.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue
    
    private(set) var isConnected: Bool = false
    private(set) var connectionType: ConnectionType = .unknown

    enum ConnectionType {
        case wifi
        case cellular
        case ethernet
        case unknown
    }
    
    private init() {
        self.monitor = NWPathMonitor()
        self.queue = DispatchQueue(label: "NetworkMonitor")
    }
    
    func startMonitoring() {
        self.monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            
            self.connectionType = .unknown
            if path.usesInterfaceType(.wifi) {
                self.connectionType = .wifi
            } else if path.usesInterfaceType(.cellular) {
                self.connectionType = .cellular
            } else if path.usesInterfaceType(.wiredEthernet) {
                self.connectionType = .ethernet
            }
            
            // Notify listeners about the connection type change
            NotificationCenter.default.post(name: Notification.Name("NetworkConnectionChanged"), object: nil)
        }
        
        self.monitor.start(queue: self.queue)
    }
    
    func stopMonitoring() {
        self.monitor.cancel()
    }
}
