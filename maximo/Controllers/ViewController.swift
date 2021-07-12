//
//  ViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 24/05/21.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet  var nameTextField: UITextField!
   @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
  
        let nome = nameTextField.text
        let felicidade : Int! = Int(felicidadeTextField.text!)
        
        let refeicao = Refeicao(nome: nome!, felicidade: felicidade)
        
        
        
        print("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.nome)")
     }
    
   }








