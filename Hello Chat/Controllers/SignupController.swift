//
//  SignupController.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 24/11/2023.
//

import UIKit

class SignupController : UIViewController{
    //MARK: Properties
    
    weak var actionStackViewConstraint : NSLayoutConstraint?
    
    private lazy var signupLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Your Phone Number",
            contentFont: .SFCompactBold48,
            contentColor: .black,
            maximumWidth: 115
        )
        return label
    }()
    
    private lazy var inputField : HelloTextField = {
        let field = HelloTextField()
        field.backgroundColor = .white
        field.keyboardType = .numberPad
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.attributedPlaceholder = NSAttributedString(
            string: "type",
            attributes: [.font : UIFont.SFCompactBold48!, .foregroundColor : UIColor.grayLight]
        )
        field.textColor = .deepPurpleGradient
        field.font = .SFCompactBold48
        field.contentVerticalAlignment = .center
        field.tintColor = .deepPurpleGradient
        field.heightAnchor.constraint(equalToConstant: 100).isActive = true
        field.caretHeight = 100
        return field
    }()
    
    private lazy var mainContentStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [signupLabel, inputField])
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var nextButton : HelloButton = {
        let button = HelloButton(
            text: "Next",
            titleLabelColor: .white,
            buttonHeight: 54,
            buttonWidth: 88,
            controlState: .normal,
            color: .grayDark,
            font: .SFCompactMedium18!
        )
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var resendCodeButton : HelloButton = {
        let button = HelloButton(
            text: "RESEND CODE",
            titleLabelColor: .grayDark,
            buttonHeight: 54,
            buttonWidth: 85,
            controlState: .normal,
            color: .white,
            font: .SFCompactMedium12!
        )
        button.addTarget(self, action: #selector(resenCodeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var actionStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nextButton, resendCodeButton])
        stack.spacing = 20
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        return stack
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    //MARK: Helpers
    private func configureUI(){
        view.backgroundColor = .white
        view.addSubview(mainContentStack)
        view.addSubview(actionStackView)
        
        mainContentStack.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.safeAreaLayoutGuide.leftAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingTop: -80,
            paddingLeft: 24,
            paddingRight: 24
        )
        
        actionStackView.anchor(
            left : view.safeAreaLayoutGuide.leftAnchor,
            bottom: view.safeAreaLayoutGuide.bottomAnchor,
            right: view.safeAreaLayoutGuide.rightAnchor,
            paddingLeft: 24,
            paddingBottom: 24,
            paddingRight: 24
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
    
    @objc func nextButtonTapped(){
        let controller = SignUpAboutController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
    @objc func resenCodeButtonTapped(){
        
    }
    
//    @objc func keyboardWillShow(_ notification: Notification){
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            // Adjust the constant of the constraint to make room for the keyboard
//            actionStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardSize.height).isActive = true
////                .constant = -keyboardSize.height
//            UIView.animate(withDuration: 0.3) {
//                self.view.layoutIfNeeded()
//            }
//        }
//    }
    
//    @objc func keyboardWillHide(_ notification: Notification){
////        stackViewBottomConstraint.constant = 0
//        print("Keyboard is hidden")
//        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            
////            actionStackView.removeConstraint(.Attribute)
//            actionStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:
//                                                        -24).isActive = true
//            UIView.animate(withDuration: 0.3) {
//                self.view.layoutIfNeeded()
//            }
//        }
//        
//    }
}
