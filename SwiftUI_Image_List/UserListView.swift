//
// Created by Desire L on 2022/01/01.
//

import SwiftUI

struct UserListView: View {

    var user: UserModel

    var body: some View {
        HStack {
            URLImageView(urlString: user.avatarUrl!)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .padding()
                .shadow(color: .gray, radius: 20)
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Text("ID : \(user.id ?? "")")
                        .font(.title3)
                        .padding(.trailing, 10)
                }

                HStack {
                    Spacer()
                    Text("\(user.name ?? "No Name")")
                        .font(.title2)
                        .padding(.trailing, 10)
                }

            }
                .background(.gray.opacity(0.1))
                .shadow(color: .red, radius: 20)

        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView(user: UserModel(id: "1", name: "Justin Brown", avatarUrl: "http://placeimg.com/640/480/nature", createdAt: "2021-12-31T23:38:43.601Z"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/400.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
    }
}
