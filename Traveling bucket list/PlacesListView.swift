//
//  ContentView.swift
//  Traveling bucket list
//
//  Created by Kolchedantsev Alexey on 31.05.2020.
//  Copyright © 2020 alex kolhc. All rights reserved.
//

import SwiftUI
import UIKit

struct PlacesListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Place.entity(), sortDescriptors: []) var places: FetchedResults<Place>
    @State private var showModal: Bool = false
    @State private var navigationButtonID = UUID()
    @State private var menuButtonID = UUID()
    
    init() {
        UITableView.appearance().separatorColor = .clear
    }
    
    var body: some View {
        NavigationView {
                List {
                    ForEach(places){ place in
                        PlaceRow(place: place)
                    }
                    .onDelete(perform: removePlace)
                }
            .navigationBarTitle("Must see")
                .navigationBarItems(
                    trailing: Button(action: {
                        self.showModal.toggle()
                        let generator = UIImpactFeedbackGenerator(style: .heavy)
                        generator.impactOccurred()
                    }) {
                        Image("plus")
                    }
                    .id(self.navigationButtonID)
                    .sheet(isPresented: self.$showModal){
                        NewPlacePresenter().environment(\.managedObjectContext, self.moc).onDisappear {
                            self.navigationButtonID = UUID()
                        }
                    }
            )
                .foregroundColor(.black)
        }
    }
    
    func removePlace(at offsets: IndexSet) {
        for index in offsets {
            let place = places[index]
            moc.delete(place)
        }
        try? moc.save()
    }
}

struct PlacesListView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesListView()
    }
}
