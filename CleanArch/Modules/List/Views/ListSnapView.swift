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

    private lazy var table = UITableView()

    /*let topView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        view.backgroundColor = UIColor.redColor()
        return view
    }()*/

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
    }
}
