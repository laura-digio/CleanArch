//
//  CustomViewStyle.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import SwiftUI

struct ExampleButtonStyle: PrimitiveButtonStyle {
    let backgroundColor: Assets.Colors

    func makeBody(configuration: Self.Configuration) -> some View {
        Button(action: configuration.trigger, label: {
            configuration.label
                .frame(maxWidth: .infinity)
                .padding([.top, .bottom], 10)
                .background(Color(backgroundColor.rawValue))
                .cornerRadius(9)
        })
        .buttonStyle(PlainButtonStyle())
    }
}
