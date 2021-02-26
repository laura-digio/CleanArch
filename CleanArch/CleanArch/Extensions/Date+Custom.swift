//
//  Date+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension Date {

    func pretty() -> String {
        var output = ""

        let dateUpload = Calendar.current.startOfDay(for: self)
        guard let days = Calendar.current.dateComponents([.day], from: dateUpload, to: Date()).day else { return output }
        guard let months = Calendar.current.dateComponents([.month], from: dateUpload, to: Date()).month else { return output }
        guard let years = Calendar.current.dateComponents([.year], from: dateUpload, to: Date()).year else { return output }

        if years > 0 {
            let formatString = NSLocalizedString("audio years count", comment: "")
            output = String.localizedStringWithFormat(formatString, years)
        }
        else if months > 0 {
            let formatString = NSLocalizedString("audio months count", comment: "")
            output = String.localizedStringWithFormat(formatString, months)
        }
        else if days > 0 {
            let formatString = NSLocalizedString("audio days count", comment: "")
            output = String.localizedStringWithFormat(formatString, days)
        }
        else {
            output = "today".localized()
        }

        return output
    }
}
