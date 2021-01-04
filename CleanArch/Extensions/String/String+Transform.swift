//
//  String+Transform.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
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
}
