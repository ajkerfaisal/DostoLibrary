//
//  SwiftUIView.swift
//  DostoLibrary
//
//  Created by Mohammad Faisal on 12/06/2025.
//

import SwiftUI

public struct DostoView: View {
    
    var html: String = ""
    
    public init(_ html: String){
        self.html = html
    }
    
    public var body: some View {
        WebView(html: html)
    }
}

#Preview {
    DostoView("""
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body { 
                    font-family: -apple-system, sans-serif; 
                    color: \(UIColor.label.hexString);
                    background-color: \(UIColor.systemBackground.hexString);
                }
                h1 { color: \(UIColor.systemBlue.hexString); }
            </style>
        </head>
        <body style="background: cyan;">
            <h1>Hello SwiftUI!</h1>
            <p>This is dynamically rendered HTML content.</p>
        </body>
        </html>
        """)
}

extension UIColor {
    var hexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        getRed(&r, green: &g, blue: &b, alpha: &a)
        
        let rgb = Int(r * 255) << 16 | Int(g * 255) << 8 | Int(b * 255) << 0
        
        return String(format: "#%06x", rgb)
    }
}
