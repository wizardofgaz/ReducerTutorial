//
//  ContentView.swift
//  ReducerTutorial
//
//  Created by Tarek Ghazi on 6/23/20.
//  Copyright © 2020 Tarek Ghazi. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @ObservedObject private var controller: ContentViewController = ContentViewController()
    
    var body: some View {
        HStack {
            Button(action: {
                self.controller.store.dispatch(action: self.controller._increaseAction)
            }, label: {
                Text("+")
                })

            Text(String(controller.appState.counter))

            Button(action: {
                self.controller.store.dispatch(action: self.controller._decreaseAction)
            }, label: {
                Text("-")
                })

        }.frame(width: 600, height: 800)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
