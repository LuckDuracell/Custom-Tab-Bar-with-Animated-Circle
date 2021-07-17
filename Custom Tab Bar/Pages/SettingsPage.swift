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
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
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
        } .background(GradientBackground())
    }
}
