//
//  MainViewController.swift
//  InstallerAppNavBarExample
//
//  Created by Danny Tsang on 8/13/22.
//

import UIKit

class MainViewController: UIViewController {

    var scheduleVC: ScheduleViewController?
    var travelVC: TravelViewController?


    let label: UILabel = {
        let label = UILabel()
        label.text = "Main View"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let tabView: CustomTabView = {
        let tabView = CustomTabView()
        tabView.translatesAutoresizingMaskIntoConstraints = false
        return tabView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
        setupTabView()
    }

    func setupView() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        view.addSubview(label)
        view.addSubview(tabView)


        NSLayoutConstraint.activate([

            tabView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
            tabView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
            tabView.topAnchor.constraint(equalTo: view.topAnchor, constant: 32.0),
            tabView.heightAnchor.constraint(equalToConstant: 76.0),

            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),

        ])
    }

    func setupTabView() {
        // Setup Shadow
        tabView.layer.shadowRadius = 2.0
        tabView.layer.shadowOpacity = 0.5
        tabView.layer.shadowColor = UIColor.black.cgColor
        tabView.layer.shadowOffset = CGSize.init(width: 2.0, height: 2.0)

        // Setup Actions
        tabView.scheduleAction = {
            if self.scheduleVC == nil {
                let scheduleVC = ScheduleViewController()
                self.addChild(scheduleVC)
                scheduleVC.view.translatesAutoresizingMaskIntoConstraints = false
                self.view.insertSubview(scheduleVC.view, belowSubview: self.tabView)
                scheduleVC.didMove(toParent: self)
                self.scheduleVC = scheduleVC

                NSLayoutConstraint.activate([
                    scheduleVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    scheduleVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    scheduleVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                    scheduleVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
            } else {
                self.scheduleVC!.view.removeFromSuperview()
                self.view.insertSubview(self.scheduleVC!.view, belowSubview: self.tabView)

                NSLayoutConstraint.activate([
                    self.scheduleVC!.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    self.scheduleVC!.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    self.scheduleVC!.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                    self.scheduleVC!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
            }

        }

        tabView.installationAction = {
            if self.travelVC == nil {
                let travelVC = TravelViewController()

                self.addChild(travelVC)
                travelVC.view.translatesAutoresizingMaskIntoConstraints = false
                self.view.insertSubview(travelVC.view, belowSubview: self.tabView)
                travelVC.didMove(toParent: self)
                self.travelVC = travelVC

                NSLayoutConstraint.activate([
                    travelVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    travelVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    travelVC.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                    travelVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
            } else {
                self.travelVC!.view.removeFromSuperview()
                self.view.insertSubview(self.travelVC!.view, belowSubview: self.tabView)

                NSLayoutConstraint.activate([
                    self.travelVC!.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    self.travelVC!.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    self.travelVC!.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                    self.travelVC!.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                ])
            }
        }

        tabView.profileAction = {
            let profileVC = ProfileViewController()
            self.navigationController?.pushViewController(profileVC, animated: true)

        }

    }
}
