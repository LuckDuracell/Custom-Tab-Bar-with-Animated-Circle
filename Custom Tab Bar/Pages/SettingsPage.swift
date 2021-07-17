//
//  SettingsPage.swift
//  SettingsPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct SettingsPage: View {
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            NavigationView {
                ZStack {
                    GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
                } .navigationTitle("Settings")
            }
        }
    }
}

struct SettingsPage_Previews: PreviewProvider {
    static var previews: some View {
        SettingsPage()
    }
}
