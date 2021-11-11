//
//  ExpenseItem.swift
//  HackingWithSwiftUI
//
//  Created by Sergio Olivares on 11/11/21.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    
}
