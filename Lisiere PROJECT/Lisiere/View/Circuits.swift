import SwiftUI

struct Circuits: View {
    
    @State private var circuitSelectionne: Circuit? = circuitsParc1.first
    @State private var tousLesCircuits: [Circuit] = circuitsParc1 + circuitsParc2 + circuitsParc3 + circuitsParc4 + circuitsParc5 + circuitsParc6 + circuitsParc7 + circuitsParc8
    var circuit: [Circuit]
    // FILTRAGE DU TABLEAU POUR AFFICHER QUE LES CIRCUITS EN COURS/AFAIRE
    // Je vérifie si le statut de mon circuit actuel ($0) est différent de .termine
    
//    var circuitsDisponibles: [Circuit] {
//        tousLesCircuits.filter { $0.statut != .termine
//        }
//    }
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 10) {
                
                // SÉLECTION DU CIRCUIT
                
                Picker("Sélectionner un circuit", selection: $circuitSelectionne) {
                    ForEach(circuit, id: \.self) {
                        circuit in
                        Text(circuit.nomStr).tag(circuit)
                    }
                }
                .pickerStyle(.menu)
                .padding()
                .tint(.black)
                .onAppear {
                    circuitSelectionne = circuit.first
                }
                // CONDITION SI LES CIRCUITS SONT DÉJÀ TERMINÉS
                
                if circuitSelectionne?.statut == .termine {
                    
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.green)
                        Text("Circuit entièrement terminé,\r bravo !")
                            .font(.title)
                            .multilineTextAlignment(.center)

                        Text("Retrouvez vos randonnées dans l'historique.")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .padding(16)
                        // Le lien vers ton historique
                            NavigationLink(destination: Historique()) { // Remplace par le nom exact de ta vue
                                Text("Voir votre historique ")
                                    .font(.subheadline)
                                    .bold()
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .clipShape(Capsule())
                            }
                            .padding(.bottom)
                        
                    }
//                    .frame(width: 400, height: 200)
                    .padding(16)

                    .ignoresSafeArea()
                    Spacer()
                    Spacer()
                    
                } else {
                    
                    // LISTE DES CIRCUITS
                    
                    List {
                        if let circuit = circuitSelectionne {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(circuit.nomStr)
                                        .font(.headline)
                                    
                                    HStack(spacing: 14) {
                                        HStack(spacing: 4) {
                                            Image(systemName: "calendar")
                                            Text(circuit.date)
                                        }
                                    }
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                // AFFICHAGE CIRCUIT EN COURS
                                if circuit.statut == .enCours {
                                    NavigationLink(destination: PointDinterets(circuit: circuit)) {
                                        Spacer()
                                        Spacer()
                                        HStack(spacing: 4) {
                                            Circle()
                                                .fill(Color.orange)
                                                .frame(width: 8, height: 8)
                                            Text("En cours")
                                                .font(.callout)
                                                .bold()
                                                .foregroundColor(.orange)
                                            
                                        }
                                        
//                                        .padding(.horizontal)
//                                        .padding(.vertical)
//                                        .background(Color.orange)
//                                        .clipShape(Capsule())
                                    }
                                    
                                } else {
                                    
                                    // NAVIGATION VERS POINTS D'INTERETS
                                    
                                    NavigationLink(destination: PointDinterets(circuit: circuit)) {
                                        Spacer()
                                        Spacer()
                                        HStack() {
                                            Image(systemName: "play.fill")
                                            Text("J'y vais !")
                                        }
                                        .font(.callout)
                                        .bold()
                                        .foregroundColor(.green)
//                                        .padding(.horizontal)
//                                        .padding(.vertical)
//                                        .background(Color.green)
//                                        .clipShape(Capsule())
                                        
                                    }
                                }
                            }
                            .padding(.vertical)
                            
                        }
                    }
                    //changer la couleur de la liste
                    .scrollContentBackground(.hidden)
                    //Style standard d'iphone
                    .listStyle(.insetGrouped)
                    
                }
                
                
            }
            
            //FIN VSTACK
            
            .bold()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.accentColor.opacity(0.2))
            .ignoresSafeArea(edges: .bottom)
        }
        
        //FIN NAVIGATION STACK
    }
    }

#Preview {
    Circuits(circuit: circuitsParc1)
}
