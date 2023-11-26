//
//  HomeController.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 25/11/2023.
//

import UIKit

class HomeController : UICollectionViewController{
    //MARK: Properties
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.hidesBackButton = true
    }
    
    //MARK: Helpers
    func configureCollectionView(){
        collectionView.backgroundColor = .white
        collectionView.register(
            HomeHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HomeHeader.identifier
        )
        
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.identifier)
        
        // Set the scroll direction to vertical
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .vertical
//            layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)  // Adjust as needed
//        }
        
    }
    //MARK: Selectors
}

extension HomeController : UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeHeader.identifier, for: indexPath) as? HomeHeader else { return UICollectionReusableView() }
        header.delegate = self
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.identifier, for: indexPath) as? MessageCell else { return UICollectionViewCell() }
        cell.delegate = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 56)
    }
}

// MARK: HomeHeaderDelegate Extension

extension HomeController : HomeHeaderDelegate{
    func handleMenuViewTapped() {
        let controller = SearchController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}

extension HomeController : MessageCellDelegate {
    func goToProfilePage() {
        let controller = ProfileController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
}
