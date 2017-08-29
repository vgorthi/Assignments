//: Playground - noun: a place where people can play

import UIKit

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

func selectionSort() {
    
}

func mergeSort() {
    
}

func shellSort() {
    
}

func quickSort() {
    
}

bubbleSort(numbersArray)
//insertionSort(numbersArray)


