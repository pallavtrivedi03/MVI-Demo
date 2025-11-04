//
//  CounterReducer.swift
//  CounterApp
//
//  Created by Pallav Trivedi on 31/10/25.
//

import Foundation

struct Effect {
    // A unique identifier for debugging
    let id: UUID = UUID()
    // A closure that performs async work and optionally sends back an Intent via the provided callback
    let run: (@escaping (CounterIntent) -> Void) -> Void
}


func counterReducer(state: CounterState, intent: CounterIntent) -> (CounterState, [Effect]) {
    var newState = state
    var effects: [Effect] = []

    switch intent {
    case .increment:
        newState.count += 1

    case .decrement:
        newState.count -= 1

    case .reset:
        newState.count = 0

    case .incrementAfterDelay(let seconds):
        newState.isLoading = true
        let effect = Effect { callback in
            DispatchQueue.global().asyncAfter(deadline: .now() + seconds) {
                callback(.didFinishIncrement)
            }
        }
        effects.append(effect)

    case .didFinishIncrement:
        newState.isLoading = false
        newState.count += 1
    }

    return (newState, effects)
}
