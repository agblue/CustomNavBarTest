//
//  ScheduleViewController.swift
//  InstallerAppNavBarExample
//
//  Created by Danny Tsang on 8/13/22.
//

import UIKit

class ScheduleViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Schedule View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        view.backgroundColor = .systemOrange
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }

}
