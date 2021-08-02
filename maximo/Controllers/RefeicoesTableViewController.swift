//
//  RefeicoesTableViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 21/07/21.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionarRefeicaoDelegate{
    private let dao = RefeicaoDao()
    var refeicoes: [Refeicao] = []
    
    override func viewDidLoad() {
        refeicoes = dao.recupera()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostrarDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    func add(_ refeicao: Refeicao){
        refeicoes.append(refeicao)
        tableView.reloadData()
        dao.save(refeicoes)
}
    
    @objc func mostrarDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else { return }
            let refeicao = refeicoes[indexPath.row]
            
            RemoveRefeicaoViewController(controller: self).exibe(refeicao, handler: { [self] alerta in
                refeicoes.remove(at: indexPath.row)
                dao.save(refeicoes)
                tableView.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
      }
    }
  }
}
