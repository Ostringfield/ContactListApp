//
//  ViewController.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {

    let d = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        d.getContactJSONData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //call for each row in the table
    //return: the number of rows in the contactList
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return d.contactList.count - 1
    }
    
    //creates each cell for each row
    //return: the cell for the row at indexPath
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //create a prototype cell (recycles old an old cell if none is available)
        let cell = tableView.dequeueReusableCellWithIdentifier("Contact") as! UITableViewCell
        //reference to the cell UILabel with tag: 1000
        let label = cell.viewWithTag(1000) as! UILabel
        //set the label to the name of the contact person
        label.text = d.contactList[indexPath.row].person.name
        
        
        return cell
    }

}

