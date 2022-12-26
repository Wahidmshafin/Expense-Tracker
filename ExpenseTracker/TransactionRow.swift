//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Patricia Ong on 6/8/22.
//

import SwiftUI
import SwiftUIFontIcon // Added Package, Imported from https://github.com/huybuidac/SwiftUIFontIcon

struct TransactionRow: View {
    // Call Transaction struct in Transaction Model.
    // Takes a property called transaction of type Transaction.
    var transaction : Transaction
    
    var body: some View {
        // Body
        HStack(spacing: 20){
            // Category Icon
            VStack(alignment: .leading, spacing: 6) {
                // Transaction : Merchant
                Text(transaction.title)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1) // Limit the amount of lines of text.
                
                // Transaction : Category
                Text(transaction.details)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(3)
                
                // Transaction : Date
                Text(transaction.dateParsed, format: .dateTime.year().month().day()) // Format property the Date since it only accepts a string.
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            } // VStack End
            
            Spacer()
            
            // Transaction : Amount
            Text(transaction.signedAmount, format: .currency(code: "USD"))
                .bold()
                // Depends on the transaction type. If debit, choose primary. If credit, custom color.
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text : .primary)
            
        }// HStack End
        .padding([.top, .bottom], 8) // For row spacing, added an array with top and bot.
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionRow(transaction: transactionPreviewData)
            TransactionRow(transaction: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
