//
//  SimpleReducer.swift
//  ReducerTutorial
//
//  Created by Tarek Ghazi on 6/23/20.
//  Copyright © 2020 Tarek Ghazi. All rights reserved.
//

import Foundation

protocol Action {}

protocol Status {}

typealias Reducer = (_ action: Action, _ state: Status) -> Status

protocol StoreSubscriber {
    func newState(state: Status)
}

class Store {
    let reducer: Reducer
    var state: Status?
    var subscribers: [StoreSubscriber] = []
    
    init(reducer: @escaping Reducer, state: Status?) {
        self.reducer = reducer
        self.state = state
    }
    
    func dispatch(action: Action) {
        state = reducer(action, state!)
        subscribers.forEach{subscriber in subscriber.newState(state: state!)}
    }
    
    func subscribe(_ newSubscriber: StoreSubscriber) {
        subscribers.append(newSubscriber)
    }
}


