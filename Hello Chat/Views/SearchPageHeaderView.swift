//
//  SearchPageHeaderView.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 26/11/2023.
//

import UIKit

protocol SearchPageHeaderViewDelegate {
    func handleCloseButtonTapped()
}

class SearchPageHeaderView : UICollectionReusableView{
    //MARK: Properties
    static let identifier = "Search page header view"
    
    var delegate : SearchPageHeaderViewDelegate?
    
    private lazy var closeImageView : UIImageView = {
        let image = UIImage(named: "close")
        let imageView = UIImageView(image: image)
        imageView.setDimensions(width: 32, height: 32)
        imageView.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(closeButtonTapped))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private lazy var inputField : HelloTextField = {
        let field = HelloTextField()
        field.backgroundColor = .white
        field.keyboardType = .asciiCapable
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.attributedPlaceholder = NSAttributedString(
            string: "search",
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
    
    //MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHeaderView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helpers
    
    func configureHeaderView() {
        addSubview(closeImageView)
        addSubview(inputField)
        closeImageView.anchor(top : safeAreaLayoutGuide.topAnchor, right: rightAnchor, paddingRight: 10)
        inputField.anchor(top: closeImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
    }
    
    //MARK: Selectors
    
    @objc func closeButtonTapped(){
        delegate?.handleCloseButtonTapped()
    }
}
