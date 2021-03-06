//
//  Artist.swift
//  Artistry
//
//  Created by pennyworth on 10/3/19.
//  Copyright © 2019 punkundermyskin. All rights reserved.
//

import UIKit

struct JsonData: Decodable {
    let artists: [Artist]
}

struct Artist: Decodable {
    let name : String
    let image : String
    let bio: String
    var works: [ArtWork]
    
    static func readResources() -> [Artist] {
        
        var artists = [Artist]()
        
        guard let path = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            print("File could not be located at the give url")
            return artists
        }
        
        do {
            let data = try Data(contentsOf: path)
            
            let artistsJson = try JSONDecoder().decode(JsonData.self, from: data)
            
            artists = artistsJson.artists
            
        } catch {
            print("Error: \(error)")
        }
        

        
        return artists
    }
}
