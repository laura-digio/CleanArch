//
//  ContentView.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ListWireframe().view
                .navigationBarTitle("CleanArch")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
