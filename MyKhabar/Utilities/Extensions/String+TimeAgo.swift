//
//  String+TimeAgo.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 30/01/25.
//

import SwiftUI

extension String {
    
    func timeAgoSinceDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // Input date format
        guard let date = formatter.date(from: self) else { return "" }
        
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date, to: Date())
        
        if let years = components.year, years > 0 {
            return "\(years)y ago"
        } else if let months = components.month, months > 0 {
            return "\(months)mo ago"
        } else if let days = components.day, days > 0 {
            return "\(days)d ago"
        } else if let hours = components.hour, hours > 0 {
            return "\(hours)h ago"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes)m ago"
        } else if let seconds = components.second, seconds > 0 {
            return "\(seconds)s ago"
        } else {
            return "Just now"
        }
    }
}
