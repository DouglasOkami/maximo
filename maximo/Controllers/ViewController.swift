//
//  ViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 24/05/21.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet  var nameTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {
       
        guard let nomeDaRefeicao = nameTextField?.text else {
         return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

       let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print ("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
    }
}
