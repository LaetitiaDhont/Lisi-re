//
//  Parc Choisi.swift
//  Lisiere
//
//  Created by Apprenant178 on 18/06/2026.
//

import SwiftUI

struct Parc_Choisi: View {// Création de l'écran "Parc Choisi"
    
    var parc: Parc // Variable recevant les informations du parc sélectionné
    
    var body: some View {

        NavigationStack{ // Permet la navigation entre les différentes pages
            
            ZStack(alignment: .bottom) { // AJOUT pour le bouton flottant

            ScrollView { // Permet de faire défiler le contenu verticalement

                
//                  ===== SECTION PRÉSENTATION DU PARC =====
                
        VStack(alignment: .center,spacing: 16){//ouverture VStack 1
                Text(parc.nom)//Lien nom des parcs
                    .font(.title2)// Taille de police (du titre)
                    .bold()//Texte en gras
                    .foregroundColor(.black)//Couleur du texte


                    
                    Image(parc.image)//lien images des parcs
                        .resizable()// Autorise le redimensionnement de l'image
                        .scaledToFill() // Remplit le cadre sans déformer l'image
                        .frame(width: 350,height: 250) //Définit la taille du cadre de l'image
                    //  .frame(maxWidth: .infinity)
                        .clipped()// Coupe les parties dépassant du cadre
                        .padding(4)// Marge intérieure autour de l'image
                        .background(Color.accentColor)//Couleur du cadre
//                      .cornerRadius(15)//arrondire les pointes
                        .padding(.bottom,14) //Espace entre le texte et l'image
                    Text(.init(parc.description))//lien description des parcs
                        .multilineTextAlignment(.leading)// Alignement à gauche
                        .frame(maxWidth:.infinity, alignment: .leading)// Occupe toute la largeur
                    
                    Link( //Création d'un lien internet (des parcs)
                        "Site officiel du parc", //Texte cliquable affiché à l'écran
                        destination: URL(string: parc.lienOfficiel)! //Adresse web ouverte lors du clic
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)//Aligné à gauche
                    .italic() //Texte en Italic
                    .foregroundColor(Color.black)//Couleur du lien
                    
                }//fermeture de VStack 1
                .padding(.horizontal,18)
                .padding(.bottom,30)
                
                
//                  ===== SECTION INFORMATIONS DE SENSIBILISATION =====
                
                
//Partie Informations
    VStack ( spacing:16){ //Ouverture VStack 2
        VStack(spacing:16){//Ouverture VStack 3
                        
            Text("Pourquoi protéger ?")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity,alignment: .center)
                .foregroundColor(.black)

                        
            Text("""
                  Protéger, c’est préserver ce qui est essentiel à notre vie et à celle des générations futures. Que ce soit la nature, les autres ou nos valeurs, tout ce qui nous entoure peut être fragilisé. En protégeant, nous évitons les destructions irréversibles et nous garantissons un avenir plus sûr, plus juste et plus durable pour tous.
                  """)
    }//Fermeture VStack 3
        .padding(.horizontal,18)
        .padding(.bottom,16)
                    
   //Création d'un bandeau pour habiller la page :
                    
        VStack (alignment: .leading, spacing:12){//ouverture VStack 4
            Image("CO2")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, minHeight: 180, maxHeight: 180)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                        
            Text.init("""
                **Chaque arbre est une usine à oxygène.**
                En protégeant la nature, vous protégez l'air que nous respirons tous.
                Préservez notre avenire en respectant chaque feuille.
                """)
            .foregroundColor(.black)
        }//fermeture de VStack 4
            .padding(20) // marge intérieure haut/bas/gauche/droite, pour ne pas coller aux bords
            .frame(maxWidth: .infinity) // le bandeau prend toute la largeur disponible
            .background(Color.accentColor) //Couleur
            .ignoresSafeArea(edges: .horizontal)
            .padding(.bottom,14)
                    
   //Fermeture du bandeau
        
        VStack(alignment: .leading) {//ouverture VStack 5
            Text("Ce qu’il faut faire.")
                .font(.title3)
//              .frame(alignment: .leading)
                .bold()
            Text ("""
                Dans un parc naturel, il faut rester sur les sentiers et respecter les animaux. Il faut aussi garder le lieu propre en ramassant ses déchets.
                """)
    }//fermeture VStack 5
        .padding(.horizontal,18)
        .padding(.bottom, 16)
        
        TabView{//ouverture TabView (Ce qu’il faut faire.)
            Image("Randonnée")
                .resizable()
                .scaledToFill()
            Image("Poubelle")
                .resizable()
                .scaledToFill()
        }//fermeture TabView
        .tabViewStyle(.page(indexDisplayMode: .always))
        .frame(width: 350,height: 250)
        
        
                        
                            
       VStack(alignment: .leading) {//ouverture de VStack 6
           Text("Les conséquences.")
               .font(.title3)
               .bold()
           Text ("""
                Si les règles ne sont pas respectées, la nature peut être abîmée et polluée. Les animaux et les plantes risquent alors d’être en danger.
                """)
        }//fermeture de VStack 6
            .padding(16)
        
        TabView{//ouverture TabView (Les conséquences.)
            Image("pollution")
                .resizable()
                .scaledToFill()
            Image("Mort")
                .resizable()
                .scaledToFill()
            Image("Cigarette")
                .resizable()
                .scaledToFill()
            Image("Feu")
                .resizable()
                .scaledToFill()
        }//fermeture TabView
            .tabViewStyle(.page(indexDisplayMode: .always))
            .frame(width: 350,height: 250)
                        
    }//fermeture de VStack 2


                    
            }//fermeture de ScrollView

                
            .background(Color.accentColor.opacity(0.2))//fond de couleur
            
            NavigationLink(destination: Circuits(circuit: parc.circuits)) {

                Label("Voir les parcours",
                      systemImage: "figure.hiking.circle.fill")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                    .padding(16)
                    .background(Color.green)
                    .cornerRadius(30)
                    .shadow(radius: 4)

            }//fermeture de NavigationLink
            .padding(.bottom, 24)

        }//fermeture de ZStack
        }//fermeture de NavigationStack

    }//fermeture de body
}//fermeture de struct
    
    
    #Preview {
        Parc_Choisi(parc: tousLesParcs[0])
    }
