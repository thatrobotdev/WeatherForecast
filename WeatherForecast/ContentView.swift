//
//  ContentView.swift
//  WeatherForecast
//
//  Created by James Kerrane on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let highs: [Int] = [81, 60, 15, 31, 82, 72, 45]
        let lows: [Int] = [74, 40, -5, 20, 64, 65, 20]
        
        Text("7-day Forecast")
            .font(.title)
        ScrollView(.horizontal) {
            HStack {
                DayForecast(day: "Mon", isRainy: false, isSnowy: false, high: highs[0], low: lows[0])
                
                DayForecast(day: "Tue", isRainy: true, isSnowy: false, high: highs[1], low: lows[1])
                
                DayForecast(day: "Wed", isRainy: false, isSnowy: true, high: highs[2], low: lows[2])
                
                DayForecast(day: "Thur", isRainy: false, isSnowy: false, high: highs[3], low: lows[3])
                
                DayForecast(day: "Fri", isRainy: false, isSnowy: false, high: highs[4], low: lows[4])
                
                DayForecast(day: "Sat", isRainy: false, isSnowy: false, high: highs[5], low: lows[5])
                
                DayForecast(day: "Sun", isRainy: true, isSnowy: true, high: highs[6], low: lows[6])
            }
            .defaultScrollAnchor(.center)
        }
        .padding()
        
        VStack {
            Text("Summary")
                .font(.title2)
                .padding()
            WeekForecast(startingDay: "6/3/24", endingDay: "6/9/24", highs: highs, lows: lows, daysOfSun: 4, daysOfRain: 2)
        }
    }
}

#Preview {
    ContentView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let isSnowy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        if isRainy {
            return "cloud.rain.fill"
        } else if isSnowy {
            return "snowflake"
        } else {
            return "sun.max.fill"
        }
    }
    
    var iconColor: Color {
        if isRainy || isSnowy {
            return Color.blue
        } else {
            return Color.yellow
        }
    }
    
    var highColor: Color {
        if high > 80 {
            return Color.red
        } else {
            return Color.primary
        }
    }
    
    var body: some View {
        VStack {
            Text(day)
                .font(.headline)
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(Font.largeTitle)
                .padding(5)
            Text("High: \(high)º")
                .fontWeight(Font.Weight.semibold)
                .foregroundColor(highColor)
            Text("Low: \(low)º")
                .fontWeight(Font.Weight.medium)
                .foregroundStyle(Color.secondary)
        }
        .padding(2)
    }
}

struct WeekForecast: View {
    let startingDay: String
    let endingDay: String
    let highs: [Int]
    let lows: [Int]
    let daysOfSun: Int
    let daysOfRain: Int
    
    
    var body: some View {
        VStack {
            Text("\(startingDay)–\(endingDay)")
                .font(.headline)
            Text("Average Low: \(lows.average())")
            Text("Average High: \(highs.average())")
            Text("Days of Sun: \(daysOfSun)")
            Text("Days of Rain: \(daysOfSun)")
        }
    }
}
