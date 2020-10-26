//
//  ListDataManager.swift
//  CleanArch
//
//  Created by Laura on 16/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class ListDataManager: UITableViewDataSource {

    var data: [ListItem]

    init(data: [ListItem]) {
        self.data = data
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.sections[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = data.sections[indexPath.section].items[indexPath.row]
        let interactor = SettingsCellInteractor(settingsItem: settingsItem)
        let presenter = SettingsCellPresenter(interactor: interactor)
        
        switch settingsItem.type {
        case .rightDetail:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCellRightDetail.reuseIdentifier, for: indexPath) as? SettingsCellRightDetail {
                cell.presenter = presenter
                return cell
            }
        case .rightDisclosure:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCellRightDisclosure.reuseIdentifier, for: indexPath) as? SettingsCellRightDisclosure {
                cell.presenter = presenter
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.reuseIdentifier, for: indexPath) as? SettingsCell {
                cell.presenter = presenter
                return cell
            }
        }
        fatalError("No cell for reuseIdentifier SettingsCell or derivatives")
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.sections[section].headerTitle
    }
}

extension SettingsDataManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 2 ? 100 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 56 : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section != 1 { return nil }
        
        guard let footer = tableView.dequeueReusableHeaderFooterView(withIdentifier: SettingsFooter.reuseIdentifier) as? SettingsFooter else {
            fatalError("No footer for reuseIdentifier \(SettingsFooter.reuseIdentifier)")
        }
        
        let interactor = SettingsFooterInteractor()
        footer.presenter = SettingsFooterPresenter(interactor: interactor)
        return footer
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.userWantToShowDetailAtIndexPath(indexPath)
    }
}
