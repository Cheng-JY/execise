//
//  ContactListView.swift
//  NewContact
//
//  Created by Codecamp on 15.05.21.
//  Copyright © 2021 Codecamp. All rights reserved.
//

import SwiftUI

struct ContactListView: View {
    
    //remove the init divider
    init(){
        UITableView.appearance().separatorStyle = .none
        UITableViewCell.appearance().selectionStyle = .none
    }
    
    var body: some View {
        VStack{
            Text("Kontaktbuch")
            List{
                ForEach(contactList.list, id: \.datum){ contact in
                    ContactView(contact: contact)
                    
                }
            }
        }
        
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
