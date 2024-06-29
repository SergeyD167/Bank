//
//  Bank.swift
//  Bank
//
//  Created by Сергей Дятлов on 29.06.2024.
//

import Foundation

class Bank {
    var accounts: [String: Account] = [:]
    var transactions: [Transaction] = []
    
    func addAccount(accountId: String, initialBalance: Double = 0) -> Bool {
        if accounts[accountId] == nil {
            accounts[accountId] = Account(accountId: accountId, initialBalance: initialBalance)
            return true
        }
        return false
    }
    
    func getAccount(accountId: String) -> Account? {
        return accounts[accountId]
    }
    
    func deposit(accountId: String, amount: Double) -> Bool {
        if let account = getAccount(accountId: accountId) {
            if account.deposit(amount: amount) {
                let transaction = Transaction(transactionType: .deposit, toAccountId: accountId, amount: amount)
                transactions.append(transaction)
                return true
            }
        }
        return false
    }
    
    func transfer(fromAccountId: String, toAccountId: String, amount: Double) -> Bool {
        if let fromAccount = getAccount(accountId: fromAccountId),
           let toAccount = getAccount(accountId: toAccountId),
           fromAccount.withdraw(amount: amount) {
            if toAccount.deposit(amount: amount) {
                let transaction = Transaction(transactionType: .transfer, fromAccountId: fromAccountId, toAccountId: toAccountId, amount: amount)
                transactions.append(transaction)
                return true
            }
        }
        return false
    }
    
    func printAccounts() {
        for account in accounts.values {
            print(account.description)
        }
    }
    
    func printTransactions() {
        for transaction in transactions {
            print(transaction.description)
        }
    }
}
