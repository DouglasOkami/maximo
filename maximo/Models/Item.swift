//
//  Item.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 06/07/21.
//

import UIKit

//MARK: Atributos

class Item: NSObject, NSCoding {
   
    let nome : String
    let calorias : Double
    
    //MARK: init

    init (nome: String, calorias : Double) {

        self.nome = nome
        self.calorias = calorias

    }
    //MARK: NSCoding
    func encode(with coder: NSCoder) {
        coder.encode(nome, forKey: "nome")
        coder.encode(calorias,forKey: "calorias")
    }
    
    required init?(coder: NSCoder) {
        nome = coder.decodeObject(forKey: "nome") as! String
        calorias = coder.decodeDouble(forKey: "calorias")
    }
}
