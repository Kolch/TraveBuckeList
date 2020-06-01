//
//  MenuContent.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 01.06.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        List {
            Text("My Profile").onTapGesture {
                print("My Profile")
            }
            Text("Posts").onTapGesture {
                print("Posts")
            }
            Text("Logout").onTapGesture {
                print("Logout")
            }
        }
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}
