//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct CustomTabBar: View {
    
    @State var view1 = true
    @State var view2 = false
    @State var view3 = false
    @State var view4 = false
    
    @State var circlePadding: Double = -155
    
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            
            if view1 {
                withAnimation {
                    HomePage()
                        .onAppear {
                            withAnimation {
                                circlePadding = -155
                            }
                        }
                }
            }
            if view2 {
                withAnimation {
                    TrendingPage()
                        .onAppear {
                            withAnimation {
                                circlePadding = -85.25
                            }
                        }
                }
            }
            if view3 {
                withAnimation {
                    NotificationsPage()
                        .onAppear(perform: {
                            withAnimation {
                                circlePadding = 75.25
                            }
                        })
                }
            }
            if view4 {
                withAnimation {
                    SettingsPage()
                        .onAppear(perform: {
                            withAnimation {
                                circlePadding = 255
                            }
                        })
                }
            }
        } .overlay(alignment: .bottom, content: {
            ZStack {
                
                Circle()
                    .padding(.top, 10)
                    .frame(width: 50, height: 50, alignment: .center)
                    .padding(.leading, circlePadding)
                    .foregroundColor(.pink)
                    .animation(.easeOut, value: 1)
                
                
                HStack {
                    Button {
                        view1 = true
                        view2 = false
                        view3 = false
                        view4 = false
                    } label: {
                        VStack {
                            Image(systemName: "house.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Home")
                                .font(.system(size: 15))
                        } .accentColor(view1 ? .pink : Color(.gray))
                            .padding(.horizontal, 8)
                    }
                    Button {
                        view1 = false
                        view2 = true
                        view3 = false
                        view4 = false
                    } label: {
                        VStack {
                            Image(systemName: "flame.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Trending")
                                .font(.system(size: 15))
                        } .accentColor(view2 ? .pink : Color(.gray))
                            .padding(.horizontal, 8)
                    }
                    Button {
                        view1 = false
                        view2 = false
                        view3 = true
                        view4 = false
                    } label: {
                        VStack {
                            Image(systemName: "bell.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Notifications")
                                .font(.system(size: 15))
                        } .accentColor(view3 ? .pink : Color(.gray))
                            .padding(.horizontal, 8)
                    }
                    Button {
                        view1 = false
                        view2 = false
                        view3 = false
                        view4 = true
                    } label: {
                        VStack {
                            Image(systemName: "gear")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22, height: 22, alignment: .center)
                            Text("Settings")
                                .font(.system(size: 15))
                        } .accentColor(view4 ? .pink : Color(.gray))
                            .padding(.horizontal, 8)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: 70, alignment: .center)
                .background(.ultraThinMaterial)
        }
        })
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
