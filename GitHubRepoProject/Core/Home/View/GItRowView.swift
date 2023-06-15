//
//  GItRowView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import SwiftUI

struct GItRowView: View {
    var repo: RepositoryModel?
    
    var body: some View {
        Text("\(repo?.name ?? "")")
    }
}

struct GItRowView_Previews: PreviewProvider {
    static var previews: some View {
        GItRowView()
    }
}
