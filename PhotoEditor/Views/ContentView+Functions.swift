//
//  ContentView+Functions.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation
import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension ContentView {
    
    //1. Change this function to async
    func readImagesFromFile() -> [Image] {
        let fileURL = Bundle.main.url(forResource: Self.fileName, withExtension: nil)!
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            var images: [UIImage] = []
            
            var offset = 0
            while offset < imageData.count {
                guard let range = Range(NSRange(location: offset, length: imageData.count - offset)) else { break }
                if let image = UIImage(data: imageData.subdata(in: range)) {
                    images.append(image)
                    offset += image.pngData()?.count ?? 0
                } else {
                    break
                }
            }
            loadedUIImages = images
            return images.map { Image(uiImage: $0) }
        } catch {
            print("Error reading images: \(error.localizedDescription)")
            return []
        }
    }
    
    
    //2. Change this function to async
    func applyRandomFilter() -> [Image] {
        var filteredImages = [Image]()
        let filters: [CIFilter] = [
            CIFilter.sepiaTone(),
            CIFilter.discBlur(),
            CIFilter.colorInvert(),
            CIFilter.photoEffectFade()
        ]
        let currentFilter = filters[Int.random(in: 0..<filters.count)]
        for image in loadedUIImages {
            let beginImage = CIImage(image: image)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            guard let outputImage = currentFilter.outputImage else { return [] }
            
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                let uiImage = UIImage(cgImage: cgimg)
                filteredImages.append(Image(uiImage: uiImage))
            }
        }
        return filteredImages
    }
    
    // 3 fetch a list of image and
    func fetchRemoteImages(query: String) throws -> [Photo] {
        guard let url = URL(string: "\(Constants.API.URL)/search?query=\(query)")
        else { throw PhotoEditorError.badRemoteImageURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue(
            Constants.API.AUTHORIZATION_KEY,
            forHTTPHeaderField: "Authorization"
        )
        
        /// you will need to look for a function support async/ await inside `URLSession` singleton
        /// you will then need to decode the received data into `PhotoResponse` struct
        /// Don't forget to throw `PhotoEditorError` where applicable
        
        return []
    }
}
