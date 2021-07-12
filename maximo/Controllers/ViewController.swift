//
//  ViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 24/05/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet  var nameTextField: UITextField!
   @IBOutlet var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        let nome  = nameTextField.text ?? ""
        let felicidade  = Int(felicidadeTextField.text ?? "0") ?? 0
        
        let refeicao = Refeicao(nome: nome, felicidade: felicidade)
        
        print("comi \(nome) e fiquei com felicidade: \(felicidade)")
     }
    
   }








