//
//  AddButtonView.swift
//  Combine Demo
//
//  Created by Wonil Lee on 2023/08/23.
//

import SwiftUI

struct AddButtonView: View {
    @ObservedObject var combineModel: CombineModel0
    var order: Int
    
    var body: some View {
            switch order {
                case 0:
                    VStack {
                        Text("x: \(combineModel.fountain0)")
                            .font(.title2)
                        Button {
                            combineModel.fountain0 += 1
                        } label: {
                            Text("x += 1")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.8, green: 0.5, blue: 0.6))
                    }
                case 1:
                    VStack {
                        Text("y: \(combineModel.fountain1)")
                            .font(.title2)
                        Button {
                            combineModel.fountain1 += 1
                        } label: {
                            Text("y += 1")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.6, green: 0.8, blue: 0.5))
                    }
                case 2:
                    VStack {
                        Text("z: \(combineModel.fountain2)")
                            .font(.title2)
                        Button {
                            combineModel.fountain2 += 1
                        } label: {
                            Text("z += 1")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.5, green: 0.6, blue: 0.8))
                    }
                default:
                    EmptyView()
            }
    }
}

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AddButtonView(combineModel: CombineModel0(), order: 0)
            AddButtonView(combineModel: CombineModel0(), order: 1)
            AddButtonView(combineModel: CombineModel0(), order: 2)
        }
    }
}
