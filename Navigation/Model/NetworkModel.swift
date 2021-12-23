//
//  NetworkModel.swift
//  Navigation
//
//  Created by Fedor Boriskin on 21.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation


struct Human {

    var userId: Int
    var id: Int
    var title: String
    var completed: Bool

}


struct Planet: Decodable {
   
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
}

struct Names: Decodable {
    
    var name: String
    
}
