//
//  HomePage.swift
//  HomePage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            NavigationView {
                ZStack {
                    GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
                    ScrollView {
                        Text("Yoinked the entire tab bar design from @MengTo on Twitter")
                            .padding(.top, 50)
                        HStack {
                            Image("twitterIcon")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 28, height: 28, alignment: .center)
                                .foregroundColor(.blue)
                                .padding(-5)
                            Link("@MengTo", destination: URL(string: "https://twitter.com/mengto")!)
                        }
                        .padding()
                        .padding(.horizontal, 40)
                        .background(.regularMaterial)
                        .cornerRadius(15)
                        .padding()
                    } .padding(.horizontal)
                } .navigationTitle("Home")
            }
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
