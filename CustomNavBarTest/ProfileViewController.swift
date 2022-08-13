//
//  ProfileViewController.swift
//  InstallerAppNavBarExample
//
//  Created by Danny Tsang on 8/13/22.
//

import UIKit

class ProfileViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "Profile View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        view.backgroundColor = .systemGreen 
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])

    }

}
