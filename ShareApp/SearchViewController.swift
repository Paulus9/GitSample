//
//  SearchViewController.swift
//  ShareApp
//
//  Created by SysBig on 19/01/18.
//  Copyright © 2018 SysBig. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //searchTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func delayExecutionByMilliseconds(_ delay: Int, for anonFunc: @escaping () -> Void) {
        let when = DispatchTime.now() + .milliseconds(delay)
        DispatchQueue.main.asyncAfter(deadline: when, execute: anonFunc)
    }

    func textFieldDidChange(textField:UITextField)
    {
        //searchText = textField.text!
        //print(searchText)
        
        //        if searchText == ""
        //        {
        //            self.searchProductsArray.removeAll()
        //            self.tableView.reloadData()
        //        }
        //        else
        //        {
        //            self.delayExecutionByMilliseconds(500)
        //            {
        //                self.searchProductsArray.removeAll()
        //                MBProgressHUD.hide(for: self.view, animated: true)
        //            }
        //            getSearchProducts(keyword: searchText)
        //        }
        
        //        //Hit search api here. For now search with dummy data using predicate
        //        let predicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchText)
        //        let array  = dataArray.filter{predicate.evaluate(with: $0)}
        //        // remove predicate when using api
        //
        //        if array.count > 0
        //        {
        //            searchArray.removeAll()
        //            searchArray = array
        //        }
        //        else
        //        {
        //            searchArray = []
        //        }
        //        tableView.reloadData()
    }

}
