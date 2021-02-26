//
//  AssetsConstants.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

// MARK: IMAGES & COLORS (Assets Catalog)

enum Assets {

    // ICONS
    enum Icons: String {
        case Placeholder = "iconPlaceholder"
        case Favorites = "iconFavorites"
        case ListenLater = "iconListenLater"
        case CustomLists = "iconLists"
        case Today = "iconToday"
    }

    // COLORS
    enum Colors: String {
        case Main = "main"
        case TextFieldHint = "textFieldHint"
        case Error = "error"
        case NavigationLink = "navigationLink"
        case PlaceholderSecondary = "placeholderSecondary"
        case CellTextSecondary = "cellTextSecondary"
        case TextDisabled = "textDisabled"
        case Badge = "badge"
        case ProgressBar = "progressBar"
    }
}
