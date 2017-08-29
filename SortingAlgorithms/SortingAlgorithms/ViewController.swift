//
//  ViewController.swift
//  SortingAlgorithms
//
//  Created by pavan krishna on 26/08/17.
//  Copyright © 2017 pavan krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        bubbleSort(numbersArray)
        selectionSort(numbersArray)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var numbersArray = [14,33,27,10,35,19,42,44]
    
    func bubbleSort(_ numArray :[Int]) {
        
        // Worst complexity : O(n2)
        // Average complexity : O(n2)
        
        var tempArray = numArray
        
        for j in 0...tempArray.count-1 {
            for i in 0...tempArray.count-2 {
                if tempArray[i] > tempArray[i+1] {
                    swap(&tempArray[i], &tempArray[i+1])
                }
            }
        }
        
        for i in 0...tempArray.count-1 {
            print(tempArray[i])
        }
    }
    
    func insertionSort(_ numArray :[Int]) {
        
        // Worst complexity : O(n2)
        // Average complexity : O(n2)
        
        // first take the elements and add them to new array based on sorting
        var tempArray = numArray
        var newArray = [Int]()
        
        for i in 0...tempArray.count-1 {
            print(tempArray[i])
            newArray.append(tempArray[i])
        }
        
        for j in 0...newArray.count-1 {
            print(newArray[j])
        }
        
    }
    
    func selectionSort(_ numArray:[Int]) {
        // Worst complexity : O(n2)
        // Average complexity : O(n2)
        
        var tempArray = numArray
        var minIndex = 0

        // first take the first element and find the element which is less than first element and replace it the lowest element
        
        
        for i in 0...tempArray.count-1 {
            
            minIndex = i
            
            for j in i+1...tempArray.count-1 {
                
                if tempArray[j] < tempArray[minIndex] {
                    minIndex = j
                }
            }
            if minIndex != i {
                swap(&tempArray[minIndex], &tempArray[i])
            }
            
        }

        for i in 0...tempArray.count-1 {
            print(tempArray[i])
        }
    }
    
    func mergeSort() {
        
    }
    
    func shellSort() {
        
    }
    
    func quickSort() {
        
    }
}

