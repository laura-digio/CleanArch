//
//  ListContentView.swift
//  CleanArch
//
//  Created by Laura on 15/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit
import SnapKit

final class ListSnapView: UIView {
    private lazy var tableView = UITableView()

    // Initialized from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    // Initialized from IB
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
}

extension ListSnapView {
    private func setupView() {
        backgroundColor = .white

        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
}
