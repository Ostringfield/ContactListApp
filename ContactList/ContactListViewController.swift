//
//  ViewController.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//
// View controller for the Contacts screen containing a list of contacts
// The contacts are fetched live on start up from "http://jsonplaceholder.typicode.com/users"

import UIKit

class ContactListViewController: UITableViewController {

    var dataModel: DataModel!
    var actInd = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
    var loadingLabel = UILabel()
    var errorMessage = "Error"
    
    //Sort button outlet
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    /**
    sortContactList method
    
    Gets called when the sort button is pushed 
    Sorts the contact list by ascending if ⬆︎ is displayed
    Otherwise sorts the contact list by descending when ⬇︎ is displayed
    */
    @IBAction func sortContactList(sender: AnyObject) {
        dataModel.sortContacts()
        if dataModel.ascending { sortButton.title = "Sort ⬇︎" }
        else { sortButton.title = "Sort ⬆︎"} //first button push
        tableView.reloadData()
    }
    
    /**
    viewDidLoad method
    
    Loads the data from the server after the view is loaded
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromServer()
        print(dataModel.contactList)
    }
    
    /**
    startLoadingAnimation method
    
    Creates a loading animation to display while the data will be
    loaded from the server.
    */
    func startLoadingAnimation() {
        actInd.frame = CGRectMake(0, 0, 200, 200)
        loadingLabel.text = "Loading Contacts"
        loadingLabel.font = UIFont(name: loadingLabel.font.fontName, size: 20)
        loadingLabel.sizeToFit()
        actInd.center = CGPoint(x: self.view.center.x, y: 25)
        loadingLabel.center = CGPoint(x: actInd.center.x + 10, y: actInd.center.y + 25)
        actInd.hidesWhenStopped = true
        self.tableView.separatorStyle = .None
        self.view.addSubview(actInd) //add activity indicator
        self.view.addSubview(loadingLabel) //add "Loading Contacts" label
        actInd.startAnimating()
    }
    
    /**
    stopLoadingAnimation method
    
    Called to stop the laoding animation right before the data is 
    put on the screen.
    */
    func stopLoadingAnimation() {
        actInd.stopAnimating()
        loadingLabel.removeFromSuperview()
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
    }
    
    /**
    getDataFromServer method
    
    Uses a NSURLSession to fetch live data from the designated url.
    The JSON data is then stored into the dataModel as a list of Contact classes
    */
    func getDataFromServer() {
        let urlString = "http://jsonplaceholder.typicode.com/users"
        let session = NSURLSession.sharedSession()
        startLoadingAnimation() //start the loading animation
        //create a new session and set the JSON data to the dataModel
        var dataTask = session.dataTaskWithURL(NSURL(string: urlString)!,
            completionHandler: {data, response, error -> Void in
            if let err = error { //if there is an error
                self.errorMessage = err.localizedDescription
                //call the main thread to stop the loading animation
                //also call showNetworkError to display an error message
                dispatch_async(dispatch_get_main_queue()) {
                    self.stopLoadingAnimation()
                    self.tableView.reloadData()
                    self.showNetworkError()
                }
            //cast the response to a NSHTTPResponse so we can use 
            //its statusCode property
            } else if let httpResponse = response as? NSHTTPURLResponse {
                if httpResponse.statusCode == 200 { //successful response
                    self.dataModel.setContactData(data!) //set the data
                    dispatch_async(dispatch_get_main_queue()) { //stop the UI
                        self.stopLoadingAnimation()
                        self.dataModel.sortContacts()
                        self.tableView.reloadData()
                    }
                }
            }
            
            
        })
        dataTask.resume()
    }
    
    /**
    showNetworkError method
    
    Called when there is a network error.
    Displays an alert action in a alert controller on the screen.
    The network error is the error returned from the NSUrlSession.
    */
    func showNetworkError() {
        //create an Alert controller which displays a Network error message
        let alert = UIAlertController(title: "Network Error", message: errorMessage, preferredStyle: .Alert)
        //create an Alert action
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        //present the Alert controller
        presentViewController(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /**
    tableView numberOfRowsInSection method
    
    Called for each row in the table
    return: the number of rows in the contact list
    */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.contactList.count 
    }
    
    /**
    tablewView cellForRowAtIndexPath method
    
    Creates a prototype cell for each row and sets a Contact to it.
    return: the cell for the row at indexPath
    */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        //A new or recycled prototype cell
        let cell = tableView.dequeueReusableCellWithIdentifier("Contact") as UITableViewCell!
        
        //get the contact and set the cell text
        let contact = dataModel.contactList[indexPath.row]
        cell.textLabel?.text = contact.person.name
        cell.detailTextLabel?.text = contact.person.email
        return cell
    }
    
    /**
    prepareForSegue method
    
    Called before the segue is executed.
    Gives the Contact details to the destination ContactInfoViewController
    */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowContact" {
            let controller = segue.destinationViewController as! ContactInfoViewController
            controller.contact = sender as! Contact
        }
    }
    
    /**
    tableview didSelectRowAtIndexPath method
    
    Called when the user selects a cell.
    Perform a segue to the ContactInfoViewController.
    */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact = dataModel.contactList[indexPath.row]
        performSegueWithIdentifier("ShowContact", sender: contact)
    }

}

