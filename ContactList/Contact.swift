//
//  Contact.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//
// Contact class for each contact, storing relevant data

import Foundation

class Contact: NSObject {
    var person: Person
    var address: Address
    var geo: Geo
    var company: Company

    /**
    init method
    
    params: takes all the data values to set for the contact
    The method calls the initialiser methods for the person, address, geo, and 
    company structures with the relevant data as parameters.
    */
    init(id: Int, name: String, username: String, email: String, phone: String, website: String, street: String, suite: String, city: String, zipcode: String, lat: Double, lng: Double, companyName: String, catchPhrase: String, bs: String) {
        
        person = Person(id: id, name: name, username: username, email: email, phone: phone, website: website)
        address = Address(street: street, suite: suite, city: city, zipcode: zipcode)
        geo = Geo(lat: lat, lng: lng)
        company = Company(companyName: companyName, catchPhrase: catchPhrase, bs: bs)
        super.init()
    }
    
    /**
    ~Person structure~
    
    Contains contact data such as id, name, username, email, phone, website.
    */
    struct Person {
        var id: Int?
        var name = ""
        var username = ""
        var email = ""
        var phone = ""
        var website = ""
        init(id: Int, name: String, username: String, email: String, phone: String, website: String) {
            self.id = id
            self.name = name
            self.username = username
            self.email = email
            self.phone = phone
            self.website = website
        }
    }
    
    /**
    ~Address Structure~
    
    Contains contact address data such as street, suite, city, zipcode.
    Also contains a fullAddress which returns a summed string of the data
    */
    struct Address {
        var street = ""
        var suite = ""
        var city = ""
        var zipcode = ""
        var fullAddress = ""
        init(street: String, suite: String, city: String, zipcode: String) {
            self.street = street
            self.suite = suite
            self.city = city
            self.zipcode = zipcode
            fullAddress = suite + " " + street + "\n" + city + ", " + zipcode
        }
    }
    
    /**
    ~Geo Structure~
    
    The latitude and longitude geographic location of the Contact
    */
    struct Geo {
        var geoLat = 0.0
        var geoLng = 0.0
        init(lat: Double, lng: Double) {
            geoLat = lat
            geoLng = lng
        }
    }
    
    /**
    ~Company Structure~
    
    Contains the company details of the contact such as company name, catch phrase, and business.
    */
    struct Company {
        var companyName = ""
        var catchPhrase = ""
        var bs = ""
        init(companyName: String, catchPhrase: String, bs: String) {
            self.companyName = companyName
            self.catchPhrase = catchPhrase
            self.bs = bs
        }
        func toString() -> String {
            return "\(companyName)\n\(catchPhrase) \n\(bs)"
        }
    }
}
