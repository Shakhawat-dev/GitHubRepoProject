//
//  ImageLoaderService.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation
import SwiftUI
import Combine

class ImageLoaderService {
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let url: String
    
    init(url: String) {
        self.url = url
        downloadImage()
    }

    
    private func downloadImage() {
        guard let url = URL(string: url) else { return }
        
        imageSubscription = NetworkManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = downloadedImage
                self.imageSubscription?.cancel()
            })
    }
}
