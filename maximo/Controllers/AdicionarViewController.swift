//
//  AdicionarViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 26/07/21.
//

import UIKit

protocol AdicionarItensDelegate {
    func Add(_ item: Item)
}

class AdicionarViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var CaloriasTextField: UITextField!
    
    //MARK: - Atributos
    
    var delegate: AdicionarItensDelegate?
    
    init(delegate: AdicionarItensDelegate ) {
        super.init(nibName: "AdicionarViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder )
    }
    
    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBAction
    
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField.text, let calorias = CaloriasTextField.text else {
            return
        }
        
        if let numeroDeCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroDeCalorias)
            
            delegate?.Add(item)
            navigationController?.popViewController(animated: true)
        }
    }
    
    // optional chaining 

}
