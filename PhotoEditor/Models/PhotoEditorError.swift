//
//  PhotoEditorError.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation

enum PhotoEditorError: Error {
    case corruptedLocalImageData
    case badImageFilterInput
    case badRemoteImageURL
    case badResponseImageURL
    case failedDecodingResponseData
}
