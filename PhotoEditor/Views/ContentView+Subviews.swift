//
//  ContentView+Subviews.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation
import SwiftUI

extension ContentView {
    var topTitleView: some View {
        VStack {
            Image(systemName: "arrow.triangle.branch")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Unit 1.5 How to use Async/ Await")
        }
    }
    
    var localImagesPageView: some View {
        TabView {
            ForEach(loadedImages, id: \.self) { image in
                image
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
    
    var remoteImagesPageView: some View {
        TabView {
            ForEach(remoteImages) { photo in
                AsyncImage(
                    url: URL(string: photo.src.original),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
