//
//  ViewController.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {

    var dataModel = DataModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //call for each row in the table
    //return: the number of rows in the contactList
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.contactList.count - 1
    }
    
    //creates each cell for each row
    //return: the cell for the row at indexPath
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //this makes a new cell.
        // the previous code used a prototype cell with an Identifier
        // let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as! UITableViewCell
        let cellIdentifier = "Cell"
        
        //type cast optional because dequeueReusableCellWithIdentifier can return a nil if there is no cell
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        //get the contact
        let contact = dataModel.contactList[indexPath.row]
        cell.textLabel?.text = contact.person.name //set the label to the Contact's name
        cell.detailTextLabel?.text = contact.person.email //set the detailTextLabel to the Contact's email
        /* old cold using prototype cells, didn't work with detailTextLabel.
        //create a prototype cell (recycles old an old cell if none is available)
        let cell = tableView.dequeueReusableCellWithIdentifier("Contact") as! UITableViewCell
        
        //reference to the cell UILabel with tag: 1000
        let label = cell.viewWithTag(1000) as! UILabel
        //set the label to the name of the contact person
        label.text = d.contactList[indexPath.row].person.name
        cell.detailTextLabel?.text = d.contactList[indexPath.row].person.email
        */
        println("made a cell!")
        return cell
    }
    
    //Animation for deselecting the row after a user taps it.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowContact", sender: nil)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

