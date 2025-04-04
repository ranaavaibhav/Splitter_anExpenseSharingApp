import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.Background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Notification
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.Icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionLVM: TransactionListViewModel = {
        let viewModel = TransactionListViewModel()
        viewModel.transactions = transactionListPreviewData
        return viewModel
    }()
    
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(transactionLVM)
    }
}
