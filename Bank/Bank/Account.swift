//
//  Account.swift
//  Bank
//
//  Created by Сергей Дятлов on 29.06.2024.
//

import Foundation

class Account: AccountProtocol {
    var accountID: String
    var balance: Double
    
    init(accountID: String, initialBalance: Double = 0) {
        self.accountID = accountID
        self.balance = initialBalance
    }
    
    func deposit(amount: Double) -> Bool {
        if amount > 0 {
            balance += amount
            return true
        }
        return false
    }
    
    func withdraw(amount: Double) -> Bool {
        if amount > 0 && amount <= balance {
            balance -= amount
            return true
        }
        return false
    }
    
    deinit {
        print("Account \(accountID) is being deinitialized")
    }
    
    var description: String {
        return "Account \(accountID): Balance = \(balance)"
    }
}


protocol AccountProtocol {
    var accountID: String {get}
    var balance: Double {get set}
    
    func deposit(amount: Double) -> Bool
    func withdraw(amount: Double) -> Bool
}
