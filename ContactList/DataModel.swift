//
//  DataModel.swift
//  ContactList
//
//  Created by Ollie Stringfield on 4/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//
// This file contains the data for all the contacts in the app

import Foundation

class DataModel  {
    var contactList = [Contact]()
    var ascending = false
    
    /**
    setContactData
    
    data: the JSON data as NSData
    Converts JSON data and stores it in a list of Contact objects
    Extracted JSON data using SwiftyJSON (third party)
    */
    func setContactData(data: NSData) {
            //let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
            let json = JSON(data: data)
            for user in json.arrayValue {
                
                let id = user["id"].intValue
                let name = user["name"].stringValue
                let username = user["username"].stringValue
                let email = user["email"].stringValue
                let street = user["address"]["street"].stringValue
                let suite = user["address"]["suite"].stringValue
                let zipcode = user["address"]["zipcode"].stringValue
                let city = user["address"]["city"].stringValue
                let lat = user["address"]["geo"]["lat"].doubleValue
                let lng = user["address"]["geo"]["lng"].doubleValue
                let phone = user["phone"].stringValue
                let website = user["website"].stringValue
                let companyName = user["company"]["name"].stringValue
                let catchPhrase = user["company"]["catchPhrase"].stringValue
                let bs = user["company"]["bs"].stringValue
                let contact = Contact(id: id, name: name, username: username, email: email, phone: phone, website: website, street: street, suite: suite, city: city, zipcode: zipcode, lat: lat, lng: lng, companyName: companyName, catchPhrase: catchPhrase, bs: bs)
                contactList.append(contact)
               
            }
        }
    
    /**
    sortContacts method
    
    Sort the contact list by ascending or descending order
    */
    func sortContacts() {
        ascending = !ascending //Set the sort to do next (button push)
        //change the list to be in ascending order
        if ascending {
            contactList = contactList.sort { $0.person.name.compare($1.person.name) == .OrderedAscending }
        } else { //change the list to be in descending order
            contactList = contactList.sort { $0.person.name.compare($1.person.name) == .OrderedDescending }
        }
        
    }
    
}

