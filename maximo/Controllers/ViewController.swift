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
   // MARK: - Atributos
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItensDelegate {
    
    //MARK: -IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView!
    
    
    
   // MARK: - Atributos
    var delegate: AdicionarRefeicaoDelegate?
//    var itens: [String] = ["Molho de tomate","Queijo","Molho apimentado","Manjericao"]
    var itens: [Item] = [Item(nome: "Molho de tomate", calorias: 40.0),Item(nome: "Queijo", calorias: 40.0),Item(nome: "Molho de pimenta", calorias: 40.0),Item(nome: "Manjericao", calorias: 40.0)]
    
    var itensSelecionados: [Item] = []
    
    @IBOutlet  var nameTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarViewController(delegate: self )
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func Add(_ item: Item) {
        itens.append(item)
        itensTableView.reloadData()
    }
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let linhaDaTabela = indexPath.row
        let item = itens[linhaDaTabela]
        
        celula.textLabel?.text = item.nome
        
        return celula
    }
    // MARK: UITableViewDelegate
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else {return}
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            let linhaDaTabela = indexPath.row
            itensSelecionados.append( itens[linhaDaTabela])
        } else {
            celula.accessoryType = .none
            
            let item = itens[indexPath.row]
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
                
                // Teste
                
                for itemSelecionado in itensSelecionados {
                    print(itemSelecionado.nome)
                }
            }
        }
    }
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        
       
        guard let nomeDaRefeicao = nameTextField?.text else {
         return
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return
        }

       let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        
        
        print ("comi \(refeicao.nome) e fiquei com felicidade: \(refeicao.felicidade)")
        
        delegate?.add(refeicao)
        navigationController?.popViewController(animated: true)
    }
  }

