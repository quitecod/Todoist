//
//  sampleApp.swift
//  sample
//
//  Created by Paul, Debojyoti on 22/01/24.
//

import SwiftUI

@main
struct sampleApp: App {
    var body: some Scene {
        WindowGroup {
            
                LoginView(nowOnSignUpPage: false, title: "Log In", buttonText: "Login")
        }
    }
}
