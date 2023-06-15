//
//  HtmlTextView.swift
//  GitHubRepoProject
//
//  Created by Shakhawat Hossain Shahin on 6/15/23.
//

import Foundation
import SwiftUI
import WebKit

struct HtmlTextView: UIViewRepresentable {
    
    let htmlText: String
    let width: CGFloat
    
    func makeUIView(context: Context) -> UILabel {
//        let webView = WKWebView(frame: .zero)

        let data = htmlText.data(using: String.Encoding(rawValue: String.Encoding.unicode.rawValue))!
        let label = UILabel()
        let attributedString = try? NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        
//        webView.loadHTMLString(htmlText, baseURL: nil)
        label.attributedText = attributedString
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: "Sans", size: 20 )
        label.preferredMaxLayoutWidth = width
        label.autoresizesSubviews = true
        label.isUserInteractionEnabled = true
        
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
//        uiView.loadHTMLString(htmlText, baseURL: nil)
    }
}
