//
//  Historique.swift
//  Lisiere
//
//  Created by Apprenant178 on 18/06/2026.
//

import SwiftUI

struct Historique: View {
    
    let tousLesCircuits = circuitsParc1 + circuitsParc2 + circuitsParc3 // Rassemble les tableaux
    
    let mesCircuits = profil.circuits
    
    var circuitsRecents: [Circuit] {
    var resultat: [Circuit] = []
        for circuitsRecent in mesCircuits {
            if circuitsRecent.statut == .enCours {
                resultat.append(circuitsRecent)
                return resultat
            }
        }
        return resultat
    }
    var circuitsTermines: [Circuit] {
    var resultat2: [Circuit] = []
        for circuitsTermine in mesCircuits {
            if circuitsTermine.statut == .termine {
                resultat2.append(circuitsTermine)
                return resultat2
            }
        }
        return resultat2
    }
    
    var body: some View {
        NavigationStack {             // navigation globale
            List {                    // Liste principale
              Text("Historique des circuits")
                    .padding(.horizontal, 50)
                    .font(.title2)
                    .bold()
                    .listRowBackground(Color.clear)
                
                if circuitsRecents.count > 0 {
                    Section("Circuits récents") { // 1ère Section
                        ForEach(circuitsRecents) { circuit in
                            
    NavigationLink(destination: PointDinterets(circuit: circuit)) {
        HStack {
                VStack(alignment: .leading, spacing: 4){
                        Text(circuit.nomStr)
                            .font(.headline)
                        Text(circuit.nomParc)
                        .foregroundColor(.secondary)
                        .bold()
                    Text(circuit.date)
                    }  // fermeture Vstack
                             Spacer()
                VStack(alignment: .trailing, spacing: 4){
//                        Text(circuit.date)
                    HStack {
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 8, height: 8)
                        Text(circuit.statut.rawValue)
                            .font(.callout)
                            .bold()
                            .foregroundColor(.orange)
                    } // fermeture HStack
                    .frame(maxWidth: .infinity, alignment: .trailing)
                                } // fermeture Vstack
                            }  // fermeture Hstack
                           }// NavigationLink fin
                        }  // fermeture ForEach
                    }  // fermeture section
                }  // fermeture conditions if
                
                if circuitsRecents.count > 0 {
                    Section("Cette année") { // 2ème section
                        ForEach(circuitsTermines) { circuit in
                            
    NavigationLink(destination: PointDinterets(circuit: circuit)) {
                    HStack{
                       VStack(alignment: .leading, spacing: 4){
                            Text(circuit.nomStr)
                                        .font(.headline)
                            Text(circuit.nomParc)
                            .foregroundColor(.secondary)
                            .bold()
                           Text(circuit.date)
                                } // fermeture vstack
                                Spacer()
                       VStack(alignment: .trailing, spacing: 4){
//                            Text(circuit.date)
                       HStack {
                         Circle()
                          .fill(Color.green)
                          .frame(width: 8, height: 8)
                         Text(circuit.statut.rawValue)
                          .font(.callout)
                          .bold()
                          .foregroundColor(.green)
                                } // fermeture Hstack
                       .frame(maxWidth: .infinity, alignment: .trailing)
                                } //fermeture Vstack
                            } // fermeture Hstack
                          } // fermeture Navigationlink
                        } // fermeture ForEach
                    } // fermeture section
                } // fermeture if
            }  // fermeture List
            .scrollContentBackground(.hidden)
            .background(Color.accentColor.opacity(0.2))
        } // fermeture NavigationStack
    } // fermeture Sruct H View
} // fermeture some View

#Preview {
Historique()
} // fermeture Preview
            
    

