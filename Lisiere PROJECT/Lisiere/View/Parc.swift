//
//  Accueil.swift
//  Lisiere
//
//  Created by Apprenant178 on 18/06/2026.
//

import SwiftUI
//ÉCRAN D'ACCEUIL
//Affichage 8 parcs de France
struct Accueil: View {
    
    //Liste des parcs depuis le fichier "socle commun"
    let parcs: [Parc] = tousLesParcs
    
    //Texte de l'utilisateur saisi dans la barre de recherche
    @State private var recherche: String = ""
    
    //Conditionnelle : retourne dans tous les parcs si la recherche est vide, sinon filtre par nom.
    var parcsFiltres: [Parc] {
        
        //Si la barre est vide retourne dans tous les parcs.
        if recherche.isEmpty {
            return parcs
            
            //Si non on va filtrer par nom (.contains).
        } else {
            return parcs.filter {
                
                //$0 représente chaque parc de la liste
                $0.nom.contains(recherche)
            }
        }
    }
    
    var body: some View {
        
        //Navigation vers l'écran "Parc_Choisi".
        NavigationStack {
            
            //Vertical : alignement à gauche sans espacement
            VStack() {
                
                
                //TITRE.
                //Centré pour le titre et l'accroche.
                VStack() {
                    
                    //Titre de l'écran d'accueil.
                    Text("PARCS NATIONAUX DE FRANCE")
                        .font(.title2)
                    
                    //Texte avec deux lignes centrés.
                        .multilineTextAlignment((.center))
                    
                    //Couleur de texte choisi par le groupe
                        .foregroundColor(.black)
                        .bold()
                    Text("Peu importe où vous vous trouvez, vous avez forcément un Parc National à explorer.")
                        .padding(.bottom, 25)
                    
                    //Alignement du texte : centré
                        .multilineTextAlignment((.center))
                        .font(.body)
                }
                
                
                //Largeur à l'infini pour le VStack.
                .frame(maxWidth: .infinity)
                //Espacement autour du bloc du titre.
                .padding(.vertical, 8)

                //Barre de recherche,loupe, parcs et micro
                //Horizontal : barre de recherche
                HStack() {
                    
                    //Îcone loupe (SF Symbols)
                    Image(systemName: "magnifyingglass")
                    
                    //Couleur : gris
                        .foregroundColor(.gray)
                    
                    //Taille : 16
                        .font(.system(size: 16))
                        .padding(.leading)
                    
                    //Le signe $ créé devant @state met en place le lien bidirectionnel : l'utilisateur tape la recherche, TextField met à jour cette recherche et la liste filtée automatiquement est rafraîchie.
                    TextField("Parcs", text: $recherche)
                    
                    //Îcone micro (SF Symbols).
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(.trailing)
                    
                }
                
                // Espace autour du HStack.
                .padding(.vertical, 6)
                
                //Couleur de fond de la barre de recherche.
                .background(Color(.white))
                
                // Coins arrondis.
                .cornerRadius(16)
                
                //Marges horizontal.
                .padding(.horizontal, 20)
                
              
                
                //La LISTE DES PARCS
                //Liste des parcs avec mise à jour
                List(parcsFiltres) { parc in
                    
                    //Quand tu cliques sur une ligne -» Parc_Choisi.
                    NavigationLink(destination: Parc_Choisi(parc: parc)) {
                        
                        HStack() {
                            
                            //Chaque image de parc est choisie depuis Assets(Dossier : parc.image)
                            //Les images sont redimentionnées
                            Image(parc.image)
                                .resizable()
                                .scaledToFill()
                            //Taile de l'image
                                .frame(width: 70, height: 70)
                                .clipped()
                                .cornerRadius(10)
                            
                                .padding(.trailing)
                            //Infos parc
                            //Alignement du texte à gauche.
                            VStack(alignment: .leading, spacing: 3) {
                                
                                //Nom du parc depuis "socle commun".
                                Text("\(parc.nom)")
                                    .bold()
                                
                                //Police : taille
                                    .font(.system(size: 15))
                                
                                //Horaires d'accès parc.
                                Text("\(parc.horaires)")
                                    .font(.system(size: 14))
                                
                                Text("\(parc.region)")
                                    .font(.system(size: 14))
                            }
                            
                        }
                        
                    }

                    
                }
                .scrollContentBackground(.hidden)
            }
            .background(Color.accentColor.opacity(0.2))
            
        }
        
    }
    
}
//Apperçu écran (Xcode)
#Preview {
    Accueil()
}
