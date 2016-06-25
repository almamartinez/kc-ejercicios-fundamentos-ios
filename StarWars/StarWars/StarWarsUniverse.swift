//
//  StarWarsUniverse.swift
//  StarWars
//
//  Created by Iberfan on 23/6/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

import UIKit

class StarWarsUniverse {
    
    //MARK: - Utility types
    typealias StarWarsArray         =   [StarWarsCharacter]
    typealias StarWarsDictionary    =   [StarWarsAffiliation : StarWarsArray]
    
    
    //MARK: - Utils
    func makeEmptyAffiliations() -> StarWarsDictionary {
        var d = StarWarsDictionary()
        
        d[.rebelAlliance]       =   StarWarsArray()
        d[.galacticEmpire]      =   StarWarsArray()
        d[.firstOrder]          =   StarWarsArray()
        d[.jabbaCriminalEmpire] =   StarWarsArray()
        d[.unknown]             =   StarWarsArray()
    
        return d
    }
    
}