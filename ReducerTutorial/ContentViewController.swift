//
//  ContentViewController.swift
//  ReducerTutorial
//
//  Created by Tarek Ghazi on 6/23/20.
//  Copyright © 2020 Tarek Ghazi. All rights reserved.
//

import Foundation

class ContentViewController: StoreSubscriber, ObservableObject {
    let store = Store(reducer: appReducer, state: nil)
    @Published var appState = AppState()
    var _increaseAction: Action = IncreaseAction(increaseBy: 1)
    var _decreaseAction: Action = DecreaseAction(decreaseBy: 2)
    
    init() {
        store.state = appState
        store.subscribe(self)
    }
    func newState(state: Status) {
        self.appState = state as! AppState
    }
}
