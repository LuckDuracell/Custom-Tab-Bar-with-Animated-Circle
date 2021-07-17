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
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
                    ScrollView {
                        
                    }
                } .navigationTitle("Trending")
            }
        } .background(GradientBackground())
    }
}

struct TrendingPage_Previews: PreviewProvider {
    static var previews: some View {
        TrendingPage()
    }
}
