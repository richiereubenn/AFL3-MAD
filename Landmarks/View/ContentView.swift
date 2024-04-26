//
//  ContentView.swift
//  Landmarks
//
//  Created by MacBook Pro on 18/04/24.
//

import SwiftUI


struct ContentView: View {
    @State private var selection: Tab = .list


    enum Tab {
        case featured
        case list
    }

    //add navigation between section
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)


            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
