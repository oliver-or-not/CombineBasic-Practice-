//
//  CombineModel1.swift
//  Combine Demo
//
//  Created by Wonil Lee on 2023/08/23.
//

import Combine
import Foundation

class CombineModel1: ObservableObject {
    @Published var input: String = ""
    @Published var inputLength: Int = 0
    
    var lengthPublisher: AnyPublisher<Int, Never> {
        $input
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .map { $0.count }
            .eraseToAnyPublisher()
    }
    
    var cancellables = Set<AnyCancellable>()
    
    func connect() {
        $input
            .debounce(for: .seconds(1.5), scheduler: RunLoop.main)
            .map { $0.count }
            .assign(to: \.inputLength, on: self)
            .store(in: &cancellables)
    }
    
    func disconnect() {
        cancellables.forEach { cancellable in
            cancellable.cancel()
        }
        cancellables.removeAll()
    }
    
    init() {
        connect()
    }
}




