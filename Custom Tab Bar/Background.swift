//
//  Background.swift
//  Background
//
//  Created by Luke Drushell on 7/16/21.
//

import Foundation
import SwiftUI


struct GradientBackground: View {
    var body: some View {
        LinearGradient(colors: [.pink.opacity(0.8), .purple.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
