//
//  ItemDao.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 29/07/21.
//

import Foundation

class ItemDao {
    func save(_ itens: [Item]){
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: itens, requiringSecureCoding: false )
            guard let caminho = recuperaDiretorio() else { return }
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func recupera() -> [Item]{
        do {
            guard let diretorio = recuperaDiretorio() else { return [] }
            let dados = try Data(contentsOf: diretorio)
            let itensSalvos = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as! [Item]
            return itensSalvos
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("itens")
        
        return caminho
    }
    
}
