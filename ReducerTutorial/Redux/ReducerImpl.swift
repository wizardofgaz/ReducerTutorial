//
//  ReducerImpl.swift
//  ReducerTutorial
//
//  Created by Tarek Ghazi on 6/23/20.
//  Copyright © 2020 Tarek Ghazi. All rights reserved.
//

import Foundation

struct AppState: Status {
    var counter: Int = 0
}

struct IncreaseAction: Action {
    let increaseBy: Int
}

struct DecreaseAction: Action {
    let decreaseBy: Int
}

func appReducer(_ action: Action, _ state: Status?) -> Status {
    var newState: AppState = state as? AppState ?? AppState()
    
    switch action {
    case let action as IncreaseAction:
        newState.counter += action.increaseBy
    case let action as DecreaseAction:
        newState.counter -= action.decreaseBy
    default:
        break
    }
    
    return newState
}
