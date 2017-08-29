//
//  ProductImageViewController.swift
//  iOS Nike Code Test
//
//  Created by pavan krishna on 10/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class ProductImageViewController: UIViewController {

    var selectedProduct : Product?
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    @IBOutlet weak var productPrimaryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadingIndicator.hidesWhenStopped = true
        initializeTapGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let productImageString = (selectedProduct?.productPrimaryImageUrl)!
        self.loadingIndicator.startAnimating()
        if let productImageUrl = URL(string: productImageString) {
            self.productPrimaryImageView.contentMode = .scaleAspectFit
            downloadImage(url: productImageUrl)
        }
    }

    // MARK: - Private Methods

    func initializeTapGestures() {
        productPrimaryImageView.isUserInteractionEnabled = true
        let imageTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(ProductImageViewController.imageTapped))
        self.productPrimaryImageView.addGestureRecognizer(imageTapRecognizer)
        self.view.addGestureRecognizer(imageTapRecognizer)
    }
    
    func imageTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProductImageViewController {
    
    func downloadImage(url: URL) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                self.loadingIndicator.stopAnimating()
                self.productPrimaryImageView.image = UIImage(data: data)
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
