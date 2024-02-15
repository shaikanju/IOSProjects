//
//  ViewController.swift
//  HW5
//
//  Created by Rohan Panchal on 2/5/24.
//

import UIKit





class ViewController: UIViewController {

    
    @IBOutlet weak var descinput: UITextField!
    
    @IBOutlet weak var quantinput: UITextField!
    
    
    @IBOutlet weak var textview: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descinput.text = "" // Blank Description_Input
                quantinput.text = "" // Blank Quantity_Input
                textview.text = "No Item"
        // Do any additional setup after loading the view.
    }
    @IBAction func newListTapped(_ sender: UIButton) {
            clearListOutput()
        }
        
        // Action for "New Item" button
        @IBAction func newItemTapped(_ sender: UIButton) {
            clearInputs()
        }
        
        // Action for "Add" button
        @IBAction func addItemTapped(_ sender: UIButton) {
            addItemToList()
        }
        
        // Helper method to clear List_Output
        func clearListOutput() {
            textview.text = ""
        }
        
        // Helper method to clear Description_Input and Quantity_Input
        func clearInputs() {
            descinput.text = ""
            quantinput.text = ""
        }
        
        // Helper method to add item to List_Output
        func addItemToList() {
            
            guard let description = descinput.text else {
                   showAlert(title: "Error", message: "Invalid Description")
                   return
               }
               
               // Check if both description and quantity are empty
               if description.isEmpty && (quantinput.text == nil || quantinput.text!.isEmpty) {
                   showAlert(title: "Error", message: "Invalid Quantity")
                   return
               }
               
               guard let quantity = quantinput.text, !quantity.isEmpty else {
                   showAlert(title: "Error", message: "Invalid Quantity")
                   return
               }
            if description.isEmpty && !quantity.isEmpty {
                    showAlert(title: "Error", message: "Invalid Description")
                    return
                }
            
            
            let newItem = "\(quantity)x \(description)"
                if let currentText = textview.text, !currentText.isEmpty {
                    // There are existing items in the list
                    if currentText == "No Item" {
                        // Remove the "No Item" text before adding the new item
                        textview.text = newItem + "\n"
                    } else {
                        // Append the new item to the existing list
                        textview.text += newItem  + "\n"
                    }
                } else {
                    // The list is currently empty
                    textview.text = newItem + "\n"
                }
            
            /*let newItem = "\(quantity)x \(description)"
            if let currentText = textview.text, !currentText.isEmpty {
                textview.text += "\n" + newItem
            } else {
                textview.text = newItem
            }*/
        }
        
        // Helper method to show an alert
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    


}

