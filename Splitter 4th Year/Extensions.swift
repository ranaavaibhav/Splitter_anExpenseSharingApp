import SwiftUI

import Foundation

extension Color {
    static let Background = Color("Background")
    static let Icon = Color("Icon")
    static let Text = Color("Text")
    static let systemBackground = Color(.systemBackground)
    
}
extension DateFormatter{
    static let allNumbericUSA:  DateFormatter  = {
        print("initializing Data Formattor")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
        
    }()
}

extension String {
    func dateParsed()-> Date{
        guard let parsedDate = DateFormatter.allNumbericUSA.date(from: self) else {
            return Date()
        }
        return parsedDate
        
    }
}
