//
//  ContentView.swift
//  Custom Tab Bar
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    @State var views = [viewLabel(icon: "house.fill", name: "Home"), viewLabel(icon: "flame.fill", name: "Trending"), viewLabel(icon: "bell.fill", name: "Notifications"), viewLabel(icon: "gear", name: "Settings")]
    
    var body: some View {
        ZStack {
            GradientBackground()
            //CustomTabBar()
            UniqueTabBar(views: $views)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
