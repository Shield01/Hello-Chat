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
        image = image?.tintedWithLinearGradientColors(colorsArr: [UIColor.deep_purple_gradient.cgColor, UIColor.faint_purple_gradient.cgColor])
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 32, height: 32)
        imageView.tintColor = .deep_purple_gradient
        return imageView
    }()
    
    private lazy var welcomeLabel : GradientLabel = {
        let label = GradientLabel()
        label.attributedText = generateAttributedString(with: "Hello", and: "Chat")
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.gradientColors = [UIColor.deep_purple_gradient.cgColor, UIColor.faint_purple_gradient.cgColor]
        label.preferredMaxLayoutWidth = 115
        return label
    }()
    
    private lazy var mainContentStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bubbleIconView, welcomeLabel])
        stack.axis = .vertical
        stack.spacing = 5
        stack.alignment = .leading
        return stack
    }()
    
    private let createAccountButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray_dark
        button.titleLabel?.font = UIFont(name: "SFCompactDisplay-Bold", size: 18)
        button.setDimensions(width: 175, height: 54)
        button.layer.cornerRadius = 27
        return button
    }()
    
    private lazy var loginButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFCompactDisplay-Bold", size: 18)
        button.setTitleColor(.gray_dark, for: .normal)
        button.backgroundColor = .white
        button.setDimensions(width: 78, height: 24)
        return button
    }()
    
    private let chevronImageView : UIImageView = {
        let image = UIImage(named: "chevron_right")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private lazy var loginStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [loginButton, chevronImageView])
        stack.spacing = 1
        stack.distribution = .equalCentering
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
}


