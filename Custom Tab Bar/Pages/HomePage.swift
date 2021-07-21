//
//  HomePage.swift
//  HomePage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct HomePage: View {
    
    @Binding var hideTabBar: Double
    
    var body: some View {
        ZStack {
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
                    ScrollView {
                        VStack {
                            HStack {
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width*0.1, alignment: .leading)
                                Text("Saw someone on Twitter showing off a fun Tab Bar like this, and wanted to see if I could make one like it on my own.")
                                    .padding(.top, 50)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                Spacer()
                                    .frame(width: UIScreen.main.bounds.width*0.1, alignment: .trailing)
                            }
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
                        .edgesIgnoringSafeArea(.horizontal)
                    }
                    .coordinateSpace(name: "scroll")
                } .navigationTitle("Home")
            }
        } .background(GradientBackground())
    }
}


struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
