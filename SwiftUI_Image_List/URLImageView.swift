//
// Created by Desire L on 2022/01/01.
//

import SwiftUI

struct URLImageView: View {

    @ObservedObject
    var loader: ImageLoader

    init(urlString: String) {
        loader = ImageLoader(urlString: urlString)
    }

    var body: some View {
        Image(uiImage: loader.image)
            .resizable()
    }
}