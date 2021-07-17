//
//  TrendingPage.swift
//  TrendingPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct TrendingPage: View {
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            NavigationView {
                ZStack {
                    GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
                    ScrollView {
                        
                    }
                } .navigationTitle("Trending")
            }
        } .background(GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5)))
    }
}

struct TrendingPage_Previews: PreviewProvider {
    static var previews: some View {
        TrendingPage()
    }
}
