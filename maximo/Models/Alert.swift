//
//  Alert.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 28/07/21.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }

    func exibe(titulo: String = "Atenção", mensagem: String = "Erro ao atualizar tabela") {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .cancel, handler: nil)
        alerta.addAction(ok)
        controller.present(alerta, animated: true, completion: nil)
    }
}
