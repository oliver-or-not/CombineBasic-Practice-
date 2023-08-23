//
//  ContentView0.swift
//  Combine Demo
//
//  Created by Wonil Lee on 2023/08/23.
//

import Combine
import SwiftUI

struct ContentView0: View {
    @ObservedObject var combineModel = CombineModel0()
    
    var body: some View {
        VStack {
            // indicator
            Text(combineModel.allAreEven ?
                 "All Are Even." :
                    "Not All Are Even."
            )
            .font(.title2)
            
            Spacer()
                .frame(height: 150)
            
            // add buttons
            HStack {
                AddButtonView(combineModel: combineModel, order: 0)
                AddButtonView(combineModel: combineModel, order: 1)
                AddButtonView(combineModel: combineModel, order: 2)
            }
            
            Spacer()
                .frame(height: 50)
            
            // connect/disconnect button
            Button {
                if combineModel.evenStream == nil {
                    combineModel.connect()
                } else {
                    combineModel.disconnect()
                }
            } label: {
                Text(combineModel.evenStream == nil ? "Connect" : "Disconnect")
                    .font(.title2)
            }
            .buttonStyle(.borderedProminent)
            .tint(combineModel.evenStream == nil ? Color(red: 0.3, green: 0.7, blue: 0.8) : Color(red: 0.7, green: 0.2, blue: 0.7))
        }
    }
}

struct ContentView0_Previews: PreviewProvider {
    static var previews: some View {
         ContentView0()
    }
}
