//
//  Image+Extension.swift
//  PhotoEditor
//
//  Created by Anthony Tran on 11/07/2023.
//

import Foundation
import SwiftUI

extension Image: Hashable {
    public func hash(into hasher: inout Hasher) {
        UUID()
    }
}
