//
//  UniqueTabBar.swift
//  UniqueTabBar
//
//  Created by Luke Drushell on 7/17/21.
//

import SwiftUI

struct UniqueTabBar: View {
    
    @Binding var views: [viewLabel]
    
    @State var shownView = [true, false, false, false]
    
    @State var roundedTabBar = true
    
    @State var circleX: Float = 55
    
    @State var delayViews = false
    
    @State var hideTabBar = 0.865
    
    var body: some View {
        ZStack {
            //Views
            GradientBackground()
            if shownView[0] {
                HomePage(hideTabBar: $hideTabBar)
            } else if shownView[1] {
                TrendingPage(hideTabBar: $hideTabBar)
            } else if shownView[2] {
                NotificationsPage(hideTabBar: $hideTabBar)
            } else {
                SettingsPage(roundedTabBar: $roundedTabBar, hideTabBar: $hideTabBar)
            }
        } .edgesIgnoringSafeArea(.all)
            .overlay (
            //Tab Bar
                ZStack {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.pink)
                        .offset(x: CGFloat(circleX-186))
                        .animation(.easeInOut, value: 1)
                    HStack {
                        ForEach(views.indices, content: { index in
                            Button {
                                
                                if delayViews == false {
                                    shownView = [false, false, false, false]
                                    shownView[index] = true
                                    switch index {
                                    case 0:
                                        withAnimation {
                                            circleX = 55
                                        }
                                    case 1:
                                        withAnimation {
                                            circleX = 142.5
                                        }
                                    case 2:
                                        withAnimation {
                                            circleX = 230
                                        }
                                    default:
                                        withAnimation {
                                            circleX = 318
                                        }
                                    }
                                    delayViews = true
                                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                                        delayViews = false
                                    })
                                }
                            } label: {
                                VStack {
                                    Image(systemName: views[index].icon)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24, alignment: .center)
                                        .padding(.horizontal, 28)
                                    Text(views[index].name)
                                        .font(.system(size: 10))
                                } .accentColor(shownView[index] ? .pink : .gray)
                            }
                        })
                    }
                    .padding(.top)
                    .frame(width: roundedTabBar ? UIScreen.main.bounds.width*0.95 : UIScreen.main.bounds.width, height: roundedTabBar ? 75 : 130, alignment: .top)
                    .background(.ultraThinMaterial)
                    .cornerRadius(roundedTabBar ? 15 : 0)
                    .padding(.bottom, roundedTabBar ? 0 : -55)
                    
                    
                    Rectangle()
                        .frame(width: 40, height: 4)
                        .foregroundColor(.pink)
                        .cornerRadius(10)
                        .offset(x: CGFloat(circleX-186), y: -35)
                    
                } .position(x: (UIScreen.main.bounds.width/2), y: (UIScreen.main.bounds.height * hideTabBar))
                .animation(.easeIn, value: 1)
            )
    }
}

struct viewLabel: Hashable {
    let icon: String
    let name: String
    let id = UUID()
}
