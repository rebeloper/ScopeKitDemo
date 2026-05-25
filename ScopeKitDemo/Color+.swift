//
//  Color+.swift
//  ScopeKitDemo
//
//  Created by Alex Nagy on 25.05.2026.
//

import SwiftUI

extension Color {
    static func random() -> Color {
        Color(hue: .random(in: 0...1), saturation: 0.7, brightness: 0.9)
    }
}
