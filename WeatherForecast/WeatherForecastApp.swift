//
//  WeatherForecastApp.swift
//  WeatherForecast
//
//  Created by James Kerrane on 6/4/24.
//

import SwiftUI

@main
struct WeatherForecastApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

extension Sequence where Element: AdditiveArithmetic {
    /// Returns the total sum of all elements in the sequence
    func sum() -> Element { reduce(.zero, +) }
}

extension Collection where Element: BinaryInteger {
    /// Returns the average of all elements in the array
    func average() -> Element { isEmpty ? .zero : sum() / Element(count) }
}
