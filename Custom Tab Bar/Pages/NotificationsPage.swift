//
//  NotificationsPage.swift
//  NotificationsPage
//
//  Created by Luke Drushell on 7/16/21.
//

import SwiftUI

struct NotificationsPage: View {
    var body: some View {
        ZStack {
            GradientBackground()
            NavigationView {
                ZStack {
                    GradientBackground()
                    ScrollView {
                        
                    }
                } .navigationTitle("Notifications")
            }
        } .background(GradientBackground())
    }
}

struct NotificationsPage_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsPage()
    }
}
