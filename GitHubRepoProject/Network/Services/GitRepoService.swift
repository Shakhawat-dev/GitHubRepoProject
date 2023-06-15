//
//  GitRepoService.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation

class GitRepoService: ServiceBase {
    @Published var gitListData: BaseModel<RepositoryModel>?
    
    override init() {
        super.init()
        loadData()
    }
    
    func loadData(
        query: String? = ""
    ) {
        
        self.isLoading = true
        guard var url = URL(string: AllBusinessApi.search) else { return }
        
        url.appendQueryItem(name: "q", value: "{\(query ?? "")}{&page,per_page,sort,order}")

        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(request)
        
        serviceSubscription = NetworkManager.requestData(for: request)
            .decode(type: BaseModel<RepositoryModel>.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (receivedResponse) in
                self?.gitListData = receivedResponse
                self?.serviceSubscription?.cancel()
                
                self?.isLoading = false
                print("GitRepoService \(self?.gitListData as Any)")
                
            })
    }
}
