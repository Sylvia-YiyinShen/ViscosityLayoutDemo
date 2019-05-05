//
//  ViewController.swift
//  ViscosityLayoutDemo
//
//  Created by Yiyin Shen on 3/5/19.
//  Copyright © 2019 Sylvia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }

    private func configureCollectionView() {

        collectionView.collectionViewLayout = ViscosityLayout()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SimpleCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "SimpleCell")
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SimpleCell", for: indexPath)

         if let simpleCell = cell as? SimpleCollectionViewCell {
         if indexPath.row % 2 == 0 {
         simpleCell.configure(imageName: "flower_1")
         } else {
         simpleCell.configure(imageName: "flower_2")
         }
         }
        return cell
    }
}
