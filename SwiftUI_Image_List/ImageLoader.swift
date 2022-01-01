//
// Created by Desire L on 2022/01/01.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject {
    @Published
    var image: UIImage = UIImage(named: "profile")!

    init(urlString: String) {
        loadImage(urlString: urlString)
    }

    func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        fetchImageFromUrl(url: url)
            .resume()
    }

    private func fetchImageFromUrl(url: URL) -> URLSessionDataTask {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse else {
                return
            }
            print("### HTTP STATUS CODE = \(response.statusCode)")
            guard let data = data else {
                return
            }

            guard let loadedImage = UIImage(data: data) else {
                return
            }

            DispatchQueue.main.async {
                self.image = loadedImage
            }

        }
    }


}
