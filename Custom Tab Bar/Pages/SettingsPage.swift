//
//  SettingsPage.swift
//  SettingsPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct SettingsPage: View {
    
    @Binding var roundedTabBar: Bool
    
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            NavigationView {
                ZStack {
                    GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
                    ScrollView {
                        Toggle("Floating Tab Bar", isOn: $roundedTabBar)
                            .padding()
                            .background(.ultraThinMaterial)
                            .cornerRadius(15)
                            .padding()
                            .foregroundColor(.white)
                    }
                } .navigationTitle("Settings")
            }
        } .background(GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5)))
    }
}
