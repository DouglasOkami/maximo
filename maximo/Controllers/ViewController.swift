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
   //MARK: - Atributos
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionarItensDelegate {
    
    //MARK: -IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView?
    
    
    
   //MARK: - Atributos
    var delegate: AdicionarRefeicaoDelegate?
    var itens: [Item] = []
    var itensSelecionados: [Item] = []
    
    @IBOutlet  var nameTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        let botaoAdicionarItem = UIBarButtonItem(title: "adicionar", style: .plain, target: self, action: #selector(adicionarItens))
        navigationItem.rightBarButtonItem = botaoAdicionarItem
        recuperaItens()
    }
    
    func recuperaItens() {
        itens = ItemDao().recupera()
    }
    
    @objc func adicionarItens() {
        let adicionarItensViewController = AdicionarViewController(delegate: self )
        navigationController?.pushViewController(adicionarItensViewController, animated: true)
    }
    func Add(_ item: Item) {
        itens.append(item)
        ItemDao().save(itens)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            Alerta(controller: self).exibe(mensagem: "Erro ao atualizar tabela")
        }
    }
    //MARK: - UITableViewDataSource
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
    // MARK: - UITableViewDelegate
    
    
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
    
    func recuperaRefeicaoDoFormulario() -> Refeicao? {
        guard let nomeDaRefeicao = nameTextField?.text else {
            return nil
        }
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            return nil
        }

       let refeicao = Refeicao(nome: nomeDaRefeicao, felicidade: felicidade, itens: itensSelecionados)
        
        return refeicao
    }
    
    // MARK: - IBActions
    
    @IBAction func adicionar(_ sender: Any) {
        if let refeicao = recuperaRefeicaoDoFormulario() {
            delegate?.add(refeicao)
            navigationController?.popViewController(animated: true) } else {
                Alerta(controller: self).exibe(mensagem: "Erro ao ler dados do formulário")
      }
    }
  }

