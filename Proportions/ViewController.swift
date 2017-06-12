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
    @IBOutlet weak var valueTwo: UITextField!
    @IBOutlet weak var unitTwo: UITextField!
    @IBOutlet weak var valueThree: UITextField!
    @IBOutlet weak var unitThree: UITextField!
    @IBOutlet weak var valueFour: UITextField!
    @IBOutlet weak var unitFour: UITextField!
    @IBOutlet weak var valueFive: UITextField!
    @IBOutlet weak var unitFive: UITextField!
    @IBOutlet weak var resultTwo: UILabel!
    @IBOutlet weak var resultThree: UILabel!
    @IBOutlet weak var resultFour: UILabel!
    @IBOutlet weak var resultFive: UILabel!
    
    var min = 100.00
    
    @IBAction func calcular(_ sender: Any)
    {
        resultOne.text = calculaProporcao(valor: valueOne, unit: unitOne)
        resultTwo.text = calculaProporcao(valor: valueTwo, unit: unitTwo)
        resultThree.text = calculaProporcao(valor: valueThree, unit: unitThree)
        resultFour.text = calculaProporcao(valor: valueFour, unit: unitFour)
        resultFive.text = calculaProporcao(valor: valueFive, unit: unitFive)
        
        switch String(min) {
        case resultOne.text!:
            resultOne.textColor = UIColor.blue
        case resultTwo.text!:
            resultTwo.textColor = UIColor.blue
        case resultThree.text!:
            resultThree.textColor = UIColor.blue
        case resultFour.text!:
            resultFour.textColor = UIColor.blue
        case resultFive.text!:
            resultFive.textColor = UIColor.blue
        default:
            break
        }
        
        let standard = UserDefaults.standard
        let keyOne = "FirstKey"
        let keyTwo = "SecondKey"
        let keyThree = "ThirdKey"
        let keyFour = "FourthKey"
        let keyFive = "FifthKey"
        let keySix = "SixthKey"
        let keySeven = "SeventhKey"
        let keyEight = "EightKey"
        let keyNine = "NingthKey"
        let keyTen = "TenthKey"
        
        standard.synchronize()
        
        standard.setValue (unitOne.text, forKey: keyOne)
        standard.setValue (valueOne.text, forKey: keyTwo)
        standard.setValue (unitTwo.text, forKey: keyThree)
        standard.setValue (valueTwo.text, forKey: keyFour)
        standard.setValue (unitThree.text, forKey: keyFive)
        standard.setValue (valueThree.text, forKey: keySix)
        standard.setValue (unitFour.text, forKey: keySeven)
        standard.setValue (valueFour.text, forKey: keyEight)
        standard.setValue (unitFive.text, forKey: keyNine)
        standard.setValue (valueFive.text, forKey: keyTen)
    }
    
    @IBOutlet weak var dollarTen: UILabel!
    @IBOutlet weak var dollarFiver: UILabel!
    @IBOutlet weak var unFive: UILabel!
    @IBAction func ocultar(_ sender: Any)
    {
        resultFive.isHidden = true
        valueFive.isHidden = true
        unitFive.isHidden = true
        dollarFiver.isHidden = true
        unFive.isHidden = true
        dollarTen.isHidden = true
    }
    
    @IBAction func mostrar(_ sender: Any)
    {
        resultFive.isHidden = false
        valueFive.isHidden = false
        unitFive.isHidden = false
        dollarFiver.isHidden = false
        unFive.isHidden = false
        dollarTen.isHidden = true
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let standard = UserDefaults.standard
        if let standardUnitOne = standard.string(forKey: "FirstKey") {
            unitOne.text = standardUnitOne
        }
        else
        {
            unitOne.text = ""
        }
        if let StandardValueOne = standard.string(forKey: "SecondKey") {
            valueOne.text = StandardValueOne
        }
        else
        {
            valueOne.text = ""
        }
        if let standardUnitOne = standard.string(forKey: "ThirdKey") {
            unitTwo.text = standardUnitOne
        }
        else
        {
            unitTwo.text = ""
        }
        if let StandardValueOne = standard.string(forKey: "FourthKey") {
            valueTwo.text = StandardValueOne
        }
        else
        {
            valueTwo.text = ""
        }
        if let standardUnitOne = standard.string(forKey: "FifthKey") {
            unitThree.text = standardUnitOne
        }
        else
        {
            unitThree.text = ""
        }
        if let Standard = standard.string(forKey: "SixthKey") {
            valueThree.text = Standard
        }
        else
        {
            valueThree.text = ""
        }
        if let standard = standard.string(forKey: "SeventhKey") {
            unitFour.text = standard
        }
        else
        {
            unitFour.text = ""
        }
        if let Standard = standard.string(forKey: "EightKey") {
            valueFour.text = Standard
        }
        else
        {
            valueFour.text = ""
        }
        if let standard = standard.string(forKey: "NingthKey") {
            unitFive.text = standard
        }
        else
        {
            unitFive.text = ""
        }
        if let Standard = standard.string(forKey: "TenthKey") {
            valueFive.text = Standard
        }
        else
        {
            valueFive.text = ""
        }
        calcular((Any).self)
    }

    private func calculaProporcao(valor: UITextField, unit: UITextField) -> String
    {
        if let valueFloat = Double(valor.text!.replacingOccurrences(of: ",", with: "."))
        {
        if let unitFloat = Double(unit.text!)
           {
            let resultado = ((round((valueFloat/unitFloat)*100000))/100)
            if min >= resultado
            {
               min = resultado
            }
            return String(resultado)
            }
        return "0,0"
        }
        return "0,0"
    }

}

