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
    @State var circlePadding2: Double = -135
    
    @State var roundedTabBar = false
    
    var body: some View {
        ZStack {
            GradientBackground(color1: .pink.opacity(0.8), color2: .purple.opacity(0.5))
            
            if view1 {
                withAnimation {
                    HomePage()
                        .onAppear {
                            withAnimation {
                                circlePadding = -133
                                circlePadding2 = -133
                            }
                        }
                }
            }
            if view2 {
                withAnimation {
                    TrendingPage()
                        .onAppear {
                            withAnimation {
                                circlePadding = -66
                                circlePadding2 = -66
                            }
                        }
                }
            }
            if view3 {
                withAnimation {
                    NotificationsPage()
                        .onAppear(perform: {
                            withAnimation {
                                circlePadding = 63
                                circlePadding2 = 63
                            }
                        })
                }
            }
            if view4 {
                withAnimation {
                    SettingsPage(roundedTabBar: $roundedTabBar)
                        .onAppear(perform: {
                            withAnimation {
                                circlePadding = 228
                                circlePadding2 = 228
                            }
                        })
                }
            }
        } .overlay(alignment: .bottom, content: {
            ZStack {
                
                Circle()
                    .padding(.top, 10)
                    .frame(width: 60, height: 60, alignment: .center)
                    .padding(.leading, roundedTabBar ? (view1||view2 ? circlePadding2 - 20 : circlePadding2) : (view1||view2 ? circlePadding - 20 : circlePadding))
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
                                .font(.system(size: 10))
                        } .accentColor(view1 ? .pink : Color(.gray))
                            .padding(.horizontal, 12)
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
                                .font(.system(size: 10))
                        }
                        .accentColor(view2 ? .pink : Color(.gray))
                        .padding(.horizontal, 12)
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
                                .font(.system(size: 10))
                        } .accentColor(view3 ? .pink : Color(.gray))
                            .padding(.horizontal, 12)
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
                                .font(.system(size: 10))
                        } .accentColor(view4 ? .pink : Color(.gray))
                            .padding(.horizontal, 12)
                    }
                }
                .padding(.bottom, roundedTabBar ? 0 : 30)
                .edgesIgnoringSafeArea(.all)
                .frame(width: roundedTabBar ? UIScreen.main.bounds.width - 20 : UIScreen.main.bounds.width, height: roundedTabBar ? 70 : 110, alignment: .center)
                .background(.ultraThinMaterial)
                .cornerRadius(roundedTabBar ? 15 : 0)
                .padding(.bottom, roundedTabBar ? 0 : -40)
                
                
                Rectangle()
                    .frame(width: 25, height: 7, alignment: .top)
                    .cornerRadius(5)
                    .foregroundColor(.pink)
                    .padding(.bottom, 70)
                    .padding(.leading, roundedTabBar ? circlePadding2 : circlePadding)
                
                
            }
            .edgesIgnoringSafeArea(.all)
        })
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar()
    }
}
