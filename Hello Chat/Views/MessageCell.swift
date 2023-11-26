//
//  MessageCell.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 25/11/2023.
//

import UIKit

protocol MessageCellDelegate {
    func goToProfilePage()
}

class MessageCell : UICollectionViewCell{
    //MARK: Properties
    
    static let identifier = "Message Cell"
    
    var delegate : MessageCellDelegate?
    
    private let userImageView : UIImageView = {
        let image = UIImage(named: "lol")
        let imageView = UIImageView(image: image)
        imageView.backgroundColor = .grayLight
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 56, height: 56)
        imageView.layer.cornerRadius = 28
        return imageView
    }()
    
    private let username : HelloLabel = {
        let label = HelloLabel(
            content: "King Hussein",
            contentFont: .SFCompactBold18,
            contentColor: .grayDark
        )
        return label
    }()
    
    private let chatPreview : HelloLabel = {
        let label = HelloLabel(
            content: "Have you finished that move",
            contentFont: .SFCompactMedium16,
            contentColor: .gray
        )
        return label
    }()
    
    private lazy var nameAndChatStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [username, chatPreview])
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var chatStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userImageView, nameAndChatStack])
        stack.alignment = .center
        stack.spacing = 5
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        stack.isUserInteractionEnabled = true
        stack.addGestureRecognizer(tap)
        return stack
    }()
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Helpers
    
    private func configureCell() {
        backgroundColor = .white
        addSubview(chatStack)
        chatStack.anchor(
            left: safeAreaLayoutGuide.leftAnchor,
            right: safeAreaLayoutGuide.rightAnchor,
            paddingLeft: 24,
            paddingRight: 24
        )
    }
    
    //MARK: Selectors
    
    @objc func handleTap() {
        delegate?.goToProfilePage()
    }
}
