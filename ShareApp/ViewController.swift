//
//  ViewController.swift
//  ShareApp
//
//  Created by SysBig on 18/01/18.
//  Copyright © 2018 SysBig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shareButtonView: UIView!
    @IBOutlet weak var shareImage: UIImageView!
    var currentResults = [Int]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        shareButtonView.layer.cornerRadius = shareButtonView.bounds.size.height/2
        shareButtonView.layer.masksToBounds = true
        
        shareImage.layer.borderColor = UIColor.white.cgColor
        shareImage.layer.borderWidth = 1.0
        shareImage.layer.cornerRadius = 5.0
        shareImage.layer.masksToBounds = true
        
        print(reverseString(stringValue: "pranay is gud")) //Reverse word
        swapTwoNumbers() //Swap two numbers
        print(generate(numRows: 3)) //pascal triangle
    }
    func reverseString(stringValue:String) -> String
    {
        let inputValue = stringValue
        var outputValue = ""
        var outputString = ""
        
        for value in inputValue
        {
            if  "\(value)" == " "
            {
                outputString = outputString + outputValue + " "
                outputValue = ""
            }
            else
            {
                
                outputValue = "\(value)" + outputValue
            }
            
        }
        outputString = outputString + outputValue
        return outputString
    }
    func swapTwoNumbers()
    {
        var a = 10
        var b = 20
        
        a = a + b
        
        b = a - b
        print("b = \(b)")
        
        a = a - b
        print("a = \(a)")
    }
    func generate(numRows: Int) -> [[Int]] {
        var results = [[Int]]()
        if (numRows == 0) {
            return results
        }
        for i in 0..<numRows {
            var currentResults = [Int]()
            for j in 0...i {
                if (i > 1 && j > 0 && j < i) {
                    let value = results[i-1][j] + results[i-1][j-1]
                    currentResults.append(value)
                } else {
                    currentResults.append(1)
                }
            }
            results.append(currentResults)
        }
        return results
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func uploadButtonAction(_ sender: UIButton)
    {
        
        let alertController = UIAlertController(title: "Choose Image", message: "Please choose upload option", preferredStyle: .actionSheet)
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { (galleryAction) in
            
            //gallery action
            self.uploadAction(sourcetype: "gallery")
        }
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { (cameraAction) in
            
            //Camera action
            self.uploadAction(sourcetype: "camera")

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(galleryAction)
        alertController.addAction(cameraAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func uploadAction(sourcetype: String)
    {
        let pickerVC = UIImagePickerController()
        if sourcetype == "gallery"
        {
            pickerVC.sourceType = .photoLibrary
        }
        else{
            pickerVC.sourceType = .camera
        }
        pickerVC.delegate = self
        self.present(pickerVC, animated: true, completion: nil)
    }
    @IBAction func shareButtonAction(_ sender: UIButton)
    {
        let activityController = UIActivityViewController(activityItems: [self.shareImage.image  as Any], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        self.present(activityController, animated: true, completion: nil)
    }
}
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        if let selcetedImage = chosenImage
        {
            self.shareImage.image = selcetedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        dismiss(animated: true, completion: nil)
    }
}
