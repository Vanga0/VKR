//
//  Categories.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 10.10.2022.
//

import SwiftUI

struct Category: Identifiable {
    var id = UUID()
    let name: String
}

let categories = [
    Category(name: "All"),
    Category(name: "IT"),
    Category(name: "Real Estate"),
    Category(name: "Design"),
    Category(name: "Business"),
]



