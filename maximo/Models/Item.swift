//
//  Item.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 06/07/21.
//

import UIKit

// MARK : Atributos

class Item: NSObject {
    let nome : String
    let calorias : Double
    
    // MARK : init

    init (nome: String, calorias : Double) {

        self.nome = nome
        self.calorias = calorias

    }

}
