//
//  StarWarsCharacter.swift
//  StarWars
//
//  Created by Iberfan on 21/6/16.
//  Copyright © 2016 AlmaMartinez. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter: Comparable {
    
    //MARK: - Stored properties
    let firstName   :   String?
    let lastName    :   String?
    let alias       :   String?
    let soundData   :   NSData
    let photo       :   UIImage
    let url         :   NSURL
    let affiliation :   StarWarsAffiliation
    
    
    //MARK: - Computed properties
    var name : String?{
        get{
            guard let first = firstName else{
                return lastName
            }
            
            guard let last = lastName else{
                return first
            }
            
            return "\(first) \(last)"
            
        }
    }
    
    //MARK: - Initialization
    init(firstName : String?, lastName : String?, alias : String?,
         soundData : NSData, photo : UIImage, url : NSURL, affiliation : StarWarsAffiliation){
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        self.soundData = soundData
        self.photo = photo
        self.url = url
        self.affiliation = affiliation
    }
    
    convenience init(alias : String?, soundData : NSData, photo : UIImage, url : NSURL, affiliation : StarWarsAffiliation){
        
        self.init(firstName: nil, //Inicializa un opcional vacío.
                  lastName: nil,
                  alias: alias,
                  soundData: soundData,
                  photo: photo,
                  url: url,
                  affiliation: affiliation)
    }
    
    //MARK: - Proxies
    
    var proxyForComparison : String{
        get{
            return "\(firstName)\(lastName)\(alias)\(url)"
        }
    }
    
    var proxyForSorting : String{
        get{
            return proxyForComparison
        }
    }
    
    
}


//LOS OPERADORES SOBRECARGADOS HAY QUE DECLARARLOS FUERA DE LA SINTAXIS DE LA CLASE OBLIGATORIAMENTE
//MARK: - Equatable
func ==(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool{ //swift implementa por nosotros "!="
 
    guard (lhs !== rhs) else { //el === compara direcciones de memoria. Con esto nos aseguramos que si el objeto es exactamente el mismo, nos libramos de comparar los strings xq es el mismo objeto.
        return true
    }
    
    return  lhs.proxyForComparison == rhs.proxyForComparison
}

//MARK: - Comparable
func <(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool{
    return  lhs.proxyForSorting < rhs.proxyForSorting
}
 


//MARK: - Extensión para implementar el protocolo CustomStringConvertible, que sirve para dar información de la propia clase.
//Para averiguar en tiempo de ejecución cual es el tipo de una clase.
extension StarWarsCharacter: CustomStringConvertible{
    var description : String{
        get{
            if let name=name, alias = alias{
                return "<\(self.dynamicType)>\(name) -- \(alias)>"
            }
            return "<\(self.dynamicType)>"
        }
    }
}














