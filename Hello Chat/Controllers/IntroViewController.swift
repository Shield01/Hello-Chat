//
//  FirstTimeWelcomeView.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 22/11/2023.
//

import UIKit

class IntroViewController : UIViewController{
    
    //MARK: Properties
    
    private let bubbleIconView : UIImageView = {
        var image = UIImage(named: "bubble")
        image = image?.tintedWithLinearGradientColors(colorsArr: [UIColor.deepPurpleGradient.cgColor, UIColor.faintPurpleGradient.cgColor])
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 32, height: 32)
        return imageView
    }()
    
    private lazy var welcomeLabel : HelloLabel = {
        let label = GradientLabel(
            content: generateAttributedString(with: "Hello", and: "Chat"),
            contentColors: [UIColor.deepPurpleGradient.cgColor, UIColor.faintPurpleGradient.cgColor],
            maximumWidth: 115
        )
        return label
    }()
    
    private lazy var mainContentStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bubbleIconView, welcomeLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    private let createAccountButton : HelloButton = {
        let button = HelloButton(
            text: "Create Account",
            titleLabelColor: .white,
            buttonHeight: 54,
            buttonWidth: 175,
            controlState: .normal,
            color: .grayDark,
            font: .SFCompactBold18!
        )
        button.addTarget(self, action: #selector(createAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton : HelloButton = {
        let button = HelloButton(
            text: "Login",
            titleLabelColor: .black,
            buttonHeight: 24,
            buttonWidth: 78,
            controlState: .normal,
            font: .SFCompactBold18!
        )
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let chevronImageView : UIImageView = {
        let image = UIImage(named: "chevron_right")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var loginStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginButton, chevronImageView])
        return stack
    }()
    
    private lazy var actionButtonStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [createAccountButton, loginStackView])
        stack.spacing = 20
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: Helpers
    
    private func configureUI(){
        view.backgroundColor = .white
        view.addSubview(mainContentStack)
        view.addSubview(actionButtonStack)
        
        mainContentStack.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            paddingTop: 350,
            paddingLeft:  24
        )
        
        actionButtonStack.anchor(
            left : view.safeAreaLayoutGuide.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingLeft: 15,
            paddingBottom: 30,
            paddingRight: 15
        )
    }
    
    func generateAttributedString(with text1 : String, and text2 : String?) -> NSAttributedString{
        let attributedString : NSMutableAttributedString = NSMutableAttributedString(
            string: text1,
            attributes: [
                .font : UIFont(
                    name: "SFCompactDisplay-Bold",
                    size: 48)!
            ]
        )
        
        guard let text2 = text2 else { return attributedString }
        
        let appendedString = NSAttributedString(
            string: text2,
            attributes: [
                .font : UIFont(
                    name: "SFCompactDisplay-Medium",
                    size: 48)!]
        )
        
        attributedString.append(appendedString)
        
        return attributedString
    }
    
    //MARK: Selectors
    @objc func createAccountButtonTapped(){
        let controller = SignupController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func loginButtonTapped(){
        let controller = LoginController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
