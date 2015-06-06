//
//  ViewController.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import UIKit

class ContactListViewController: UITableViewController {

    var dataModel: DataModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var actInd = UIActivityIndicatorView(frame: CGRectMake(0,0, 50, 50)) as UIActivityIndicatorView
        actInd.center = self.view.center
        actInd.hidesWhenStopped = true
        actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(actInd)
        actInd.startAnimating()
        println("here i am!")
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: "http:// jsonplaceholder.typicode.com/users")
        var dataTask = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            var err: NSError?
            self.dataModel.setContactData(data)
            dispatch_async(dispatch_get_main_queue(), {self.tableView.reloadData()})
        })
        dataTask.resume()
        actInd.stopAnimating()
    }

    func getDataFromServer() {
        
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
    
    //called before the segue is performed
    //Gives the Contact details to the destination controller (ContactInfoViewController) 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowContact" {
            let controller = segue.destinationViewController as! ContactInfoViewController
            controller.contact = sender as! Contact
        }
    }
    
    //Animation for deselecting the row after a user taps it.
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact = dataModel.contactList[indexPath.row]
        performSegueWithIdentifier("ShowContact", sender: contact)
        //tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}

