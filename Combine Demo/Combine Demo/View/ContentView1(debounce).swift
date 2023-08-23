//
//  ContentView1.swift
//  Combine Demo
//
//  Created by Wonil Lee on 2023/08/23.
//

import Combine
import SwiftUI

struct ContentView1: View {
    @ObservedObject var combineModel = CombineModel1()
    
    var body: some View {
        TextField("Input text.", text: $combineModel.input)
            .font(.title2)
            .frame(width: 250)
            .padding(10)
            .border(Color(red: 0.7, green: 0.7, blue: 0.85), width: 2)
        Spacer()
            .frame(height: 100)
        Text("Length: \(combineModel.inputLength)")
            .font(.title2)
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}



