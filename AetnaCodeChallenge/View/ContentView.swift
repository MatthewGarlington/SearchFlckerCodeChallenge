//
//  ContentView.swift
//  AetnaCodeChallenge
//
//  Created by us-guest on 11/20/21.
//

import SwiftUI

struct MenuView: View {
    @State
    var isBookSearchNoCancellationPresented = false
    var body: some View {
        NavigationView {
            ImageSearchView()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct NavigationButton<Label, Destination>: View where Label: View, Destination: View {
    @State private var isSheetPresented = false
    private var title: Label
    private var description: String?
    private var destination: () -> Destination
    
    public init(_ title: Label, description: String? = nil, @ViewBuilder destination: @escaping () -> Destination) {
        self.title = title
        self.description = description
        self.destination = destination
    }
    
    var body: some View {
        Button(action: { isSheetPresented.toggle()} ) {
            title
                .sheet(isPresented: $isSheetPresented) {
                    NavigationView {
                        destination()
                    }
                }
        }
    }
}
