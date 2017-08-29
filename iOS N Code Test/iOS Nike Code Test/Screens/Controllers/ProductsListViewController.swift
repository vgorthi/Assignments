//
//  ProductsListViewController.swift
//  iOS Nike Code Test
//
//  Created by pavan krishna on 10/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    @IBOutlet weak var productsTableView: UITableView!
    var productsArray: [Product]?
    var selectedProduct : Product?

    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        DataRequest().testGetProductDetailsFromTextFile() { allProducts in
            self.productsArray = allProducts
            self.productsTableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Defines.imageSegueIdentifier {
            let dest = segue.destination as? ProductImageViewController
            let row = self.productsTableView.indexPathForSelectedRow?.row
            selectedProduct = self.productsArray?[row!]
            dest?.selectedProduct = selectedProduct
        }
    }
}

extension ProductsListViewController: UITableViewDataSource {
    
    // MARK: UITableView methods
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productsArray != nil ? self.productsArray!.count: 0
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Defines.productCellIdentifier, for: indexPath) as! ProductTableViewCell
        cell.productNameLabel.text  = self.productsArray?[indexPath.row].productName
        
        let productPrice = self.productsArray?[indexPath.row].productPrice
        
        cell.productPriceLabel.text = "$ "+productPrice!
        cell.productColorLabel.text = self.productsArray?[indexPath.row].productColor

        let productImageString = (self.productsArray?[indexPath.row].productThumbImageUrl)!
        if let productImageUrl = URL(string: productImageString) {
            cell.productImageView.contentMode = .scaleAspectFit
            downloadImage(url: productImageUrl,cell: cell)
        }
        return cell
    }
}

extension ProductsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.0
        
        let transform = CATransform3DTranslate(CATransform3DIdentity, -250, 20, 0)
        cell.layer.transform = transform
        
        UIView.animate(withDuration: 1.0) { 
            cell.alpha = 1.0
            cell.layer.transform = CATransform3DIdentity
        }
    }
}

extension ProductsListViewController {
    
    func downloadImage(url: URL, cell:ProductTableViewCell) {
        getDataFromUrl(url: url) { (data, response, error)  in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { () -> Void in
                cell.productImageView.image = UIImage(data: data)
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
