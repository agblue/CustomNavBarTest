//
//  InstallationsViewController.swift
//  InstallerAppNavBarExample
//
//  Created by Danny Tsang on 8/13/22.
//

import UIKit

class TravelViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Travel View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .systemRed
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }

}
