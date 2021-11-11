//
//  FormatStyle-LocalCurrency.swift
//  HackingWithSwiftUI
//
//  Created by Sergio Olivares on 11/11/21.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
