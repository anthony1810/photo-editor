//
//  Photo.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation

struct Photo: Codable, Identifiable {
    let id: Int
    let src: PhotoSource
}
