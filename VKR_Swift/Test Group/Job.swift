//
//  Job.swift
//  VKR_Swift
//
//  Created by Vagan Albertyan on 10.10.2022.
//

import SwiftUI


struct Job {
    var id = UUID()
    var title : String
    var location : String
    var bgColor: UIColor
    var image: UIImage
}

//Demo list of jobs

let jobs = [
    Job(title: "Photographer", location: "Artist Hub    .   California", bgColor: #colorLiteral(red: 0.9176470588, green: 0.3843137255, blue: 0.4196078431, alpha: 0.06), image: #imageLiteral(resourceName: "Photographer")),
    Job(title: "Software Engineer", location: "Techno Ltd    .   Moscow", bgColor: #colorLiteral(red: 0.9176470588, green: 0.3843137255, blue: 0.4196078431, alpha: 0.06), image: #imageLiteral(resourceName: "soft")),
    Job(title: "Content Writer", location: "Artist Hub    .   Erevan", bgColor: #colorLiteral(red: 0.9176470588, green: 0.3843137255, blue: 0.4196078431, alpha: 0.06), image: #imageLiteral(resourceName: "content")),
    Job(title: "QA Engnineer", location: "Artist Hub    .   Tbilisi", bgColor: #colorLiteral(red: 0.9176470588, green: 0.3843137255, blue: 0.4196078431, alpha: 0.06), image: #imageLiteral(resourceName: "qa")),
]
