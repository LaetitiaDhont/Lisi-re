import SwiftUI
import MapKit

struct PointDinterets: View {
    
    //@State var parcSelectionnee = tousLesParcs[0]
    
    @State private var circuitSelectionne: Circuit? = circuitsParc1.first
    @State var piSelectionne: PointInteret?
    var circuit: Circuit
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Points d'intérêts")
                .font(.title2)
            Spacer()
            Spacer()
            // PICKER & BOUTON LEGENDE
            HStack {
                // SÉLECTION DU CIRCUIT
                Picker("Sélectionner un circuit", selection: $circuitSelectionne) {
                    ForEach(tousLesCircuits, id: \.self) {
                        circuit in
                        Text(circuit.nomStr).tag(circuit)
                    }
                }
               .pickerStyle(.menu)
               .tint(.black)
               .bold()
                
                Spacer()
                
              
            }
            .padding()
            .tint(.black)
            
            // DÉBUT DE LA MAP DES POINTS D'INTERETS
            
           Map(selection: $piSelectionne) {
               ForEach(circuitSelectionne!.pointsInterets) { points in
                  Annotation(points.nom, coordinate: CLLocationCoordinate2D(latitude: points.latitude, longitude: points.longitude)) {
                      Circle()
                           .fill(.red)
                            .frame(width: 20, height: 20)
                  }
                  .tag(points)
               }
            }
          .clipShape(RoundedRectangle(cornerRadius: 20))
          .padding(.horizontal)
            
            // SELECTION CONDITIONNÉE DU POINT D'INTERET
            if let pi = piSelectionne {
                VStack(spacing: 22) {
                    
                    Text(pi.nom)
                        .font(.title3)
                        .bold()
                        .padding(.top)
                    
                    // CONSEILS ENVIRONNEMENTAUX
                    
                        HStack(spacing: 6) {
                            ForEach(pi.conseils, id: \.self) { conseil in
                                HStack(spacing: 4) {
                                    Image(systemName: conseil.icone)
                                        .foregroundColor(.green)
                                        .frame(width: 24)
                                    Text(conseil.rawValue)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                        }
                        .background(.white.opacity(0.2))
                        .padding(0.75)
                    
                    VStack {
                        // IMAGE DU POINT D'INTERET
                        
                        Image(pi.image)
//                            .resizable()
//                            .scaledToFill()
                            .frame(width: 350, height: 250)
                            .cornerRadius(6)
                    }
                    
                    HStack(alignment: .top, spacing: 12){
                        
                        // DESCRIPTION
                        
                        Text(pi.description)
                            .font(.body)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .background(.white.opacity(0.2))
                            .padding(0.75)
                      
                    }
                    
                        }
                        .font(.subheadline)
                        .bold()
                        .padding(.vertical, 4)
                
                    Spacer()
                    // BOUTON FERMER
                Button("Fermer") {
                        piSelectionne = nil
                    }
//                    .clipShape(Capsule())
                    .padding(.bottom)
                    .font(.title2)
                    .foregroundStyle(.red)
                    //.buttonStyle(.bordered)
                    .padding(.horizontal)
                    .padding(.vertical)
                    
                }
             else {
                VStack {
                    Spacer()
                    Text("Touchez un point sur la carte pour en apprendre plus")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding()
                    Spacer()
                }
                .frame(maxHeight: 150)
            }
        }
        //.navigationTitle(parcSelectionnee.nom)
       // .navigationBarTitleDisplayMode(.inline)
        .tint(.black)
        .background(Color.accentColor.opacity(0.2))
    }
}

#Preview {
    NavigationStack {
        PointDinterets(circuit: tousLesParcs[0].circuits[0])
    }
}
