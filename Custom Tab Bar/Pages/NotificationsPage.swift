//
//  NotificationsPage.swift
//  NotificationsPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct NotificationsPage: View {
    
    @Binding var hideTabBar: Double
    
    var body: some View {
        ZStack {
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
                    ScrollView {
                        VStack {
                            Text("Notifications Page")
                                .padding()
                                .padding(.bottom, 1000)
                            Text("Fun Text for Testing Tab Bar Hider")
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .background(GeometryReader {
                            Color.clear.preference(key: ViewOffsetKey.self,
                            value: -$0.frame(in: .named("scroll")).origin.y)
                        })
                        .onPreferenceChange(ViewOffsetKey.self) {
                            if $0 > 0.0 {
                                withAnimation {
                                    hideTabBar = 1
                                }
                            } else {
                                withAnimation {
                                    hideTabBar = 0.865
                                }
                            }
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width)
                } .navigationTitle("Notifications")
            }
        } .background(GradientBackground())
    }
}
