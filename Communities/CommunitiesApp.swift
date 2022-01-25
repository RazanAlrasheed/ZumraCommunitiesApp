//
//  CommunitiesApp.swift
//  Communities
//
//  Created by Razan bin rashed on 16/06/1443 AH.
//

import SwiftUI

class User : ObservableObject {
    @Published var IsLogin : Bool
    init(IsLogin : Bool){
        self.IsLogin = IsLogin
    }
}
@main
struct CommunitiesApp: App {
    @StateObject var user = User(IsLogin: true )
  
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(user)
        }
    }
}
