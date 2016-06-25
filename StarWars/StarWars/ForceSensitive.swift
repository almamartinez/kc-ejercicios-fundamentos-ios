//
//  ForceSensitive.swift
//  StarWars
//
//  Created by Iberfan on 23/6/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

import Foundation
import UIKit

class ForceSensitive: StarWarsCharacter{
    
    //MARK: - Stored properties
    let midichlorians : Int
    
    
    //MARK: - Initialitation
    init(firstName : String?, lastName : String?, alias : String?,
         soundData : NSData, photo : UIImage, url : NSURL,
         affiliation : StarWarsAffiliation, midichlorians : Int){
        
        // Todo inicializador designado tiene que asignar las propiedades extra de su clase antes de llamar a Super
        self.midichlorians = midichlorians
        
        super.init(firstName: firstName, lastName: lastName,
                   alias: alias, soundData: soundData,
                   photo: photo, url: url, affiliation: affiliation)
        
    }
    
    convenience init(jediWithFirstName: String?, lastName: String?, alias : String?,
                     soundData: NSData, photo: UIImage, url : NSURL, midichlorians: Int)
    {
        self.init(firstName: jediWithFirstName,
                  lastName: lastName,
                  alias: alias, soundData: soundData,
                  photo: photo, url: url,
                  affiliation: .rebelAlliance , midichlorians: midichlorians)
    }
    
    convenience init(sithWithFirstName: String?, lastName: String?, alias : String?,
                     soundData: NSData, photo: UIImage, url : NSURL, midichlorians: Int)
    {
        self.init(firstName: sithWithFirstName,
                  lastName: lastName,
                  alias: alias, soundData: soundData,
                  photo: photo, url: url,
                  affiliation: .galacticEmpire , midichlorians: midichlorians)
    }
    
    // MARK: - proxies
   
   override var proxyForComparison: String{
        get{
            return "\(super.proxyForComparison) \(midichlorians)"
        }
    }
    
    override var proxyForSorting: String{
        get{
            let isSith = ((affiliation == .galacticEmpire) || (affiliation == .firstOrder)) ? "Z" : "X"
            
            return "\(isSith) \(super.proxyForSorting) \(midichlorians)"
        }
    }
   
}

