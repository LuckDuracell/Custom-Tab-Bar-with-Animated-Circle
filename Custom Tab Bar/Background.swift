//
//  Background.swift
//  Background
//
//  Created by Luke Drushell on 7/16/21.
//

import Foundation
import SwiftUI


struct GradientBackground: View {
    
    let color1: Color
    let color2: Color
    
    var body: some View {
        LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}
