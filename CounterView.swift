//
//  CounterView.swift
//  CounterApp
//
//  Created by Pallav Trivedi on 31/10/25.
//

import SwiftUI

struct CounterView: View {
    @ObservedObject var store: CounterStore

    var body: some View {
        VStack(spacing: 16) {
            Text("Count: \(store.state.count)")
                .font(.largeTitle)

            if store.state.isLoading {
                ProgressView()
            }

            HStack {
                Button("-") {
                    store.send(.decrement)
                }
                Button("Reset") {
                    store.send(.reset)
                }
                Button("+") {
                    store.send(.increment)
                }
            }

            Button("Increment after 2s") {
                store.send(.incrementAfterDelay(seconds: 2))
            }
        }
        .padding()
    }
}
