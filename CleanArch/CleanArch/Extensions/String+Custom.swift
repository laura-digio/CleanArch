//
//  String+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension String {
    
    func transform(value: Any) -> String {
        if let array = value as? Array<Any> {
            return array.enumerated().map({ "\(self.encode())[\($0.offset)]=\("\($0.element)".encode())" }).joined(separator: "&")
        }
        return "\(self)=\(encode("\(value)"))"
    }
    
    private func encode(_ string: String? = nil) -> String {
        return "\(string ?? self)".addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] ").inverted)!
    }

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }

    static func random(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
