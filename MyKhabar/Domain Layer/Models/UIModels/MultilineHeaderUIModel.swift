//
//  MultilineHeaderUIModel.swift
//  MyKhabar
//
//  Created by Diptiranjan Rout on 27/01/25.
//

import SwiftUI

struct MultilineHeaderUIModel {
    let headers: [(text: String, font: Font, textColor: Color, lineLimit: Int)]
    let maxWidth: CGFloat
}
