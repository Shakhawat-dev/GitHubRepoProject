//
//  GItRowView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import SwiftUI

struct GitRowView: View {
    var repo: RepositoryModel?
    
    var body: some View {
        NavigationLink {
            RepoDetailsView(repo: repo)
        } label: {
            Text("\(repo?.name ?? "")")
        }

        
    }
}

struct GitRowView_Previews: PreviewProvider {
    static var previews: some View {
        GitRowView()
    }
}
