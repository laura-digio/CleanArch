//
//  BaseView.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation
import SwiftUI

public protocol BaseView: View {
    associatedtype Output
    var output: Output? { get set }
}
