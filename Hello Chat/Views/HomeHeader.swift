//
//  HomeHeader.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 25/11/2023.
//

import UIKit

protocol HomeHeaderDelegate {
    func handleMenuViewTapped()
}

class HomeHeader : UICollectionReusableView{
    //MARK: Properties
    
    static let identifier = "Home Header"
    
    var delegate : HomeHeaderDelegate?
    
    private let userGreetLabel : HelloLabel = {
        let label = HelloLabel(
            content: "Hello King",
            contentFont: .SFCompactMedium18,
            contentColor: .grayDark,
            labelWidth: 325
        )
        return label
    }()
    
    private lazy var menuView : UIImageView = {
        let image = UIImage(named: "light_menu")!
        let imageView = UIImageView(image: image)
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        imageView.setDimensions(width: 32, height: 32)
        let tap = UITapGestureRecognizer(target: self, action: #selector(menuViewTapped))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
        return imageView
    }()
    
    private lazy var topStack : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [userGreetLabel, menuView])
        stack.spacing = 10
//        stack.backgroundColor = .blue
        stack.distribution = .fill
        return stack
    }()
    
    private let promptLabel : HelloLabel = {
        let label = GradientLabel(
            content: "Say good morning",
            contentFont: .SFCompactBold48,
            contentColors: [UIColor.deepPurpleGradient.cgColor, UIColor.faintCoralGradient.cgColor],
            labelWidth: 212,
            labelNumberOfLines: 0
        )
        return label
    }()
    
    private lazy var completeStackView : UIStackView = {
        let stack = UIStackView(arrangedSubviews: [topStack, promptLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
//        stack.backgroundColor = .red
        return stack
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
    
    func configureHeaderView(){
        backgroundColor = . white
        addSubview(completeStackView)
//        completeStackView.centerX(inView: self)
        completeStackView.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, right: safeAreaLayoutGuide.rightAnchor, paddingLeft: 12, paddingRight: 12)
    }
    //MARK: Selectors
    
    @objc func menuViewTapped(){
        delegate?.handleMenuViewTapped()
    }
}
