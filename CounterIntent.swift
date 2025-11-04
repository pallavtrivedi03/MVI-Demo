//
//  CounterIntent.swift
//  CounterApp
//
//  Created by Pallav Trivedi on 31/10/25.
//

import Foundation

enum CounterIntent {
    case increment
    case decrement
    case reset
    case incrementAfterDelay(seconds: TimeInterval) // demonstrates effects
    case didFinishIncrement // action from an effect
}
