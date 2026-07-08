//
//  Parc.swift
//  Lisiere
//
//  Created by l'équipe Lisiere on 17/06/2026.
//

import Foundation
import SwiftUI
import CoreLocation

// MARK: - STRUCTURES DE DONNÉES

struct Parc: Identifiable, Hashable {
    var id = UUID()
    var nom: String
    var image: String
    var region: String
    var horaires: String
    var description: String
    let lienOfficiel: String // Ajout du var pour lien internet
    var circuits: [Circuit]
    var pointsInterets: [PointInteret]
}

struct Circuit: Identifiable, Hashable {
    var id = UUID()
    var nomStr: String
    var date: String
    var heure: String
    var latitude: Double
    var longitude: Double
    var statut: Statut
    var nomParc: String
    var pointsInterets: [PointInteret]
}

enum ConseilEnvironnement: String, CaseIterable {
    case dechets = "Ne laissez aucun déchet derrière vous."
    case animaux = "Gardez vos distances avec la faune sauvage."
    case feu = "Feux de camp strictement interdits."
    case fleurs = "Ne cueillez pas les fleurs sauvages."
    
    var icone: String {
        switch self {
        case .dechets: return "trash.slash.fill"
        case .animaux: return "pawprint.fill"
        case .feu: return "flame.circle.fill"
        case .fleurs: return "laurel.leading"
        }
    }
}


enum Statut: String, CaseIterable, Codable {
    case afaire = "A faire"
    case enCours = "En cours"
    case termine = "Terminé"
}

struct PointInteret: Identifiable, Hashable {
    var id = UUID()
    var nom: String
    var description: String
    var image: String
    var latitude: Double
    var longitude: Double
    var conseils: [ConseilEnvironnement]
    
    /*/ Propriété calculée pour l'affichage sur une carte MapKit
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    // Conformité Hashable personnalisée
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Équivalence obligatoire
    static func == (lhs: PointInteret, rhs: PointInteret) -> Bool {
        lhs.id == rhs.id
    }
     */
}

struct Profil: Identifiable, Hashable {
    var id = UUID()
    var nom: String
    var prenom: String
    var naissance: String
    var circuits: [Circuit]
    var badges: [Badges]
}

struct Badges: Identifiable, Hashable {
    var id = UUID()
    var nom: String
    var obtenu: Bool
    var icone: String
    var couleur: Color
}

enum ParcType: String, CaseIterable, Codable, Hashable {
    case vanoise = "Parc National de la Vanoise"
    case portCros = "Parc National de Port-Cros"
    case pyrenees = "Parc National des Pyrénées"
    case cevennes = "Parc National des Cévennes"
    case ecrins = "Parc National des Écrins"
    case mercantour = "Parc National du Mercantour"
    case calanques = "Parc National des Calanques"
    case forets = "Parc National de forêts"
}


// MARK: - POINTS D'INTÉRÊT

let PointInteretVanoise: [PointInteret] = [
    PointInteret(nom: "Lac des Vaches", description: "Un lac de montagne unique traversé par un sentier de dalles de pierres plates au ras de l'eau.", image: "lac_des_vaches", latitude: 45.3900, longitude: 6.7725, conseils: [.dechets, .fleurs]),
    PointInteret(nom: "Grande Casse", description: "Le plus haut sommet de la Savoie culminant à 3 855 mètres, entouré de glaciers impressionnants.", image: "grande_casse", latitude: 45.4181, longitude: 6.8311, conseils: [.animaux]),
    PointInteret(nom: "L'Écot", description: "Un hameau traditionnel en pierres sèche, célèbre pour avoir servi de décor au film Belle et Sébastien.", image: "lecot", latitude: 45.3811, longitude: 7.0734, conseils: [.dechets, .feu]),
    PointInteret(nom: "Fort Victor-Emmanuel", description: "Une imposante forteresse historique de la barrière de l'Esseillon érigée à flanc de falaise.", image: "fort_victor_emmanuel", latitude: 45.2106, longitude: 6.7410, conseils: [.dechets])
]

let PointInteretPortCros: [PointInteret] = [
    PointInteret(nom: "Sentier sous-marin de la Palud", description: "Équipé de palmes, masque et tuba, on y explore une faune marine protégée et préservée.", image: "sentier_sous_marin_palud", latitude: 43.0125, longitude: 6.4022, conseils: [.animaux, .dechets]),
    PointInteret(nom: "Rocher de la Gabinière", description: "Un spot de plongée sous-marine mondialement connu, réserve intégrale réputée pour ses mérous bruns.", image: "rocher_gabiniere", latitude: 42.9892, longitude: 6.3961, conseils: [.animaux]),
    PointInteret(nom: "Fort de l'Estissac", description: "Une forteresse historique du XVIIe siècle surplombant la baie, offering un panorama spectaculaire.", image: "fort_estissac", latitude: 43.0114, longitude: 6.3831, conseils: [.feu]),
    PointInteret(nom: "Baie de Port-Man", description: "La plus grande baie de l'île, abritant une plage de graviers très sauvage bien protégée.", image: "baie_port_man", latitude: 43.0178, longitude: 6.4358, conseils: [.dechets, .feu])
]

let PointInteretPyrenees: [PointInteret] = [
    PointInteret(nom: "Cirque de Gavarnie", description: "Une immense muraille naturelle de calcaire inscrite au patrimoine mondial de l'UNESCO.", image: "cirque_gavarnie", latitude: 42.6936, longitude: -0.0031, conseils: [.dechets, .fleurs]),
    PointInteret(nom: "Pic du Midi d'Ossau", description: "Sommet volcanique aux dents acérées qui culmine majestueusement à 2 884 mètres.", image: "pic_midi_ossau", latitude: 42.8364, longitude: -0.4378, conseils: [.animaux]),
    PointInteret(nom: "Lac de Gaube", description: "Un lac de montagne splendide célèbre pour ses eaux turquoise limpides.", image: "lac_gaube", latitude: 42.8361, longitude: -0.1394, conseils: [.dechets]),
    PointInteret(nom: "Le Vignemale", description: "Le plus haut sommet des Pyrénées françaises culminant à 3 298 mètres d'altitude.", image: "vignemale", latitude: 42.7739, longitude: -0.1472, conseils: [.animaux, .feu])
]

let PointDinteretCevennes: [PointInteret] = [
    PointInteret(nom: "Chaos de Nîmes-le-Vieux", description: "Un paysage ruiniforme spectaculaire d'éboulis calcaires sculptés par le temps sur le causse Méjean.", image: "cevennes_nimes_le_vieux", latitude: 44.2239, longitude: 3.4912, conseils: [.fleurs]),
    PointInteret(nom: "Mont Aigoual", description: "Point culminant du Gard (1 565m), célèbre pour son observatoire météorologique.", image: "cevennes_aigoual", latitude: 44.1219, longitude: 3.5817, conseils: [.dechets]),
    PointInteret(nom: "Mont Lozère", description: "Le sommet du parc (1 699m). Un massif granitique traversé par le célèbre chemin de Stevenson.", image: "cevennes_lozere", latitude: 44.4178, longitude: 3.7381, conseils: [.animaux, .dechets]),
    PointInteret(nom: "Gorges du Tarn", description: "Un canyon vertigineux creusé par la rivière entre les causses. Paradis des vautours.", image: "cevennes_gorges_tarn", latitude: 44.3255, longitude: 3.3211, conseils: [.dechets, .feu])
]

let PointDinteretEcrins: [PointInteret] = [
    PointInteret(nom: "Le Glacier Blanc", description: "Le plus grand glacier du massif. Une mer de glace offrant un panorama au pied de la Barre.", image: "ecrins_glacier_blanc", latitude: 44.9317, longitude: 6.3881, conseils: [.animaux]),
    PointInteret(nom: "Pré de Madame Carle", description: "Un vaste replat majestueux marquant le début de la haute montagne et des grands sommets.", image: "ecrins_pre_madame_carle", latitude: 44.9189, longitude: 6.4158, conseils: [.dechets]),
    PointInteret(nom: "Lac de la Muzelle", description: "Un magnifique lac glaciaire situé à 2 115m d'altitude, niché dans une cuvette entourée de sommets.", image: "ecrins_lac_muzelle", latitude: 44.9194, longitude: 6.0967, conseils: [.dechets, .fleurs]),
    PointInteret(nom: "Cirque du Gioberney", description: "Ce cirque glaciaire abrite la spectaculaire cascade du Voile de la Mariée.", image: "ecrins_gioberney", latitude: 44.8217, longitude: 6.2847, conseils: [.feu])
]

let PointDinteretMercantour: [PointInteret] = [
    PointInteret(nom: "Lac d'Allos", description: "Perché à 2 228m, c'est le plus grand lac naturel d'altitude d'Europe. Eaux d'un bleu profond.", image: "mercantour_lac_allos", latitude: 44.2334, longitude: 6.7118, conseils: [.dechets, .fleurs]),
    PointInteret(nom: "Vallée des Merveilles", description: "Un musée à ciel ouvert de la Préhistoire abritant plus de 40 000 gravures rupestres.", image: "mercantour_vallee_merveilles", latitude: 44.0772, longitude: 7.4394, conseils: [.animaux, .dechets]),
    PointInteret(nom: "Sanctuaire de la Madone de Fenestre", description: "Un lieu de pèlerinage historique. Carrefour idéal pour observer les bouquetins.", image: "mercantour_madone_fenestre", latitude: 44.0942, longitude: 7.3567, conseils: [.animaux]),
    PointInteret(nom: "Le Boréon", description: "Une magnifique porte d'entrée du parc caractérisée par sa forêt dense et son parc à loups Alpha.", image: "mercantour_boreon", latitude: 44.1136, longitude: 7.2881, conseils: [.dechets, .feu])
]

let PointDinteretCalanques: [PointInteret] = [
    PointInteret(nom: "Calanque d'En-Vau", description: "Un canyon spectaculaire aux parois verticales se jetant dans une mer émeraude.", image: "calanques_en_vau", latitude: 43.2025, longitude: 5.5039, conseils: [.dechets, .feu]),
    PointInteret(nom: "Calanque de Sormiou", description: "La plus large calanque de Marseille, connue pour sa plage et ses petits cabanons.", image: "calanques_sormiou", latitude: 43.2106, longitude: 5.4200, conseils: [.dechets]),
    PointInteret(nom: "Calanque de Sugiton", description: "Réputée pour son belvédère offrant une vue à 360° sur la côte et son îlot du Torpilleur.", image: "calanques_sugiton", latitude: 43.2131, longitude: 5.4547, conseils: [.dechets, .animaux]),
    PointInteret(nom: "Archipel de Riou", description: "Un ensemble d'îles sauvages inhabitées au large des côtes, paradis de la biodiversité marine.", image: "calanques_archipel_riou", latitude: 43.1789, longitude: 5.3853, conseils: [.animaux, .feu])
]

let PointDinteretForets: [PointInteret] = [
    PointInteret(nom: "Abbaye d'Auberive", description: "Une abbaye cistercienne majestueuse fondée au XIIe siècle au cœur des vastes forêts.", image: "forets_abbaye_auberive", latitude: 47.7881, longitude: 5.0619, conseils: [.dechets]),
    PointInteret(nom: "Marais tufeux de Chalmessin", description: "Un écosystème très rare, caractérisé par des sources pétrifiantes qui modèlent le paysage.", image: "forets_marais_tufeux", latitude: 47.6975, longitude: 5.0372, conseils: [.fleurs, .dechets]),
    PointInteret(nom: "Abbaye du Val des Choues", description: "Située en plein cœur du massif forestier, cette ancienne abbaye possède de magnifiques jardins.", image: "forets_val_des_choues", latitude: 47.7719, longitude: 4.8525, conseils: [.dechets]),
    PointInteret(nom: "Forêt domaniale d'Arc-en-Barrois", description: "L'une des plus vastes forêts de feuillus de France, réputée pour sa population de grands cerfs.", image: "forets_arc_en_barrois", latitude: 47.9500, longitude: 5.0167, conseils: [.animaux, .feu])
]

// MARK: - DONNÉES DE RÉFÉRENCE (CIRCUITS)

var circuitsParc1: [Circuit] = [ // La Vanoise
    Circuit(nomStr: "Tour des lacs de Bellecombe", date: "21-06-2026", heure: "08:00", latitude: 45.3150, longitude: 6.828587, statut: .enCours, nomParc: ParcType.vanoise.rawValue, pointsInterets: [PointInteretVanoise[0], PointInteretVanoise[1]]),
    Circuit(nomStr: "Le col de la Vanoise par les Barnauds", date: "22-06-2026", heure: "07:30", latitude: 45.3809, longitude: 6.72088, statut: .afaire, nomParc: ParcType.vanoise.rawValue, pointsInterets: [PointInteretVanoise[1], PointInteretVanoise[2]]),
    Circuit(nomStr: "Tour des glaciers de la Vanoise", date: "20-06-2026", heure: "07:00", latitude: 45.38174, longitude: 6.73609, statut: .termine, nomParc: ParcType.vanoise.rawValue, pointsInterets: [PointInteretVanoise[2], PointInteretVanoise[3]]),
]

var circuitsParc2: [Circuit] = [ // Port-Cros
    Circuit(nomStr: "Sentier des Crêtes", date: "20/06/2026", heure: "02:00", latitude: 43.0086, longitude: 6.3897, statut: .enCours, nomParc: ParcType.portCros.rawValue, pointsInterets: [PointInteretPortCros[0], PointInteretPortCros[1]]),
    Circuit(nomStr: "Sentier de la Vigie", date: "22/06/2026", heure: "03:00", latitude: 43.0102, longitude: 6.3925, statut: .enCours, nomParc: ParcType.portCros.rawValue, pointsInterets: [PointInteretPortCros[1], PointInteretPortCros[2]]),
    Circuit(nomStr: "Tour de l'île", date: "25/06/2026", heure: "04:30", latitude: 43.0058, longitude: 6.3850, statut: .afaire, nomParc: ParcType.portCros.rawValue, pointsInterets: [PointInteretPortCros[2], PointInteretPortCros[3]]),
]

var circuitsParc3: [Circuit] = [ // Les Pyrénées
    Circuit(nomStr: "Lac de Gaube", date: "20/06/2026", heure: "03:00", latitude: 42.8511, longitude: 0.1467, statut: .enCours, nomParc: ParcType.pyrenees.rawValue, pointsInterets: [PointInteretPyrenees[2]]),
    Circuit(nomStr: "Sentier de la Vigie", date: "22/06/2026", heure: "03:00", latitude: 42.8836, longitude: 0.1108, statut: .termine, nomParc: ParcType.pyrenees.rawValue, pointsInterets: [PointInteretPyrenees[0], PointInteretPyrenees[1]]),
    Circuit(nomStr: "Tour des Lacs d'Ayous", date: "25/06/2026", heure: "04:30", latitude: 42.8428, longitude: -0.4533, statut: .enCours, nomParc: ParcType.pyrenees.rawValue, pointsInterets: [PointInteretPyrenees[1], PointInteretPyrenees[3]]),
]

var circuitsParc4: [Circuit] = [ // Les Cévennes
    Circuit(nomStr: "Boucle de Cézas et Cambo", date: "20/06/2026", heure: "02:30", latitude: 44.1167, longitude: 3.6167, statut: .termine, nomParc: ParcType.cevennes.rawValue, pointsInterets: [PointDinteretCevennes[0], PointDinteretCevennes[1]]),
    Circuit(nomStr: "Gorges du Gardon et grotte de Valaurie", date: "22/06/2026", heure: "04:00", latitude: 44.0167, longitude: 3.9833, statut: .afaire, nomParc: ParcType.cevennes.rawValue, pointsInterets: [PointDinteretCevennes[1], PointDinteretCevennes[2]]),
    Circuit(nomStr: "Gorges du Tarn et de la Jonte", date: "25/06/2026", heure: "3 Jours", latitude: 44.1989, longitude: 3.3678, statut: .afaire, nomParc: ParcType.cevennes.rawValue, pointsInterets: [PointDinteretCevennes[2], PointDinteretCevennes[3]]),
]

var circuitsParc5: [Circuit] = [ // Les Écrins
    Circuit(nomStr: "Sentier des Crevasse", date: "20/06/2026", heure: "02:00", latitude: 45.0342, longitude: 6.3411, statut: .enCours, nomParc: ParcType.ecrins.rawValue, pointsInterets: [PointDinteretEcrins[0], PointDinteretEcrins[1]]),
    Circuit(nomStr: "Lac du Lauvitel", date: "22/06/2026", heure: "03:30", latitude: 44.9692, longitude: 6.0617, statut: .enCours, nomParc: ParcType.ecrins.rawValue, pointsInterets: [PointDinteretEcrins[1], PointDinteretEcrins[2]]),
    Circuit(nomStr: "Refuge de l'Aigle et Glacier de la Meije", date: "25/06/2026", heure: "06:30", latitude: 45.0161, longitude: 6.3850, statut: .afaire, nomParc: ParcType.ecrins.rawValue, pointsInterets: [PointDinteretEcrins[2], PointDinteretEcrins[3]]),
]

var circuitsParc6: [Circuit] = [ // Le Mercantour
    Circuit(nomStr: "Le Boréon - Cascade", date: "20/06/2026", heure: "01:45", latitude: 44.1167, longitude: 7.1167, statut: .afaire, nomParc: ParcType.mercantour.rawValue, pointsInterets: [PointDinteretMercantour[2], PointDinteretMercantour[3]]),
    Circuit(nomStr: "Le Lac d'Allos", date: "22/06/2026", heure: "03:00", latitude: 44.2333, longitude: 6.7000, statut: .afaire, nomParc: ParcType.mercantour.rawValue, pointsInterets: [PointDinteretMercantour[0], PointDinteretMercantour[1]]),
    Circuit(nomStr: "Grand Tour de la Vallée des Merveilles", date: "25/06/2026", heure: "07:30", latitude: 44.0764, longitude: 7.4583, statut: .afaire, nomParc: ParcType.mercantour.rawValue, pointsInterets: [PointDinteretMercantour[1], PointDinteretMercantour[3]]),
]

var circuitsParc7: [Circuit] = [ // Les Calanques
    Circuit(nomStr: "Belvédère de Sugiton", date: "20/06/2026", heure: "01:30", latitude: 43.2067, longitude: 5.4522, statut: .afaire, nomParc: ParcType.calanques.rawValue, pointsInterets: [PointDinteretCalanques[2]]),
    Circuit(nomStr: "En-Vau par Port-Miou et Port-Pin", date: "22/06/2026", heure: "03:30", latitude: 43.2031, longitude: 5.5186, statut: .afaire, nomParc: ParcType.calanques.rawValue, pointsInterets: [PointDinteretCalanques[0], PointDinteretCalanques[1]]),
    Circuit(nomStr: "La Demi-Grande Randonnée des Calanques", date: "25/06/2026", heure: "07:00", latitude: 43.2125, longitude: 5.4358, statut: .afaire, nomParc: ParcType.calanques.rawValue, pointsInterets: [PointDinteretCalanques[1], PointDinteretCalanques[3]]),
]

var circuitsParc8: [Circuit] = [ // De Forêts
    Circuit(nomStr: "Sentier des Abbayes Cisterciennes", date: "20/06/2026", heure: "04:30", latitude: 47.7881, longitude: 5.0619, statut: .afaire, nomParc: ParcType.forets.rawValue, pointsInterets: [PointDinteretForets[0], PointDinteretForets[2]]),
    Circuit(nomStr: "Boucle des Marais Tufeux", date: "22/06/2026", heure: "01:50", latitude: 47.6975, longitude: 5.0372, statut: .afaire, nomParc: ParcType.forets.rawValue, pointsInterets: [PointDinteretForets[1]]),
    Circuit(nomStr: "Forêt d'Arc-en-Barrois longue distance", date: "25/06/2026", heure: "06:00", latitude: 47.9500, longitude: 5.0167, statut: .afaire, nomParc: ParcType.forets.rawValue, pointsInterets: [PointDinteretForets[3]]),
]

var tousLesCircuits: [Circuit] = circuitsParc1 + circuitsParc2 + circuitsParc3 + circuitsParc4 + circuitsParc5 + circuitsParc6 + circuitsParc7 + circuitsParc8

// MARK: - TABLEAU PRINCIPAL DES PARCS

let tousLesParcs: [Parc] = [ //J'ai retoucher déscription sur chaque déscription
    // 1. VANOISE
    Parc(
        nom: "Parc National de la Vanoise",
        image: "parc_vanoise",
        region: "Auvergne-Rhône-Alpes (Savoie)",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            Alpes, entre les vallées de la Tarentaise et de la Maurienne (Savoie).
            Création en 1963, c’est le premier parc national créé en France.\ 
            
            **Le parc protège un grand territoire de haute montagne avec des glaciers, des sommets dépassant 3 000 mètres et de nombreux lacs d’altitude. Il est connu pour sa population de bouquetins, réintroduits après avoir presque disparu. On y trouve aussi des marmottes, des chamois et une flore alpine très riche.**\
            
            Il protège les paysages alpins et favorise la conservation des espèces de montagne.
            """,
        lienOfficiel: "https://www.vanoise-parcnational.fr/fr?utm_source",
        circuits: circuitsParc1,
        pointsInterets: PointInteretVanoise
    ),
    
    // 2. PORT-CROS
    Parc(
        nom: "Parc National de Port-Cros",
        image: "parc_port_cros",
        region: "Provence-Alpes-Côte d'Azur (Var)",
        horaires: "Accès libre (soumis aux horaires des navettes maritimes)",
        description: """
            Îles de Port-Cros et Porquerolles, en Méditerranée, dans le Var.
            Créer en 1963.\
            
            **Ce parc est particulier car il protège à la fois des espaces terrestres et marins. Ses paysages sont composés de falaises, de forêts méditerranéennes et d’eaux très riches en biodiversité. Les fonds marins abritent des herbiers de posidonies, des poissons et de nombreuses espèces protégées.**\
            
            Il joue un rôle majeur dans la protection de la mer Méditerranée et des écosystèmes insulaires.
            """,
        lienOfficiel: "https://www.portcros-parcnational.fr/fr?utm_source",
        circuits: circuitsParc2,
        pointsInterets: PointInteretPortCros
    ),
    
    // 3. PYRÉNÉES
    Parc(
        nom: "Parc National des Pyrénées",
        image: "parc_pyrenees",
        region: "Occitanie (Hautes-Pyrénées & Pyrénées-Atlantiques)",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            Chaîne des Pyrénées, entre les Hautes-Pyrénées et les Pyrénées-Atlantiques.
            Création en 1967.\
            
            **Description : Le parc protège des paysages de haute montagne : sommets, vallées, cirques glaciaires et lacs. Il abrite des animaux emblématiques comme l’isard, le gypaète barbu et le desman des Pyrénées. Les paysages de montagne attirent de nombreux randonneurs.**\
            
            Il protège un patrimoine naturel exceptionnel et des espèces rares.
            """,
        lienOfficiel: "https://www.pyrenees-parcnational.fr/fr?utm_source",
        circuits: circuitsParc3,
        pointsInterets: PointInteretPyrenees
    ),
    
    // 4. CÉVENNES
    Parc(
        nom: "Parc National des Cévennes",
        image: "parc_cevennes",
        region: "Occitanie & Auvergne-Rhône-Alpes",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            Cévennes, principalement en Lozère, Gard et Ardèche.
            Création en 1970.\
            
            **Ce parc est célèbre pour ses grandes forêts, ses montagnes anciennes, ses vallées profondes et ses paysages façonnés par l’agriculture traditionnelle. C’est un territory où l’homme et la nature cohabitent depuis longtemps. On y observe des cerfs, des vautours, des castors et une grande diversité végétale.**\
            
            Il protège à la fois la biodiversité et les traditions rurales.
            """,
        lienOfficiel: "https://www.cevennes-parcnational.fr/fr?utm_source",
        circuits: circuitsParc4,
        pointsInterets: PointDinteretCevennes
    ),
    
    // 5. ÉCRINS
    Parc(
        nom: "Parc National des Écrins",
        image: "parc_ecrins",
        region: "Provence-Alpes-Côte d'Azur & Auvergne-Rhône-Alpes",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            LAlpes du Sud, entre l’Isère et les Hautes-Alpes.
            Création en 1973.\
            
            **Le parc possède certains des plus beaux paysages alpins : glaciers, sommets élevés, vallées sauvages et vastes espaces naturels. Il abrite plus de 350 espèces de vertébrés, dont le bouquetin, l’aigle royal et le tétras-lyre.**\
            
            Intérêt : C’est un lieu important pour la protection de la montagne et de ses espèces.
            """,
        lienOfficiel: "https://www.ecrins-parcnational.fr/?utm_source",
        circuits: circuitsParc5,
        pointsInterets: PointDinteretEcrins
    ),
    
    // 6. MERCANTOUR
    Parc(
        nom: "Parc National du Mercantour",
        image: "parc_mercantour",
        region: "Provence-Alpes-Côte d'Azur (Alpes-Maritimes & Alpes-de-Haute-Provence)",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            Alpes du Sud, près de la frontière italienne.
            Création en 1979.\
            
            **Le parc est connu pour ses paysages très variés : montagnes, forêts, vallées et lacs d’altitude. Il possède une biodiversité exceptionnelle avec le loup, le chamois, le bouquetin et de nombreuses plantes alpines. Il est aussi célèbre pour les gravures préhistoriques de la vallée des Merveilles.**\
            
            Il protège un patrimoine naturel et historique unique.
            """,
        lienOfficiel: "https://www.mercantour-parcnational.fr/fr?utm_source",
        circuits: circuitsParc6,
        pointsInterets: PointDinteretMercantour
    ),
    
    // 7. CALANQUES
    Parc(
        nom: "Parc National des Calanques",
        image: "parc_calanques",
        region: "Provence-Alpes-Côte d'Azur (Bouches-du-Rhône)",
        horaires: "Accès libre (accès réglementé en été selon les risques d'incendie)",
        description: """
            Côte méditerranéenne entre Marseille, Cassis et La Ciotat.
            Création en 2012.\
            
            **C’est un parc à la fois terrestre et marin. Il protège des falaises calcaires, des criques appelées « calanques », des forêts méditerranéennes et une grande richesse sous-marine. On y trouve notamment des dauphins, des oiseaux marins et des espèces végétales adaptées au climat méditerranéen.**\
            
            Il protège un littoral très fréquenté et fragile.
            """,
        lienOfficiel: "https://www.calanques-parcnational.fr/fr?utm_source",
        circuits: circuitsParc7,
        pointsInterets: PointDinteretCalanques
    ),
    
    // 8. FORÊTS
    Parc(
        nom: "Parc National de Forêts",
        image: "parc_forets",
        region: "Grand Est & Bourgogne-Franche-Comté",
        horaires: "Espace ouvert 24h/24, accès libre",
        description: """
            Entre la Haute-Marne et la Côte-d’Or.
            Création en 2019.\
            
            **Ce parc protège de grandes forêts de plaine, notamment des hêtraies et chênaies anciennes. Il possède une biodiversité remarquable avec des cerfs, des oiseaux forestiers et de nombreuses espèces végétales. Il représente un type de paysage différent des parcs de montagne ou du littoral.**\
            
            Il préserve les forêts anciennes et sensibilise à la gestion durable des milieux forestiers.
            """,
        lienOfficiel: "https://www.forets-parcnational.fr/fr?utm_source",
        circuits: circuitsParc8,
        pointsInterets: PointDinteretForets
    )
]

// MARK: - UTILISATEUR
var profil = Profil(nom: "IAM", prenom: "Marie", naissance: "01/01/2000", circuits: circuitsParc1, badges: [])
