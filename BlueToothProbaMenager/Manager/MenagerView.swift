//
//  MenagerView.swift
//  BlueToothProbaMenager
//
//  Created by Ivan Dimitrov on 31.12.20.
//

import SwiftUI

struct MenagerView: View {
    
    @ObservedObject var bleManager = HRMManager()
    var body: some View {
        VStack {
            Text("🐶")
            List(bleManager.peritherals) { peri in
                HStack {
                    Text(peri.name)
                    Spacer()
                    Text(String(peri.rssi))
                }.padding()
            }.frame(width: 400, height: 400, alignment: .center)
            HStack {
                
                Button(action: {
                              bleManager.startScenning()
                }) {
                    Text("Start Scanning")
                        .padding()
                }
                
                Button(action: {
                               bleManager.stopScenning()
                }) {
                    Text("Stop Scenning")
                        .padding()
                }
                
            }

            
            
        }
    }
}

struct MenagerView_Previews: PreviewProvider {
    static var previews: some View {
        MenagerView()
    }
}
