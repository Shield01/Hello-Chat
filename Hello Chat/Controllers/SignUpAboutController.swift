//
//  SignUpAboutController.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 24/11/2023.
//

import UIKit

class SignUpAboutController : UIViewController{
    //MARK: Properties
    private lazy var queryLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Now, tell who you are",
            contentFont: .SFCompactBold48,
            contentColor: .black,
            labelWidth: 300
        )
        return label
    }()
    
    private let avatarImageView : UIImageView = {
        
        let label = HelloLabel(
            content: "ADD IMAGE",
            contentFont: .SFCompactMedium12,
            contentColor: .grayDark
        )
        var image = UIImage(named: "avatar")
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 120, height: 120)
        imageView.addSubview(label)
        label.center(inView: imageView)
        return imageView
    }()
    
    private lazy var inputField: UITextView = {
        let placeholder = HelloLabel(
            content: "type your name",
            contentFont: .SFCompactBold48,
            contentColor: .grayLight,
            labelWidth: 327,
            labelNumberOfLines: 2
        )        
        let field = UITextView()
        field.backgroundColor = .white
        field.isScrollEnabled = false
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.isEditable = true
        field.addSubview(placeholder)
        placeholder.anchor(top: field.topAnchor, left: field.leftAnchor)
        return field
    }()
    
    private lazy var mainContentStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [queryLabel, avatarImageView, inputField])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 20
        return stack
    }()
    
    private lazy var startChatButton : HelloButton = {
        let button = HelloButton(
            text: "Start Chat",
            titleLabelColor: .white,
            buttonHeight: 54,
            buttonWidth: 132,
            controlState: .normal,
            color: .grayDark,
            font: .SFCompactBold18!
        )
        button.addTarget(self, action: #selector(startChatButtonTapped), for: .touchUpInside)
        return button
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
        view.addSubview(startChatButton)
        mainContentStack.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingTop: 20,
            paddingLeft: 24,
            paddingRight: 24
        )
        startChatButton.anchor(
            left : view.safeAreaLayoutGuide.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            paddingLeft: 24,
            paddingBottom: 24
        )
    }
    
    //MARK: Selectors
    
    @objc func startChatButtonTapped(){
        let controller = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
