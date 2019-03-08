//
//  Date+Extension.swift
//  Bruce
//
//  Created by Rob on 26/10/2017.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

// MARK: Day Representation

enum Day: Int {
    // Don't get tricked: with Gregorian calendar
    // day 1 of the week is sunday and not monday :/
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    
    public var frenchName: String {
        switch self {
        case .monday:
            return "Lundi"
        case .tuesday:
            return "Mardi"
        case .wednesday:
            return "Mercredi"
        case .thursday:
            return "Jeudi"
        case .friday:
            return "Vendredi"
        case .saturday:
            return "Samedi"
        case .sunday:
            return "Dimanche"
        }
    }
    
    public var shorterFrenchName: String {
        let index = self.frenchName.index(self.frenchName.startIndex, offsetBy: 3)
        return String(self.frenchName[..<index])
    }
    
}

// MARK: Month Representation

enum Month: Int {
    case january = 1
    case february
    case march
    case april
    case may
    case june
    case july
    case august
    case september
    case october
    case november
    case december
    
    public var frenchName: String {
        switch self {
        case .january:
            return "Janvier"
        case .february:
            return "Février"
        case .march:
            return "Mars"
        case .april:
            return "Avril"
        case .may:
            return "Mai"
        case .june:
            return "Juin"
        case .july:
            return "Juillet"
        case .august:
            return "Août"
        case .september:
            return "Septembre"
        case .october:
            return "Octobre"
        case .november:
            return "Novembre"
        case .december:
            return "Décembre"
        }
    }
    
    public var shortFrenchName: String {
        switch self {
        case .january:
            return "Jan."
        case .february:
            return "Fév."
        case .march:
            return "Mars"
        case .april:
            return "Avr."
        case .may:
            return "Mai"
        case .june:
            return "Jui."
        case .july:
            return "Jul."
        case .august:
            return "Août"
        case .september:
            return "Sep."
        case .october:
            return "Oct."
        case .november:
            return "Nov."
        case .december:
            return "Déc."
        }
    }
    
}

// MARK: Date Extension

extension Date {
    
    public func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? Int.max
    }
    
    public var firstDayOfMonth: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.date(from: cal.dateComponents([.year, .month], from: self))
    }
    
    public var firstDayOfYear: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        return cal.date(from: cal.dateComponents([.year], from: self))
    }
    
    public var frenchDay: String {
        return Day(rawValue: Calendar.current.dateComponents([.weekday], from: self).weekday ?? 0)?.frenchName ?? ""
    }
    
    public func isToday() -> Bool {
        return Calendar.autoupdatingCurrent.isDateInToday(self)
    }
    
    public func isYesterday() -> Bool {
        return Calendar.autoupdatingCurrent.isDateInYesterday(self)
    }
    
    public var lastDayOfMonth: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        var comps = DateComponents()
        comps.month = 1
        comps.day = -1
        return cal.date(byAdding: comps, to: cal.date(from: cal.dateComponents([.year, .month], from: self))!)
    }
    
    public var lastDayOfYear: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        let year = cal.component(.year, from: Date())
        return cal.date(byAdding: .day, value: -1, to: cal.date(from: DateComponents(year: year + 1, month: 1, day: 1))!)
    }
    
    public var humanReadable: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: Locale.current.identifier)
        return formatter.string(from: self)
    }
    
    public var monthDay: String {
        return "\(Calendar.current.dateComponents([.day], from: self).day!)"
    }
   
    public var monthName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    public var mondayOfWeek: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        comps.weekday = 2 // Monday
        return cal.date(from: comps)
    }
    
    public var shorterFrenchDay: String {
        return Day(rawValue: Calendar.current.dateComponents([.weekday], from: self).weekday ?? 0)?.shorterFrenchName ?? ""
    }
    
    public var sundayOfWeek: Date? {
        var cal = Calendar.current
        cal.timeZone = TimeZone(secondsFromGMT: 0)!
        var comps = cal.dateComponents([.weekOfYear, .yearForWeekOfYear], from: self)
        comps.weekday = 1 // Sunday
        return cal.date(from: comps)
    }
    
    public static var previousWeekDate: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    }
    
}
