//
//  ViewController.swift
//  TableViewSample
//
//  Created by Pratikbhai Patel on 2/29/16.
//  Copyright © 2016 Pratikbhai Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tableview Setup
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 150
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DatePickerCell") as! MyTableViewCell
        cell.delegate = self
        return cell
    }
}

extension ViewController: UITableViewDelegate, ButtonActionDelegate {
    
    func buttonAction() {
        tableView.reloadData()
    }
}

protocol ButtonActionDelegate {
    func buttonAction()
}

class MyTableViewCell: UITableViewCell {
    
    var delegate: ButtonActionDelegate?
    
    @IBOutlet weak var myDatePicker: UIDatePicker!

    var shouldExpand = false
    @IBAction func buttonAction(sender: AnyObject) {
        self.myDatePicker.hidden = !self.myDatePicker.hidden
        self.delegate?.buttonAction()
    }
}