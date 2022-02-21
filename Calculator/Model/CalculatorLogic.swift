//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Zoltán Gál on 2022. 02. 21..
//

import Foundation

struct CalculatorLogic {
    
    private var number : Double?
    
    private var intermiediateCalculation : (n1 : Double, calcMethod : String)?
    mutating func setNumber(_ number : Double) {
        self.number = number
        }
    
    mutating func calculate(symbol : String) -> Double? {
        if let n = number {
            switch  symbol {
            case "+/-" :
                return n * -1
            case "AC" :
                return 0
            case "%" :
                return n * 0.01
            case "=" :
               return performTwoNumberCalc(n2 : n)
            default :
                intermiediateCalculation = (n1: n, calcMethod : symbol)
            }
        
        
           
        
        }
        return nil
        
        
    }
    
    private func performTwoNumberCalc(n2: Double) -> Double? {
        if let n1 = intermiediateCalculation?.n1,
           let operation = intermiediateCalculation?.calcMethod {
            switch operation {
            case "+" :
                return n1 + n2
            case "-" :
                return n1 - n2
            case "×" :
                return n1 * n2
            case "÷" :
                return n1 / n2
            default :
                fatalError("Error Calculating")
            }
        
    }
        return nil
}
}

