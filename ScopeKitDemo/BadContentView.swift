//
//  BadContentView.swift
//  ScopeKitDemo
//
//  Created by Alex Nagy on 25.05.2026.
//

import SwiftUI

struct BadContentView: View {
    @State private var observableViewModel = ObservableViewModel()
    @StateObject private var observableObjectViewModel = ObservableObjectViewModel()

    var body: some View {
        VStack {
            BadObservableView()
            BadObservableObjectView()
        }
        .environment(observableViewModel)
        .environmentObject(observableObjectViewModel)
    }
}

#Preview {
    BadContentView()
}

// MARK: - @Observable (bad)
// ❌ @Environment used directly in the view that owns the background.
//    Reading viewModel.text in Text() registers a dependency here →
//    the whole view re-renders when text changes (typing in TextField).
//    .onChange(of: viewModel.count) registers count as a dependency here →
//    the whole view re-renders when count changes (button tap).

struct BadObservableView: View {
    @Environment(ObservableViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            Button {
                viewModel.count += 1
                print("Did tap Observable: \(viewModel.count)")
            } label: {
                Text(viewModel.text)
                    .foregroundStyle(.white)
                    .bold()
            }
            .onChange(of: viewModel.count) { oldValue, newValue in
                print("Count changed from \(oldValue) to \(newValue)")
            }
            TextField("Text", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .background { Color.random() }
    }
}

// MARK: - ObservableObject (bad)
// ❌ @EnvironmentObject subscribes this view to objectWillChange.
//    Any @Published change — whether count (button tap) or text
//    (typing in TextField) — fires objectWillChange and re-renders
//    the entire view.

struct BadObservableObjectView: View {
    @EnvironmentObject private var viewModel: ObservableObjectViewModel

    var body: some View {
        VStack {
            Button {
                viewModel.count += 1
                print("Did tap Observable Object: \(viewModel.count)")
            } label: {
                Text(viewModel.text)
                    .foregroundStyle(.white)
                    .bold()
            }
            .onChange(of: viewModel.count) { oldValue, newValue in
                print("Count changed from \(oldValue) to \(newValue)")
            }
            TextField("Text", text: $viewModel.text)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
        .background { Color.random() }
    }
}
