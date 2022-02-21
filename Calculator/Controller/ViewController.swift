//
//  ViewController.swift
//  Calculator
//
//  Created by Zoltán Gál on 2022. 02. 21..
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber : Bool = true
    private var calcuator = CalculatorLogic()
    
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failed to Convert")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
    
        isFinishedTypingNumber = true
       
        calcuator.setNumber(displayValue)
        
        if let calcMethod =  sender.currentTitle {
            
           if  let result =  calcuator.calculate(symbol: calcMethod)  {
                displayValue = result
            }
           
            
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text =  numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." && displayLabel.text!.contains(".")  {
                    
                        return
                    }
                displayLabel.text =  displayLabel.text! + numValue
                }
                
                
            }
            
        }
    }
