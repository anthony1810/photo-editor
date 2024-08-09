//
//  ContentView.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 09/07/2023.
//

import SwiftUI


struct ContentView: View {
    
    @State var loadedImages = [Image]()
    @State var loadedUIImages = [UIImage]()
    @State var remoteImages = [Photo]()
    
    @State var isLoading = false
    
    @State var searchText: String = ""
    
    static let totalImageCount = 12
    static let fileName = "secrets"
    
    let context = CIContext()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                topTitleView
                
                ZStack {
                    localImagesPageView
                        .opacity(loadedImages.isEmpty ? 0.0 : 1.0)
                   
                    remoteImagesPageView
                        .opacity(remoteImages.isEmpty ? 0.0 : 1.0)
                }
                
                Button(action: {
                    remoteImages.removeAll()
                    /* You need to figure out how to call asynchronously */
                    loadedImages = readImagesFromFile()
                }) {
                    Text("Load Images")
                }
                
                Button(action: {
                    /* You need to figure out how to call asynchronously */
                    loadedImages = applyRandomFilter()
                }) {
                    Text("Apply Filter")
                }
                .disabled(loadedUIImages.isEmpty)
            }
            .overlay(
                ProgressView()
                    .opacity(isLoading ? 1.0 : 0.0)
            )
            .padding()
        }
        .searchable(text: $searchText, prompt: "Look for something")
        .onChange(of: searchText) { newValue in
            loadedImages.removeAll()
            loadedUIImages.removeAll()
            /// write your function body and call them here and assign to `remoteImages`
            /// fetchRemoteImages(query: newValue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

