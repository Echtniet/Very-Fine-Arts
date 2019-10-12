//
//  Restaurants.swift
//  Restaurants
//
//  Created by Michael Rogers on 9/25/19.
//  Copyright © 2019 Bearcat Coders. All rights reserved.
//

import Foundation

enum Medium{
    case oil, watercolor, acrylic, other
}

struct Artwork {
    var name: String
    var price:Double
    var creationDate: Int
    var medium:Medium
    var isAuthenticated:Bool
}

class Artist {
    var firstName:String
    var lastName:String
    var dateOfBirth:Int
    private var artworks:[Artwork]
    
    init(firstName:String, lastName:String, dateOfBirth:Int, artworks:[Artwork] = []){
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.artworks = artworks
    }
    // just a convenience so we can access each restaurant's menu more easily
    subscript (i:Int) -> Artwork {
        return artworks[i]
    }
    
    func numArtworks() -> Int{
        return artworks.count
    }
    
    func add(artwork:Artwork){
        artworks.append(artwork)
    }
    
    func deleteArtwork(at index:Int){
        artworks.remove(at: index)
    }
    
    
}

class Museum {
    
    private static var _shared:Museum!
    static var shared:Museum {
        if _shared == nil {
            _shared = Museum()
        }
        return _shared
    }
    
    private init(){loadArtistAndArtworks()}
    
    subscript(i:Int) -> Artist {
        return artists[i]
    }
    
    func numArtists() -> Int {
        return artists.count
    }
    
    func loadArtistAndArtworks(){
        let staryNight = Artwork(name: "The Starry Night", price: 80_000_000, creationDate: 071889, medium: .oil, isAuthenticated: true)
        let selfVanGogh = Artwork(name: "Van Gogh self-portrait", price: 71_500_000, creationDate: 091889, medium: .oil, isAuthenticated: true)
        let oldGuitarist = Artwork(name: "The Old Guitarist", price: 100_000_000, creationDate: 19031904, medium: .oil, isAuthenticated: true)
        let lesDemoiselles = Artwork(name: "Les Demoiselles d'Avignon", price: 1_2000_000_000, creationDate: 1907, medium: .oil, isAuthenticated: true)
        
        let vanGogh = Artist(firstName: "Vincent", lastName: "van Gogh", dateOfBirth: 03301853, artworks: [staryNight, selfVanGogh])
         let picasso = Artist(firstName: "Pable", lastName: "Picasso", dateOfBirth:10251881, artworks:[oldGuitarist, lesDemoiselles])
        
        artists.append(vanGogh)
        artists.append(picasso)
    }
    
    private var artists:[Artist] = []
    
    func add(artist:Artist){
        artists.append(artist)
    }
    
    func deleteArtist(at index:Int) {
        artists.remove(at: index)
    }
    
}
