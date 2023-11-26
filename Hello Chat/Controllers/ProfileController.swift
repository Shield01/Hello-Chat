//
//  ProfileController.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 26/11/2023.
//

import UIKit

class ProfileController : UIViewController {
    //MARK: Properties
    private lazy var closeButton : UIImageView = {
        let image = UIImage(named: "close")
        let imageView = UIImageView(image: image)
        imageView.setDimensions(width: 32, height: 32)
        imageView.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeProfilePage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    private let profileImageView : UIImageView = {
        let image = UIImage(named: "lol")
        let imageView = UIImageView(image: image)
        imageView.setDimensions(width: 56, height: 56)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 28
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let usernameLabel : GradientLabel = {
        let label = GradientLabel(
            content: "King Hussein",
            contentFont: .SFCompactBold48,
            contentColors: [UIColor.deepPurpleGradient.cgColor, UIColor.faintPurpleGradient.cgColor],
            maximumWidth: 200,
            labelNumberOfLines: 0
        )
        return label
    }()
    
    private let statusLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Busy Working 🎥",
            contentFont: .SFCompactThin12,
            contentColor: .gray
        )
        return label
    }()
    
    private let themeLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Theme",
            contentFont: .SFCompactMedium12,
            contentColor: .grayDark
        )
        return label
    }()
    
    private let modeLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Dark mode",
            contentFont: .SFCompactMedium12,
            contentColor: .grayDark
        )
        return label
    }()
    
    private let notificationsLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Notifications",
            contentFont: .SFCompactMedium12,
            contentColor: .grayDark
        )
        return label
    }()
    
    private lazy var labelLine : HelloLine = {
//        let line = HelloLine(
//            color: .red,
//            height: 10,
//            width: view.frame.width
//        )
        let line = HelloLine()
        line.frame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 100)
        line.backgroundColor = .red
        return line
    }()
    
    private lazy var formStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [usernameLabel, statusLabel, themeLabel, modeLabel, notificationsLabel])
        
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var mainStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileImageView, formStack])
        stack.alignment = .leading
        stack.spacing = 10
        return stack
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: Helpers
    
    private func configureView(){
        view.backgroundColor = .white
        view.addSubview(closeButton)
        view.addSubview(mainStack)
//        view.addSubview(labelLine)
        closeButton.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingRight: 24
        )
        
        mainStack.anchor(
            top : closeButton.bottomAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 10,
            paddingLeft: 24,
            paddingRight: 24
        )
        
//        labelLine.anchor(
//            top: mainStack.bottomAnchor,
//            left: view.safeAreaLayoutGuide.leftAnchor,
//            right: view.safeAreaLayoutGuide.rightAnchor,
//            paddingTop: 10,
//            paddingLeft: 24,
//            paddingRight: 24
//        )
    }
    
    //MARK: Selectors
    @objc func closeProfilePage(){
        dismiss(animated: true)
    }
}
