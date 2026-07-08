import SwiftUI

struct ProfileView: View {

    // Couleur des boutons
    let buttonColor = Color(
        red: 169/255,
        green: 208/255,
        blue: 154/255
    ) // #A9D09A

    var body: some View {

        ZStack {
            Color.white
                .ignoresSafeArea()

            VStack {

                // Titre
                Text("Profil")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.top)

                Spacer()

                // Photo de profil
                Image("MartinParadis")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 160)
                    .clipShape(Circle())
                    .shadow(
                        color: .black.opacity(0.15),
                        radius: 6,
                        x: 0,
                        y: 4
                    )

                Spacer()

                // Informations utilisateur
                ProfileField(title: "Nom : Paradis")

                ProfileField(title: "Prénom : Martin")

                ProfileField(title: "Date de naissance : 09/06/1963")

                Spacer()

                // Bouton Modifier
                Button(action: {

                }) {
                    Text("Modifier")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 220, height: 55)
                        .background(buttonColor)
                        .clipShape(Capsule())
                }

                Spacer()

// Bouton Voir les badges
                Button(action: {

                }) {
                    Text("Voir les badges")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 220, height: 55)
                        .background(buttonColor)
                        .clipShape(Capsule())
                }

                Spacer()
            }
            .padding()
        }
    }
}

struct ProfileField: View {

    let title: String

    var body: some View {

        HStack {

            Text(title)
                .foregroundColor(.black)
                .font(.title3)

            Spacer()
        }
        .padding(.horizontal, 25)
        .frame(height: 65)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 35)
                .stroke(Color.gray.opacity(0.25), lineWidth: 1)
        )
        .cornerRadius(35)
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    ProfileView()
}
