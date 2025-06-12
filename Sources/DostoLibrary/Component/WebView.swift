//
//  File.swift
//  DostoLibrary
//
//  Created by Mohammad Faisal on 12/06/2025.
//

import SwiftUI
import WebKit

struct EnhancedWebView: UIViewRepresentable {
    enum Content {
        case html(String, baseURL: URL? = nil)
        case url(URL)
    }
    
    let content: Content
    var tintColor: Color = .accentColor
    var allowsBackForwardNavigationGestures: Bool = true
    var allowsLinkPreview: Bool = true
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.configuration.preferences.javaScriptEnabled = true
        webView.allowsBackForwardNavigationGestures = allowsBackForwardNavigationGestures
        webView.allowsLinkPreview = allowsLinkPreview
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        switch content {
        case .html(let html, let baseURL):
            uiView.loadHTMLString(html, baseURL: baseURL)
        case .url(let url):
            uiView.load(URLRequest(url: url))
        }
    }
}

struct WebView: UIViewRepresentable {
    let htmlContent: String
    let baseURL: URL?
    
    init(html: String, baseURL: URL? = nil) {
        self.htmlContent = html
        self.baseURL = baseURL
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.isOpaque = false
        webView.backgroundColor = .clear
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.loadHTMLString(htmlContent, baseURL: baseURL)
    }
}
