//
//  ContentView.swift
//  fi-news-ios
//
//  Created by Markus Reinhold on 25.02.23.
//

import SwiftUI


struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            Button("Download") {
                callApi()
            }
            if (isLoading) {
                Text("loading...")
            } else {
                Text("finished")
            }
        }
    }
    
    func callApi() {
        isLoading = true
        NewsRepository().callApi(flutter: true) { data in
            isLoading = false
        }
    }
}



struct ContentViewProvider: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
