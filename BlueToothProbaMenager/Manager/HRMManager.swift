//
//  HRMManager.swift
//  BlueToothProbaMenager
//
//  Created by Ivan Dimitrov on 31.12.20.
//

import Foundation
import SwiftUI
import UIKit
import CoreBluetooth

class HRMManager: NSObject , ObservableObject , CBCentralManagerDelegate {
    
    @Published var peritherals = [Peripheral]()
    
    var centralManager : CBCentralManager!
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil )
        centralManager.delegate = self
    }
    
    func stopScenning() {
        centralManager.stopScan()
    }
    func startScenning() {
        centralManager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        if central.state == .poweredOn {
           print("on")
        }
        else {
            print("off")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        var peripheralName : String!
         
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            
                     peripheralName = name
            
        }else {
            
                      peripheralName = "Unknown"
            
        }
        
        let newPeripheral = Peripheral(id: peritherals.count , name: peripheralName, rssi: RSSI.intValue)
            print(newPeripheral)
            peritherals.append(newPeripheral)
        
    }
    
    
    
}
