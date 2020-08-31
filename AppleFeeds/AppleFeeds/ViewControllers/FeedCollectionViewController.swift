//
//  FeedCollectionViewController.swift
//  AppleFeeds
//
//  Created by Manish Gupta on 8/29/20.
//  Copyright © 2020 Think Beyond. All rights reserved.
//

import UIKit

class FeedCollectionViewController: UIViewController {
	
	@IBOutlet weak var feedCollectionView: UICollectionView!
	
	// MARK: Properties
	
	var feedsDataArray: Array<Artist>? = []
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.feedCollectionView.delegate = self
		self.feedCollectionView.dataSource = self
		
		self.feedCollectionView.register(UINib(nibName: "FeedCollectionViewCell",
											   bundle: nil),
										 forCellWithReuseIdentifier: "feedCell")

		FeedsViewModel.singleInstance.artists(completionHandler:
			{ [weak self] (array) in
			DispatchQueue.main.async {
				self?.feedsDataArray = array
				self?.feedCollectionView.reloadData()
			}
		})
	}
	
	override func viewWillAppear(_ animated: Bool) {
		self.feedCollectionView.reloadData()
	}
	
	deinit {
		print("Was it released , yes it was")
	}
}

extension FeedCollectionViewController : UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView,
						numberOfItemsInSection section: Int) -> Int {
		return feedsDataArray?.count ?? 2
	}
	
	func collectionView(_ collectionView: UICollectionView,
						cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		if let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: "feedCell",
															 for: indexPath) as? FeedCollectionViewCell {
			cell.applicationNameLabel.text = feedsDataArray?[indexPath.row].artistName
			cell.applicationLastUpdateLabel.text = feedsDataArray?[indexPath.row].releaseDate
			cell.applicationDeveloperNameLabel.text = feedsDataArray?[indexPath.row].name
			if let imageURL = feedsDataArray?[indexPath.row].artworkUrl100 {
				FeedsViewModel.singleInstance.image(url: imageURL,
													completionHandler:
					{ (image) in
					DispatchQueue.main.async { cell.feedAppImageView.image = image }
				})
			}
			
			return cell
		}
		
		return collectionView.dequeueReusableCell(withReuseIdentifier: "feedCell",
												  for: indexPath)
	}
}
