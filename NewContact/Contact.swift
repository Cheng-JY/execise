//
//  Contact.swift
//  NewContact
//
//  Created by Codecamp on 15.05.21.
//  Copyright © 2021 Codecamp. All rights reserved.
//

import SwiftUI

struct ContactList{
    var list:[Contact]
}

// Data Model
struct Contact{
    let datum: String // Time + Date
    let name: String
}

// init contact without truedata
func creatContactList() -> ContactList{
    var contactList: ContactList = ContactList(list: [])
    let person1 = Contact(datum: "10:00 15.05.2021", name: "Alice")
    let person2 = Contact(datum:"12:00 16.05.2021", name: "Bob")
    contactList.list.append(person1)
    contactList.list.append(person2)
    
    return contactList
}

//
let contactList = creatContactList()

