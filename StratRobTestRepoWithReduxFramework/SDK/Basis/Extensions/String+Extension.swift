//
//  String+Extension.swift
//  Bruce
//
//  Created by Rob on 26/10/2017.
//  Copyright © 2017 Henrik. All rights reserved.
//

import Foundation

// MARK: String Extension

extension String {
    
    public func isNumber() -> Bool {
        return (NumberFormatter().number(from: self)?.doubleValue) != nil
    }
    
    public static func localized(_ key: String, comment: String) -> String {
        let suffix = "Vouvoying"//tu ? "Tutoying" : "Vouvoying"
        return NSLocalizedString("\(key)\(suffix)", comment: comment) == "\(key)\(suffix)" ? NSLocalizedString(key, comment: comment) : NSLocalizedString("\(key)\(suffix)", comment: comment)
    }
    
    public func substring(from: Int?, to: Int?) -> String {
        if let start = from {
            guard start < self.count else {
                return ""
            }
        }
        if let end = to {
            guard end >= 0 else {
                return ""
            }
        }
        if let start = from, let end = to {
            guard end - start >= 0 else {
                return ""
            }
        }
        let startIndex: String.Index
        if let start = from, start >= 0 {
            startIndex = self.index(self.startIndex, offsetBy: start)
        } else {
            startIndex = self.startIndex
        }
        let endIndex: String.Index
        if let end = to, end >= 0, end < self.count {
            endIndex = self.index(self.startIndex, offsetBy: end + 1)
        } else {
            endIndex = self.endIndex
        }
        return String(self[startIndex ..< endIndex])
    }
    
    public func substring(from: Int) -> String {
        return self.substring(from: from, to: nil)
    }
    
    public func substring(to: Int) -> String {
        return self.substring(from: nil, to: to)
    }
    
    public func substring(from: Int?, length: Int) -> String {
        guard length > 0 else {
            return ""
        }
        let end: Int
        if let start = from, start > 0 {
            end = start + length - 1
        } else {
            end = length - 1
        }
        return self.substring(from: from, to: end)
    }
    
    public func substring(length: Int, to: Int?) -> String {
        guard let end = to, end > 0, length > 0 else {
            return ""
        }
        let start: Int
        if let end = to, end - length > 0 {
            start = end - length + 1
        } else {
            start = 0
        }
        return self.substring(from: start, to: to)
    }
    
    public func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.height)
    }
    
    public func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: height, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }

    public var lowercasedAndStripped: String {
        return self.lowercased().folding(options: .diacriticInsensitive, locale: .current).trimmingCharacters(in: .whitespaces)
    }
    
}
