# 🌲 Lisière

> Le guide immersif des parcs nationaux pour explorer, découvrir et protéger notre patrimoine naturel.

Développé en seulement **4 semaines** dans le cadre de l'**Apple Foundation Program**, **Lisière** est un prototype d'application mobile iOS conçu pour guider les randonneurs tout en les sensibilisant à la fragilité des écosystèmes qu'ils traversent.

---

## 💡 Le Concept

Flâner dans un parc national, c'est bien. Comprendre son écosystème et savoir comment le préserver, c'est mieux. **Lisière** fait le pont entre l'aventure et l'éco-citoyenneté. À travers des circuits balisés et des points d'intérêt documentés, l'application distille des informations clés pour éveiller la conscience écologique de chaque marcheur.

### Nos piliers :
* **Découvrir :** Explorer des parcs nationaux à travers des itinéraires choisis.
* **S'instruire :** Apprendre à connaître la faune, la flore et la géologie locale.
* **Protéger :** Adopter les bons réflexes grâce à des conseils de sensibilisation intégrés directement au parcours.

---

## 🚀 Fonctionnalités Actuelles (MVP)

* 🗺️ **Guide des Parcs :** Une vue d'ensemble des différents parcs nationaux disponibles pour planifier sa prochaine sortie.
* 🥾 **Itinéraires & Circuits :** Des parcours détaillés mettant en avant les points d'intérêt majeurs (panoramas, espèces protégées, zones géologiques).
* 🌱 **Sensibilisation Inline :** Des encadrés textuels pédagogiques et percutants intégrés aux fiches des parcs et des circuits pour guider l'utilisateur vers des pratiques éco-responsables (gestion des déchets, respect du silence, zones de quiétude de la faune).
* 📱 **Interface SwiftUI Native :** Une expérience moderne, fluide et épurée, respectant scrupuleusement les *Human Interface Guidelines* d'Apple.

---

## 🛠️ Stack Technique

* **OS :** iOS 17.0+
* **Langage :** Swift 5.10
* **Framework UI :** SwiftUI
* **Frameworks Apple :** **MapKit** (Intégration de cartes interactives en autonomie)
* **Architecture :** MVVM (Model-View-ViewModel)

---

## 👥 L'Équipe & Rôles

Ce projet est le fruit d'un sprint intensif d'un mois, mené et développé par :

* **Laetitia Dhont** 
  * *Rôles :* **Project Lead & Lead Designer** 
  * *Contributions :* Direction de projet, réalisation de l'intégralité des supports de présentation, suivi du versioning et gestion des modèles de données. Développement de l'architecture globale de l'application et de deux des écrans principaux (*Circuits* & *Points d'intérêt*) en SwiftUI.
  * *Focus Technique :* **Recherche et implémentation en autonomie du framework MapKit** (non vu en cours) pour propulser la cartographie interactive de l'application.
  * [LinkedIn](https://www.linkedin.com/in/laetitia-dhont/)

* **Aminata** 
  * *Rôles :* Développeuse SwiftUI & Intégration UI
  * *Contributions :* Conception de l'écran d'accueil (*Liste des Parcs*) et intégration des composants visuels de la page principale.
  
* **Marie** 
  * *Rôles :* Développeuse SwiftUI & Logique métier
  * *Contributions :* Conception et développement de l'écran *Historique des circuits* et gestion des modèles de données.
 
* **Mélanie** 
  * *Rôles :* Développeuse SwiftUI & UI Design
  * *Contributions :* Conception et développement de l'écran *Détail du Parc*, création de la navigation dans l'app. 

* **Ezgi** 
  * *Rôle :* Participante au projet, développement de l'écran *Profil*.

---

## 📸 Aperçu de l'Application


---

## 🔮 Perspectives d'Évolution (Roadmap V2)

Pour aller plus loin que ce premier prototype d'un mois, nous avons imaginé plusieurs axes d'amélioration :

1. **Gamification & Engagement :** Intégration d'un système de **badges éco-citoyens** à débloquer en complétant des circuits ou en validant des quiz de connaissances pour rendre la sensibilisation plus ludique.
2. **Recherche Avancée :** Implémentation d'un système de filtrage multicritères performant pour les circuits (par durée, niveau de difficulté, dénivelé) et pour les points d'intérêt (faune, flore, points de vue).
3. **Mode Hors-Ligne :** Possibilité de télécharger les circuits à l'avance pour y avoir accès en zone blanche au cœur des parcs.

---

## ⚙️ Installation & Lancement

Pour tester le prototype sur Xcode :

1. Cloner le repository :
   ```bash
   git clone [https://github.com/](https://github.com/)[LaetitiaDhont]/lisiere-app.git
   
2. Pour tester le prototype sur Xcode :
   ```bash
   cd lisiere-app
   open Lisiere.xcodeproj
