//
//  TransactionListViewModel.swift
//  Splitter 4th Year
//
//  Created by Vaibhav on 29/03/25.
//

import Foundation
import Combine

typealias TransactionGroup = [String:[Transaction]]

final class TransactionListViewModel:ObservableObject  {
    @Published var transactions:[Transaction] = []
    private var cancellables = Set<AnyCancellable>()
    init(){
        getTransactions()
        
    }
    func getTransactions()  {
        guard let url  = URL(string: "https://designcode.io/data/transaction.json")else{
            print("invalidURL")
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap{(data,response)->Data in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else {
                    dump(response)
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type:[Transaction].self, decoder:JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink{completion in
                            switch completion {
                            case .failure(let error):
                                print("Error fetching transactions:",error.localizedDescription)
                            case .finished:
                                print("finished")
                                
                            }
                        } receiveValue: { [weak self] result in
                            self?.transactions = result
                            dump(self?.transactions)
                        }
                       
                        .store(in:  &cancellables)
            
        
    }
    func groupTransationByMonth() -> TransactionGroup{
        guard !transactions.isEmpty else {return[:]}
        let groupedTransactions = TransactionGroup(grouping: transactions) { $0.month }
        
        return groupedTransactions
        
    }
}
