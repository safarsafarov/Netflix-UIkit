//
//  YoutubeSearchResponse.swift
//  netflix
//
//  Created by Safar Safarov on 27/11/22.
//

import Foundation



struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}


struct VideoElement: Codable {
    let id: IdVideoElement
}


struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
