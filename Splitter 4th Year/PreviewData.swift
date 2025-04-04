//
//  PreviewData.swift
//  Splitter 4th Year
//
//  Created by Vaibhav on 28/03/25.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(
    id: 1,
    date: "01/02/2002", // Ensure the date format matches your expected format
    institution: "hello",
    account: "vaibhav",
    merchant: "Apple",
    amount: 234.33, // Remove the `$` sign
    type: "debit",
    categoryId: 801,
    category: "hero",
    isPending: false,
    isTransfer: false,
    isExpense: true,
    isEdited: false
)
var transactionListPreviewData =  [Transaction](repeating:transactionPreviewData,count: 10)

