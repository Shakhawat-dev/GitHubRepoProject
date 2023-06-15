//
//  ServiceBase.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation
import Combine

class ServiceBase {
    @Published var isLoading = false
    @Published var isError = false
    
    var serviceSubscription: AnyCancellable?
}
