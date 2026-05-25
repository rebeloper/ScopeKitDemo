//
//  ViewModels.swift
//  ScopeKitDemo
//
//  Created by Alex Nagy on 25.05.2026.
//

import SwiftUI
import Combine

@Observable
@MainActor
final class ObservableViewModel {
    var text: String = "@Observable"
    var count: Int = 0
}

@MainActor
class ObservableObjectViewModel: ObservableObject {
    @Published var text: String = "ObservableObject"
    @Published var count: Int = 0
}
