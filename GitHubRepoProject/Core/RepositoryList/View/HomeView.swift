//
//  HomeViewView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm: HomeViewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
//                if let movies = vm.movieList {
                    VStack {
                        List(vm.gitList, id: \.id) { repo in
                            GitRowView(repo: repo)
                                .id(repo.id)
                                .onAppear() {
                                    DispatchQueue.global().sync {
                                        // For infinite scroll
                                        if repo.id == vm.gitList.last?.id {
//                                            vm.goNext()
                                            
                                            withAnimation {
                                                vm.showTop = true
                                            }
                                        }
                                    }
                                }
                        }
                        .listStyle(PlainListStyle())
                        .overlay(alignment: Alignment.bottomTrailing) {
                            if vm.showTop {
                                Button {
                                    withAnimation {
                                        proxy.scrollTo(vm.gitList.first?.id)
                                        vm.showTop = false
                                        vm.showLoader = false
                                    }
                                } label: {
                                    Image(systemName: "arrow.up")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background {
                                            Circle()
                                        }
                                }
                                .padding(.all)
                            }
                            
                        }
                        
                        
                    }
                    .overlay(alignment: .bottom) {
                        if vm.showLoader {
                            ProgressView()
                        }
                    }
//                } else {
//                    NoDataView()
//                }
            }
            
            
            if vm.gitList.isEmpty {
                NoDataView()
            }
        }
        .searchable(text: $vm.searchText, prompt: "Search Something")
        .navigationTitle("Github Repository List")

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
