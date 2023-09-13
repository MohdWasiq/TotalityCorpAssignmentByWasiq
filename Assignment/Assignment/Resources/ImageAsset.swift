//
//  ImageAsset.swift
//  Assignment
//
//  Created by Ahmad Qureshi on 13/09/23.
//

import SwiftUI

enum ImageAsset: String {
    case icon
    case thumbnail
    
    var set: Image {
        return Image(self.rawValue)
    }
}
