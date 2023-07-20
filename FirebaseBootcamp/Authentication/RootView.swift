//
//  RootView.swift
//  FirebaseBootcamp
//
//  Created by Artem on 20.07.2023.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSighnInView: Bool = false
    var body: some View {
        ZStack {
            NavigationStack {
                SettingsView(showSignInView: $showSighnInView)
            }
        }
        .onAppear {
            let authuser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSighnInView = authuser == nil 
        }
        .fullScreenCover(isPresented: $showSighnInView) {
            NavigationStack {
                AuthenticationView()
            }
      
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
