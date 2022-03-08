//
//  CacheAsyncImage.swift
//  NabTest
//
//  Created by tungdev on 06/03/2022.
//

import Foundation
import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View{
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    init(
        url: URL,
        scale: CGFloat = 1.0,
        transaction: Transaction = Transaction(),
        @ViewBuilder content: @escaping (AsyncImagePhase) -> Content
    ){
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    var body: some View{
        if let cached = ImageCache[url]{
            let _ = print("cached: \(url.absoluteString)")
            content(.success(cached))
        }else{
            let _ = print("request: \(url.absoluteString)")
            AsyncImage(url: url, transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    func cacheAndRender(phase: AsyncImagePhase) -> some View{
        if case .success (let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}
fileprivate class ImageCache{
    static private var cache: CacheLRU<URL, Image> = CacheLRU<URL, Image>(capacity: 100)
    static subscript(url: URL) -> Image?{
        get {
            cache.getValue(for: url)
        }
        set {
            if let value = newValue {
                cache.setValue(value, for: url)
            }
        }
    }
}
