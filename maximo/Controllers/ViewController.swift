//
//  ViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 24/05/21.
//

import UIKit

protocol AdicionarRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}
   // Mark: - Atributos
class ViewController: UIViewController, UITableViewDataSource {
    
    
   // Mark: - IBOutlet
    var delegate: AdicionarRefeicaoDelegate?
    var itens: [String] = ["Molho de tomate","Queijo","Molho apimentado","Manjericao"]
    
    @IBOutlet  var nameTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // Mark : - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item
        
        return celula
    }
    // MArk: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
       
        guard let nomeDaRefeicao = nameTextField?.text else {
         return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

       let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade)
        print ("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
}
