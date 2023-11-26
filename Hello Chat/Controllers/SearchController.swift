//
//  SearchController.swift
//  Hello Chat
//
//  Created by Hussein Tijani on 26/11/2023.
//

import UIKit

class SearchController : UICollectionViewController {
    
    //MARK: Properties
    
    let searchBarController = UISearchController(searchResultsController: nil)
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.barStyle = .default
    }
    
    //MARK: Helpers
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
        navigationItem.hidesBackButton = true
        collectionView.register(
            SearchPageUserCell.self,
            forCellWithReuseIdentifier: SearchPageUserCell.identifier
        )
        collectionView.register(
            SearchPageHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SearchPageHeaderView.identifier
        )
    }
    
    //MARK: Selectors
}


extension SearchController : UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchPageUserCell.identifier, for: indexPath) as? SearchPageUserCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 56)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SearchPageHeaderView.identifier, for: indexPath) as? SearchPageHeaderView else { return UICollectionReusableView() }
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}

extension SearchController : SearchPageHeaderViewDelegate {
    func handleCloseButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
