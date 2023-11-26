//
//  SearchPageUserCell.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 26/11/2023.
//

import UIKit

class SearchPageUserCell : UICollectionViewCell {
    //MARK: Properties
    
    static let identifier = "Search Page User Cell"
    
    private let imageView : UIImageView = {
        let image = UIImage(named: "")
        let imageView = UIImageView(image: image)
        imageView.setDimensions(width: 56, height: 56)
        imageView.layer.cornerRadius = 28
        imageView.backgroundColor = .lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let usersName : HelloLabel = {
        let label = HelloLabel(
            content: "King Hussein",
            contentFont: .SFCompactMedium18,
            contentColor: .grayDark,
            labelWidth: 100
        )
        return label
    }()
    
    private lazy var cellStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, usersName])
        stack.spacing = 10
        return stack
    }()
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helpers
    private func configureCellUI() {
        addSubview(cellStack)
        cellStack.anchor(left : leftAnchor, right: rightAnchor, paddingLeft: 83, paddingRight: 83)
    }
    
    //MARK: Selectors
    
}
