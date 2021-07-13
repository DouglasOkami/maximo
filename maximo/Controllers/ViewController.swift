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
        if let nomeDaRefeicao = nameTextField?.text, let felicidadeDaRefeicao =
            felicidadeTextField?.text {
            let nome = nomeDaRefeicao
            if let felicidade = Int (felicidadeDaRefeicao) {
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
                print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.nome)")
            } else {
                print("erro ao tentar criar a refeicao")
            }
        }
    }
}
