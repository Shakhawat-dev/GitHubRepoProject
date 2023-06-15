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
                Text("\(repo?.fullName ?? "")")
                    .font(.title)
                
                Text("\(repo?.description ?? "")")
                    .font(.body)
            }
            .padding()
        }
        
    }
}

struct RepoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RepoDetailsView()
    }
}
