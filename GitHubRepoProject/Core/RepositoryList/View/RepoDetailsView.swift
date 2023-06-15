//
//  RepoDetailsView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import SwiftUI

struct RepoDetailsView: View {
    var repo: RepositoryModel?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(repo?.name ?? "")")
                                .font(.headline)
                                .bold()
                            
                            HStack {
                                Text("\(repo?.forksCount ?? 0) Forks")
                                
                                Text("\(repo?.openIssuesCount ?? 0) Open Issues")

                                Label {
                                    Text("\(repo?.stargazersCount ?? 0)")
                                } icon: {
                                    Image(systemName: "star.circle")
                                }
                            }
                            .font(.caption)
                            .bold()
                        }
                        
                        Spacer()
                        
                        VStack {
                            ImageLoaderView(url: repo?.owner?.avatarURL ?? "")
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                            
                            Text("\(repo?.owner?.gravatarID ?? "")")
                        }
                    }
                    

                }
                
//                HtmlTextView(htmlText: repo?.description ?? "", width: UIScreen.main.bounds.width - 64)
                
                Text("\(repo?.description ?? "")")
                    .font(.caption)
                
            }
            .padding()
            .navigationTitle(Text(repo?.name ?? ""))
        }
        
    }
}

struct RepoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailsView()
    }
}
