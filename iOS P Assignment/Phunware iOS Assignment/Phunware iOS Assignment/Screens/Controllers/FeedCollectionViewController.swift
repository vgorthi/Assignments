//
//  FeedCollectionViewController.swift
//  Phunware iOS Assignment
//
//  Created by pavan krishna on 17/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices

class FeedCollectionViewController: UIViewController {
    
    @IBOutlet weak var feedCollectionView: UICollectionView!
    var feedsArray: [Feed]?
    var selectedFeed : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataRequest().getFeedDetailsFromServer() { allFeeds in
            self.feedsArray = allFeeds
            self.feedCollectionView.reloadData()
            
            // setting up the core spotlight functionality to search the feed
            self.setupSearchableContent()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var cellWidth = 0
        var cellHeight = 0

        guard let flowLayout = self.feedCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        if UIInterfaceOrientationIsLandscape(UIApplication.shared.statusBarOrientation) {
            if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
            {
                // Ipad
                cellWidth = Int(self.view.frame.size.width/2.0)
                cellHeight = ((cellWidth * 190)/540)
            }
            else
            {
                // Iphone
                cellWidth = (Int(self.view.frame.size.width))
                cellHeight = ((cellWidth * 190)/540)
            }
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        } else {
            if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
            {
                // Ipad
                cellWidth = Int(self.view.frame.size.width/2.0)
                cellHeight = ((cellWidth * 190)/360)
            }
            else
            {
                // Iphone
                cellWidth = (Int(self.view.frame.size.width))
                cellHeight = ((cellWidth * 190)/360)
            }
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        }
        
        flowLayout.invalidateLayout()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Defines.feedDetailSegueIdentifier {
            let dest = segue.destination as? DetailViewController
            
            let cell = sender as! FeedCollectionViewCell
            
            let indexPath = self.feedCollectionView!.indexPath(for: cell)
            selectedFeed = self.feedsArray?[(indexPath?.row)!]
            dest?.selectedFeed = selectedFeed            
        }
    }
    
    // MARK: - Private Methods
    func setupSearchableContent() {
        var searchableItems = [CSSearchableItem]()
        
        for i in 0...((self.feedsArray?.count)! - 1) {
            let feed = self.feedsArray?[i]
            
            let searchableItemAttributeSet = CSSearchableItemAttributeSet(itemContentType: kUTTypeText as String)
            
            // Set the title.
            searchableItemAttributeSet.title = feed?.title
            
            // Set the movie image.
            let feedImageString = feed?.image
            searchableItemAttributeSet.thumbnailURL = URL(string: feedImageString!)
            
            // Set the description.
            searchableItemAttributeSet.contentDescription = feed?.description
            
            var keywords = [String]()
            
            for i in 0...((self.feedsArray?.count)! - 1) {
                let feed = self.feedsArray?[i]
                keywords.append((feed?.title!)!)
            }
            searchableItemAttributeSet.keywords = keywords
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "com.PK.Venkata_iOS_Assignment.\(i)", domainIdentifier: "feeds", attributeSet: searchableItemAttributeSet)
            
            searchableItems.append(searchableItem)
        }
        
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error) -> Void in
            if error != nil {
                print(error?.localizedDescription ?? "Error indexing")
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension FeedCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedsArray != nil ? self.feedsArray!.count: 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Defines.feedCellIdentifier, for: indexPath) as! FeedCollectionViewCell
        
        cell.feedCollectionImageView.image = UIImage(named: Defines.customPlaceholderImage)

        let dateFormatter = DateFormatter()
        let createdDate = dateFormatter.date(fromDateString: (self.feedsArray?[indexPath.row].date)!)
        let dateString = dateFormatter.convertDateToReadableString(createdDate!)
        cell.feedCollectionDateLabel.text  = dateString
        cell.feedCollectionTitleLabel.text  = self.feedsArray?[indexPath.row].title
        cell.feedCollectionLocationlabel.text  = self.feedsArray?[indexPath.row].locationline1
        cell.feedCollectionDescriptionlabel.text  = self.feedsArray?[indexPath.row].description
        
        let feedImageString = (self.feedsArray?[indexPath.row].image)!
        if let feedImageUrl = URL(string: feedImageString) {
            cell.feedCollectionImageView.contentMode = .scaleAspectFill
            downloadImage(url: feedImageUrl,cell: cell)
        }
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension FeedCollectionViewController: UICollectionViewDelegateFlowLayout {

}

extension FeedCollectionViewController {
    
    func downloadImage(url: URL, cell:FeedCollectionViewCell) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in                
                if UIImage(data: data) != nil {
                    cell.feedCollectionImageView.image = UIImage(data: data)
                } else {
                    cell.feedCollectionImageView.image = UIImage(named: Defines.customPlaceholderImage)
                }
            }
        }
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}

extension DateFormatter {
    
    func date(fromDateString dateString: String) -> Date? {
        self.dateFormat = Defines.customDateFormat
        self.timeZone = TimeZone(abbreviation: Defines.customUTCFormat)
        self.locale = Locale(identifier: Defines.customLocalIdentifier)
        return self.date(from: dateString)
    }
    
    func convertDateToReadableString(_ givenDate: Date) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Defines.customMonthYearFormat
        let dateString = dateFormatter.string(from: givenDate)
        
        dateFormatter.dateFormat = Defines.customHourMinuteFormat
        let timeString = dateFormatter.string(from: givenDate)
        
        return dateString+" at "+timeString
    }
}
