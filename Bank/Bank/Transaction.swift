//
//  Transaction.swift
//  Bank
//
//  Created by Сергей Дятлов on 29.06.2024.
//

import Foundation

struct Transaction {
    enum TransactionType {
        case deposit
        case withdrawal
        case transfer
    }
    
    let transactionType: TransactionType
    let fromAccountId: String?
    let toAccountId: String?
    let amount: Double
    let date: Date
    
    init(transactionType: TransactionType, fromAccountId: String? = nil, toAccountId: String? = nil, amount: Double) {
        self.transactionType = transactionType
        self.fromAccountId = fromAccountId
        self.toAccountId = toAccountId
        self.amount = amount
        self.date = Date()
    }
    
    var description: String {
        switch transactionType {
        case .deposit:
            return "Deposit of \(amount) to account \(toAccountId ?? "") on \(date)"
        case .withdrawal:
            return "Withdrawal of \(amount) from account \(fromAccountId ?? "") on \(date)"
        case .transfer:
            return "Transfer of \(amount) from account \(fromAccountId ?? "") to account \(toAccountId ?? "") on \(date)"
        }
    }
}
