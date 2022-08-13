//
//  CustomTabView.swift
//  CustomNavigationBar
//
//  Created by Danny Tsang on 8/12/22.
//

import UIKit

public typealias VoidClosure = () -> Void


class CustomTabView: UIView {

    var scheduleAction: VoidClosure?
    var installationAction: VoidClosure?
    var profileAction: VoidClosure?

    static let selectedColor = UIColor(red: 191/255.0, green: 93/255.0, blue: 20/255.0, alpha: 1.0)
    static let deselectedColor = UIColor(red: 111/255.0, green: 119/255.0, blue: 141/255.0, alpha: 1.0)
    static let grayBackgroundColor = UIColor(red: 229/255.0, green: 231/255.0, blue: 238/255.0, alpha: 1.0)

    var selectedButton: Int = -1

    let scheduleButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "Schedule"
        config.image = UIImage(systemName: "calendar")
        config.imagePadding = 5.0
        config.baseForegroundColor = deselectedColor

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let installationsButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "Travel"
        config.image = UIImage(systemName: "suitcase")
        config.imagePadding = 5.0
        config.baseForegroundColor = deselectedColor

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let profileButton: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.image = UIImage(systemName: "person.crop.circle")
        config.baseForegroundColor = deselectedColor

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let selectedButtonBar: UIView = {
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 166.0, height: 2.0))
        view.backgroundColor = selectedColor
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let backArrow: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.image = UIImage(systemName: "chevron.backward")
        config.baseForegroundColor = UIColor(red: 111/255.0, green: 119/255.0, blue: 141/255.0, alpha: 1.0)

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let backItem: UIButton = {
        var config = UIButton.Configuration.borderless()
        config.title = "Outbox"
        config.image = UIImage(systemName: "tray.and.arrow.up.fill")
        config.imagePadding = 5.0
        config.baseForegroundColor = .systemBlue

        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupView()
        setupButtons()
        updateView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

        self.backgroundColor = .white
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1.0
        self.layer.borderColor = CustomTabView.grayBackgroundColor.cgColor

        let spacer = UIView()
        spacer.translatesAutoresizingMaskIntoConstraints = false
        spacer.backgroundColor = CustomTabView.grayBackgroundColor

        let spacer2 = UIView()
        spacer2.translatesAutoresizingMaskIntoConstraints = false
        spacer2.backgroundColor = CustomTabView.grayBackgroundColor

        let spacer3 = UIView()
        spacer3.translatesAutoresizingMaskIntoConstraints = false
        spacer3.backgroundColor = CustomTabView.grayBackgroundColor

        let spacer4 = UIView()
        spacer4.translatesAutoresizingMaskIntoConstraints = false
        spacer4.backgroundColor = CustomTabView.grayBackgroundColor

        addSubview(spacer3)
        addSubview(scheduleButton)
        addSubview(spacer)
        addSubview(installationsButton)
        addSubview(spacer4)
        addSubview(spacer2)
        addSubview(profileButton)
        addSubview(selectedButtonBar)
        addSubview(backArrow)
        addSubview(backItem)

        NSLayoutConstraint.activate([
            spacer.topAnchor.constraint(equalTo: self.topAnchor),
            spacer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            spacer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            spacer.widthAnchor.constraint(equalToConstant: 1.0),

            scheduleButton.trailingAnchor.constraint(equalTo: spacer.leadingAnchor),
            scheduleButton.topAnchor.constraint(equalTo: self.topAnchor),
            scheduleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scheduleButton.widthAnchor.constraint(equalToConstant: 166.0),

            installationsButton.leadingAnchor.constraint(equalTo: spacer.trailingAnchor),
            installationsButton.topAnchor.constraint(equalTo: self.topAnchor),
            installationsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            installationsButton.widthAnchor.constraint(equalToConstant: 166.0),

            profileButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileButton.topAnchor.constraint(equalTo: self.topAnchor),
            profileButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            profileButton.widthAnchor.constraint(equalToConstant: 76.0),

            spacer3.trailingAnchor.constraint(equalTo: scheduleButton.leadingAnchor),
            spacer3.topAnchor.constraint(equalTo: self.topAnchor),
            spacer3.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            spacer3.widthAnchor.constraint(equalToConstant: 2.0),

            spacer4.leadingAnchor.constraint(equalTo: installationsButton.trailingAnchor),
            spacer4.topAnchor.constraint(equalTo: self.topAnchor),
            spacer4.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            spacer4.widthAnchor.constraint(equalToConstant: 2.0),

            spacer2.topAnchor.constraint(equalTo: self.topAnchor),
            spacer2.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            spacer2.trailingAnchor.constraint(equalTo: profileButton.leadingAnchor),
            spacer2.widthAnchor.constraint(equalToConstant: 1.0),

            backArrow.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60.0),
            backArrow.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            backArrow.widthAnchor.constraint(equalToConstant: 7.0),

            backItem.leadingAnchor.constraint(equalTo: backArrow.trailingAnchor, constant: 25.0),
            backItem.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
        ])
    }

    func setupButtons() {
        scheduleButton.addTarget(self, action: #selector(scheduleTapped), for: .touchUpInside)
        installationsButton.addTarget(self, action: #selector(installationsTapped), for: .touchUpInside)
        profileButton.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
    }

    func updateView() {
        var newFrame:CGRect = .zero

        switch selectedButton {
        case 0:
            scheduleButton.configuration?.baseForegroundColor = CustomTabView.selectedColor
            installationsButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            profileButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            newFrame = CGRect.init(x: scheduleButton.frame.origin.x, y: scheduleButton.frame.height - 2.0, width: scheduleButton.frame.width, height: 2.0)
        case 1:
            scheduleButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            installationsButton.configuration?.baseForegroundColor = CustomTabView.selectedColor
            profileButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            newFrame = CGRect.init(x: installationsButton.frame.origin.x, y: installationsButton.frame.height - 2.0, width: installationsButton.frame.width, height: 2.0)
        case 2:
            scheduleButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            installationsButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            profileButton.configuration?.baseForegroundColor = CustomTabView.selectedColor
            newFrame = selectedButtonBar.frame

        default:
            scheduleButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            installationsButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            profileButton.configuration?.baseForegroundColor = CustomTabView.deselectedColor
            selectedButtonBar.isHidden = true
        }

        if selectedButtonBar.isHidden {
            if newFrame.width != 0 {
                selectedButtonBar.frame = newFrame
                selectedButtonBar.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) { [weak self] in
                self?.selectedButtonBar.frame = newFrame
            }
        }
    }

    @objc func scheduleTapped() {
        if let scheduleAction = scheduleAction {
            selectedButton = 0
            updateView()
            scheduleAction()
        }
    }

    @objc func installationsTapped() {
        if let installationAction = installationAction {
            selectedButton = 1
            updateView()
            installationAction()
        }
    }

    @objc func profileTapped() {
        if let profileAction = profileAction {
            selectedButton = 2
            updateView()
            profileAction()
        }

    }
}
