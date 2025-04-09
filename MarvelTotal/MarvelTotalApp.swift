//
//  MarvelTotalApp.swift
//  MarvelTotal
//
//  Created by Yery Castro on 13/3/25.
//

import SwiftUI

@main
struct MarvelTotalApp: App {
    @State var vm = MarvelVM()
    
    var body: some Scene {
        WindowGroup {
            MarvelMain()
                .environment(vm)
        }
    }
}
