//
//  SettingsPage.swift
//  SettingsPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct SettingsPage: View {
    
    @Binding var roundedTabBar: Bool
    @Binding var hideTabBar: Double
    
    var body: some View {
        ZStack {
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
                    ScrollView {
                        VStack {
                        Toggle("Floating Tab Bar", isOn: $roundedTabBar)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .padding()
                            .foregroundColor(.white)
                            .padding(.bottom, 1000)
                        Text("Fun Text for Testing Tab Bar Hider")
                        }
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
                } .navigationTitle("Settings")
            }
        } .background(GradientBackground())
    }
}
