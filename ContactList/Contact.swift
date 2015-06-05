//
//  Contact.swift
//  ContactList
//
//  Created by Ollie Stringfield on 3/06/15.
//  Copyright (c) 2015 Ollie Stringfield. All rights reserved.
//

import Foundation

class Contact: NSObject {
    var person: Person
    var address: Address
    var geo: Geo
    var company: Company
    
    init(id: Int, name: String, username: String, email: String, phone: String, website: String, street: String, suite: String, city: String, zipcode: String, lat: Double, lng: Double, companyName: String, catchPhrase: String, bs: String) {
        person = Person(id: id, name: name, username: username, email: email, phone: phone, website: website)
        address = Address(street: street, suite: suite, city: city, zipcode: zipcode)
        geo = Geo(lat: lat, lng: lng)
        company = Company(companyName: companyName, catchPhrase: catchPhrase, bs: bs)
        super.init()
    }
    
    class Person {
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
        func toString() -> String {
            return "id: \(id) \nname: \(name) \nusername: \(username) \nemail: \(email) \nphone: \(phone) \nwebsite: \(website)"
        
        }
    }
    
    class Address {
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
            fullAddress = "Address: " + suite + " " + street + " " + city + ", " + zipcode
        }
    }
    
    class Geo {
        var geoLat = 0.0
        var geoLng = 0.0
        init(lat: Double, lng: Double) {
            geoLat = lat
            geoLng = lng
        }
        func toString() -> String {
            return "geoLat: \(geoLat) \ngeoLng: \(geoLng)"
        }
    }
    
    class Company {
        var companyName = ""
        var catchPhrase = ""
        var bs = ""
        init(companyName: String, catchPhrase: String, bs: String) {
            self.companyName = companyName
            self.catchPhrase = catchPhrase
            self.bs = bs
        }
        func toString() -> String {
            return "companyName: \(companyName) \ncatchPhrase: \(catchPhrase) \nbs: \(bs)"
        }
    }
}
