//
//  HomeViewModel.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var gitSearchResponse: BaseModel<RepositoryModel>?
    
    @Published var gitList: [RepositoryModel] = []
    
    private let gitRepoService = GitRepoService()
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var searchText: String = ""
    @Published var page: Int = 1
    @Published var showLoader: Bool = false
    
//    @Published var scrollViewOffset: CGFloat = 0
    @Published var showTop: Bool = false
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        gitRepoService.$gitListData
            .sink { [weak self] (response) in
                self?.gitSearchResponse = response
                self?.gitList.append(contentsOf: self?.gitSearchResponse?.items ?? [])
                self?.showLoader = false
//                print(self?.gitList)
            }
            .store(in: &cancellables)
        
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .sink { [weak self] (text) in
                if text.isEmpty {
                    return
                }
                self?.gitList.removeAll()
                self?.page = 1
//                self?.gitRepoService.gitListData(query: text, page: self?.page ?? 1)
                self?.gitRepoService.loadData(query: text)
            }
            .store(in: &cancellables)
        
//        $page
//            .sink { [weak self] (page) in
//                self?.gitRepoService.getMovies(query: self?.searchText ?? "", page: page)
//                self?.showLoader = true
//            }
//            .store(in: &cancellables)

    }
    
    
    /// This method will check the page number is smaller or equal
    /// to the response page number and will increase the page number if smaller
//    func goNext() {
//        guard let listPage = gitSearchResponse?.page else { return }
//        
//        if self.page <= listPage {
//            page += 1
//        }
//    }
}
