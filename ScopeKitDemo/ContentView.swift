//
//  ContentView.swift
//  ScopeKitDemo
//
//  Created by Alex Nagy on 25.05.2026.
//

import SwiftUI
import ScopeKit

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
            ScopeView(ObservableViewModel.self) { viewModel, _ in
                Button {
                    viewModel.count += 1
                    print("Did tap Observable: \(viewModel.count)")
                } label: {
                    Text(viewModel.text)
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            
            ScopeView(ObservableViewModel.self) { _ , projected in
                TextField("Text", text: projected.text)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding()
        .background { Color.random() }
        .onChange(of: \.count, in: ObservableViewModel.self) { oldValue, newValue in
            print("Count changed form \(oldValue) to \(newValue)")
        }
    }
}

// MARK: - ObservableObject

struct ObservableObjectView: View {
    var body: some View {
        VStack {
            ScopeView(ObservableObjectViewModel.self) { viewModel, _ in
                Button {
                    viewModel.count += 1
                    print("Did tap Observable: \(viewModel.count)")
                } label: {
                    Text(viewModel.text)
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            
            ScopeView(ObservableObjectViewModel.self) { _ , projected in
                TextField("Text", text: projected.text)
                    .textFieldStyle(.roundedBorder)
            }
        }
        .padding()
        .background { Color.random() }
        .onChange(of: \.count, in: ObservableObjectViewModel.self) { oldValue, newValue in
            print("Count changed form \(oldValue) to \(newValue)")
        }
        .onReceive(of: \.$count, in: ObservableObjectViewModel.self) { newValue in
            print("Count received: \(newValue)")
        }
    }
}
