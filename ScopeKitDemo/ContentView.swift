//
//  ContentView.swift
//  ScopeKitDemo
//
//  Created by Alex Nagy on 25.05.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var observableViewModel = ObservableViewModel()
    @StateObject private var observableObjectViewModel = ObservableObjectViewModel()

    var body: some View {
        VStack {
            ObservableView()
            ObservableObjectView()
        }
        .environment(observableViewModel)
        .environmentObject(observableObjectViewModel)
    }
}
#Preview {
    ContentView()
}

// MARK: - @Observable

struct ObservableView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
        .background { Color.random() }
    }
}

// MARK: - ObservableObject

struct ObservableObjectView: View {
    var body: some View {
        VStack {
            
        }
        .padding()
        .background { Color.random() }
    }
}
