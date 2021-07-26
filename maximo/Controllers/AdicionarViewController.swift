//
//  AdicionarViewController.swift
//  maximo
//
//  Created by r.da.silva.ferreira on 26/07/21.
//

import UIKit

class AdicionarViewController: UIViewController {

    //MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBAction
    
    
    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
