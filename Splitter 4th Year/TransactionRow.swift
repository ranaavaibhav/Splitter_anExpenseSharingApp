//
//  TransactionRow.swift
//  Splitter 4th Year
//
//  Created by Vaibhav on 28/03/25.
//

import SwiftUI
import SwiftUIFontIcon

struct TransactionRow: View {
    var transaction: Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20,style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: .icons),fontsize: 24,color:Color.icon)
                }
            
            
            VStack(alignment: .leading, spacing: 6) {
                // Transaction Merchant
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                
                Text(transaction.dateParsed,format:.dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            Spacer() 
            //MArk Transaction
            Text(transaction.signedAmount,format: .currency(code: "USD"))
                .bold()
                .foregroundColor(transaction.type  ==  TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8) // Proper closing of HStack and VStack
    }
}

// Ensure transactionPreviewData is defined globally
#Preview {
    TransactionRow(transaction: transactionPreviewData)
}
