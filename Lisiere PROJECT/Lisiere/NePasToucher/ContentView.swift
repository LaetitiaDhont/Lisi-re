//
//  ContentView.swift
//  Lisiere
//
//  Created by apprenant133 on 17/06/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Accueil()
                .tabItem {
                    Label("Parcs", systemImage: "map.circle")
                }
            
            Historique()
                .tabItem{
                    Label("Historique", systemImage: "book.circle")
                }
          ProfileView()
              .tabItem{
                    Label("Profil", systemImage: "person.crop.circle")
                }
        }
    }
}

#Preview {
    ContentView()
}
