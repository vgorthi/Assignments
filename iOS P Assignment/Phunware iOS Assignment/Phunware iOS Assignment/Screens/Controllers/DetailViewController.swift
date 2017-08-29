//
//  DetailViewController.swift
//  Phunware iOS Assignment
//
//  Created by pavan krishna on 17/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit
import CoreSpotlight
import MobileCoreServices
import StretchyHeaderView

class DetailViewController: UIViewController {

    @IBOutlet weak var customNavBar: UINavigationItem!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    var selectedFeed : Feed?
    var selectedFeedImage : UIImage?
    var detailFeedString : NSAttributedString?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.addScalableCover(with: UIImage(named: Defines.customPlaceholderImage)!)
        self.detailTableView.showsVerticalScrollIndicator = false
        self.detailTableView.tableFooterView = UIView()
        self.detailTableView.rowHeight = UITableViewAutomaticDimension
        self.detailTableView.estimatedRowHeight = 400
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.attachToScrollView(self.detailTableView)
        
        if selectedFeed != nil {
            populateFeedDetails()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
        self.customNavBar.title = selectedFeed?.title
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black,NSFontAttributeName:
            UIFont(name: "AvenirNext-Regular", size: 16.0)!]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let navigationBar = navigationController!.navigationBar
        navigationBar.reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    func populateFeedDetails() {
        
        let dateFormatter = DateFormatter()
        let createdDate = dateFormatter.date(fromDateString: (selectedFeed?.date)!)
        let convertedDateString = dateFormatter.convertDateToReadableString(createdDate!)
        
        let myMutableString = NSMutableAttributedString(
            string: "",
            attributes: [NSFontAttributeName:
                UIFont(name: Defines.avenirNextRegular, size: 14.0)!])
        
        // first date string
        let dateStringAttributes:[String:AnyObject]? = [
            NSFontAttributeName:UIFont(
                name: Defines.avenirNextRegular,
                size: 14)!,
            NSForegroundColorAttributeName:UIColor.darkGray
        ]
        
        let dateString = NSAttributedString(
            string: convertedDateString!+"\n",
            attributes: dateStringAttributes)
        myMutableString.append(dateString)
        
        // second title string
        let titleStringAttributes:[String:AnyObject]? = [
            NSFontAttributeName:UIFont(
                name: Defines.AvenirNextDemiBold,
                size: 20)!,
            NSForegroundColorAttributeName:UIColor.darkGray
        ]
        
        let titleString = NSAttributedString(
            string: (selectedFeed?.title)!+"\n",
            attributes: titleStringAttributes)
        myMutableString.append(titleString)
        
        // third description string
        let descriptionStringAttributes:[String:AnyObject]? = [
            NSFontAttributeName:UIFont(
                name: Defines.avenirNextRegular,
                size: 18)!,
            NSForegroundColorAttributeName:UIColor.darkGray
        ]
        
        let descriptionString = NSAttributedString(
            string: (selectedFeed?.description)!+"\n",
            attributes: descriptionStringAttributes)
        myMutableString.append(descriptionString)
        detailFeedString = myMutableString
        
        let feedImageString = (selectedFeed?.image)!
        if let feedImageUrl = URL(string: feedImageString) {
            downloadImage(url: feedImageUrl)
        }
    }
    
    // MARK: - Action Methods
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func shareActionButton(_ sender: UIBarButtonItem) {
        
        let activityViewController = UIActivityViewController(
            activityItems: [selectedFeed?.title ?? "Phun App Feed",self.selectedFeedImage ?? UIImage(named: Defines.customPlaceholderImage)!],
            applicationActivities: nil)
        if let popoverPresentationController = activityViewController.popoverPresentationController {
            popoverPresentationController.barButtonItem = sender
        }
        present(activityViewController, animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDataSource {

    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: Defines.detailFeedCellIdentifier, for: indexPath) as! DetailTableViewCell
        if indexPath.row == 0   {
            cell.detailFeedTextLabel?.attributedText = self.detailFeedString
        }
        else
        {
            cell.detailFeedTextLabel?.text = ""
        }
        return cell
    }
}

extension DetailViewController: UITableViewDelegate {
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension DetailViewController {
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.detailTableView.removeScalableCover()
                self.selectedFeedImage = UIImage(data: data)
                if UIImage(data: data) != nil {
                    self.detailTableView.addScalableCover(with: self.selectedFeedImage!)
                } else {
                    self.detailTableView.addScalableCover(with: UIImage(named: Defines.customPlaceholderImage)!)
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
