//
//  TransactionModel.swift
//  Splitter 4th Year
//
//  Created by Vaibhav on 28/03/25.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable {
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon:FontAwesomeCode{
        if let category = Category.all.first(where: {$0.id == self.categoryId}){
            return category.icon
            
        }
        return .question
    }

    var dateParsed: Date {
        date.dateParsed()
    }

    var signedAmount: Double {
        return type == TransactionType.debit.rawValue ? -amount : amount
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    let mainCategoryId: Int?

    init(id: Int, name: String, icon: FontAwesomeCode, mainCategoryId: Int? = nil) {
        self.id = id
        self.name = name
        self.icon = icon
        self.mainCategoryId = mainCategoryId
    }
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: .car)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: .utensils)
    static let home = Category(id: 6, name: "Home", icon: .home)
    static let income = Category(id: 7, name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: .exchange_alt)

    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", icon: .mobile, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", icon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon: .money_bill, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: .credit_card, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", icon: .home, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: .money_check, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", icon: .laptop, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: .credit_card, mainCategoryId: 9)
}

extension Category {
    static let categories : [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    static let subCategories : [Category] = [
        .publicTransportation,
        .rent,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .creditCardPayment ,
        .shopping,
        .transfer,
        .paycheque,
        .software
      
        
        
        
    ]
    static let all:[Category] = categories + subCategories
}
