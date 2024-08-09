//
//  PhotoSource.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation

struct PhotoSource: Codable {
    let original: String
    let large2x: String
    let large: String
    let medium: String
    let small: String
    let portrait: String
    let landscape: String
    let tiny: String
}
