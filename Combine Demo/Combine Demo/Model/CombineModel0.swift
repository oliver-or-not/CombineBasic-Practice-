//
//  CombineModel0.swift
//  Combine Demo
//
//  Created by Wonil Lee on 2023/08/23.
//

import Combine
import Foundation

class CombineModel0: ObservableObject {
    @Published var fountain0: Int = 0
    @Published var fountain1: Int = 0
    @Published var fountain2: Int = 0
    @Published var allAreEven: Bool = true
    
    var evenPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3($fountain0, $fountain1, $fountain2)
            .map {
                if $0.isMultiple(of: 2)
                    && $1.isMultiple(of: 2)
                    && $2.isMultiple(of: 2) {
                    return true
                } else {
                    return false
                }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    // @Published property wrapper here is not necessary for streaming
    // added @Published to morph button
    @Published var evenStream: AnyCancellable?
    
    func connect() {
        self.evenStream = evenPublisher
            .assign(to: \.allAreEven, on: self)
    }
    
    func disconnect() {
        evenStream = nil
    }
    
    init() {
        connect()
    }
}



