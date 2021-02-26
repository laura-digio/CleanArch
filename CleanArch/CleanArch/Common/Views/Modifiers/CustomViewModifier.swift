//
//  CustomViewModifier.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import SwiftUI


struct CustomTextModifier: ViewModifier {
    let disabled: Bool

    init(disabled: Bool = false) {
        self.disabled = disabled
    }

    func body(content: Content) -> some View {
        content
            .foregroundColor(disabled ? Color(Assets.Colors.TextDisabled.rawValue) : .white)
    }
}
