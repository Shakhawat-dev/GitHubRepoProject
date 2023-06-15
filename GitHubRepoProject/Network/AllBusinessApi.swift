//
//  AllBusinessApi.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation

struct AllBusinessApi {
    //https://api.github.com/search/repositories?q={query}{&page,per_page,sort,order}
    
    static private let baseURL = "https://api.github.com"
    
    static let search = baseURL + "/search/repositories"

    
}
