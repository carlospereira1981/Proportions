//
//  ViewController.swift
//  Proportions
//
//  Created by Carlos Pereira on 6/4/17.
//  Copyright © 2017 Carlos Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultOne: UILabel!
    @IBOutlet weak var unitOne: UITextField!
    @IBOutlet weak var valueOne: UITextField!
    
    @IBAction func calcular(_ sender: Any)
    {
        let valueOneFloat = Float(valueOne.text!.replacingOccurrences(of: ",", with: "."))
        let unitOneFloat = Float(unitOne.text!)
        let resultOneFloat = ((valueOneFloat!/unitOneFloat!)*1000)
        resultOne.text = String(resultOneFloat)
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    }



}

