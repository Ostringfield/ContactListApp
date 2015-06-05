//
//  DataModel.swift
//  ContactList
//
//  Created by Ollie Stringfield on 4/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import Foundation


class DataModel  {
    var contactList = [Contact]()

    init() {
        setContactDataWithJSONURL()
        sortContacts()
    }
    func setContactDataWithJSONURL() {
        let urlString = "http://jsonplaceholder.typicode.com/users"
        if let data = NSData(contentsOfURL: NSURL(string: urlString)!) {
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
    }
    
    func sortContacts() {
        //compares two strings ignore case sensitivity
     //   contactList.sort({contact1, contact2 in return contact1.person.name.localizedStandardComapre(contact2.person.name) == NSComparisonResult.OrderedAscending})
    }
    
}

