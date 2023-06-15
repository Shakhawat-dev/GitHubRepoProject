//
//  BaseMOdel.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation

struct BaseModel<T: Codable>: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [T]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
