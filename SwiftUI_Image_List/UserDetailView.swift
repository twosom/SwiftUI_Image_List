//
// Created by Desire L on 2022/01/01.
//

import SwiftUI


struct UserDetailView: View {

    var user: UserModel

    var body: some View {
        VStack {
            Spacer()
            URLImageView(urlString: user.avatarUrl!)
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width)
                .clipShape(Circle())
                .shadow(color: .gray, radius: 20)
            HStack {
                Spacer()
                VStack {
                    Text(user.name ?? "")
                        .font(.largeTitle)
                    Text(user.createdAt!)
                }
                Spacer()
            }
                .background(.brown.opacity(0.2))
                .shadow(color: .gray, radius: 20)
            Spacer()
            Spacer()
            Spacer()
        }
    }
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserModel(id: "1", name: "Justin Brown", avatarUrl: "http://placeimg.com/640/480/nature", createdAt: "2021-12-31T23:38:43.601Z"))
    }
}
