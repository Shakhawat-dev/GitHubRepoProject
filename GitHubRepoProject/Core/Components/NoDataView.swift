//
//  NoDataView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import SwiftUI

struct NoDataView: View {
    var message: String? = nil
    var action: () -> Void = {}
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "tray.2")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text(message ?? "No Data")
                .font(.title)
            
            if let _ = message {
                Button("Refresh") {
                    action()
                }
            }
        }
    }
}

struct NoDataView_Previews: PreviewProvider {
    static var previews: some View {
        NoDataView()
    }
}
