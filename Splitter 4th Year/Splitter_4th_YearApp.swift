//
//  Splitter_4th_YearApp.swift
//  Splitter 4th Year
//
//  Created by Vaibhav on 28/03/25.
//

import SwiftUI

@main
struct Splitter_4th_YearApp: App {
    @StateObject var transactionLVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionLVM)
        }
    }
}
