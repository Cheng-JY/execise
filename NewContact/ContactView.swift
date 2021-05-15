//
//  ContactView.swift
//  NewContact
//
//  Created by Codecamp on 15.05.21.
//  Copyright © 2021 Codecamp. All rights reserved.
//

import SwiftUI

struct ContactView: View {
    
    let contact:Contact
    
    var body: some View {
        VStack(spacing: 5){
            HStack(spacing: 10){
                
                Text(contact.datum)
                    .textStyle(style: .datum)
                
                Text(contact.name)
                    .textStyle(style: .name)
            }
            Rectangle()
                .padding(.horizontal, -15)
                .frame(height: 10)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
        }
        
    }
}

// Setting the Style of the Text deponding the information
extension Text{
    enum Style{
        case datum
        case name
    }
    
    func textStyle(style: Style) -> some View{
        switch style{
        case .datum:
            return self
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.color(forTextStyle: style))
        case .name:
            return self
                .font(.system(size: 15))
                .foregroundColor(.color(forTextStyle: style))
        }
    }
}


// Setting the Color of the text
extension Color{
    static func color(forTextStyle style: Text.Style) -> Color{
        switch style{
        case .datum:
            return Color(
                UIColor{trait in
                    switch trait.userInterfaceStyle{
                    case .dark: return .white
                    default: return .black
                    }
                }
            )
        case .name:
            return Color(
                UIColor{trait in
                    switch trait.userInterfaceStyle{
                    case .dark: return .white
                    default: return .gray
                    }
                }
            )
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: contactList.list[0])
    }
}
