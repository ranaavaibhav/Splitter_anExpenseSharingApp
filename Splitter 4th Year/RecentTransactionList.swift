import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionLVM: TransactionListViewModel

    var body: some View {
        VStack {
            HStack {
                Text("Recent Transactions")
                    .bold()
                
                Spacer()
                
                NavigationLink(destination: TransactionListView()) {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(Color.Text)
                }
            }
            .padding(.top)
            
            ForEach(Array(transactionLVM.transactions.prefix(5).enumerated()), id: \.element) { index, transaction in
                TransactionRow(transaction: transaction)
                if index != 4 { // Show divider except for the last item
                    Divider()
                }
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionLVM: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        viewModel.transactions = transactionListPreviewData
        return viewModel
    }()
    
    static var previews: some View {
        RecentTransactionList()
            .environmentObject(transactionLVM)
    }
}
