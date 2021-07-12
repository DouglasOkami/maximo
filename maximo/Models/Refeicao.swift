//
//  Refeicao.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 06/07/21.
//

import UIKit

class Refeicao: NSObject {
    
    // MARK: - atributos
    
        let nome: String
        let felicidade: Int
        let itens: Array<Item> = []
        
        // MARK: - Construtor
    
        init (nome : String, felicidade : Int) {
            self.nome = nome
            self.felicidade = felicidade
        }
        // MARK : - Metodos
    
        func totalDeCalorias() -> Double{
            var total = 0.0
            for item in itens {
                total += item.calorias
            }
            return total
        }
}

