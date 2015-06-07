//
//  ContactInfoViewController.swift
//  ContactList
//
//  Created by Ollie Stringfield on 5/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import UIKit

class ContactInfoViewController: UITableViewController {
    var contact: Contact!
    
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var phoneText: UILabel!
    @IBOutlet weak var addressText: UILabel!
    @IBOutlet weak var websiteText: UILabel!
    @IBOutlet weak var companyText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDetails()
    }
    
    /**
    loadDetails method
    
    Loads the contact details into their associated UILabels
    */
    func loadDetails() {
        self.title = contact.person.name
        usernameText.text = contact.person.username
        phoneText.text = contact.person.phone
        addressText.text = contact.address.fullAddress
        websiteText.text = contact.person.website
        companyText.text = contact.company.toString()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
