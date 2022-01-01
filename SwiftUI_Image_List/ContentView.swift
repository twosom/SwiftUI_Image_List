//
//  ContentView.swift
//  SwiftUI_Image_List
//
//  Created by Desire L on 2022/01/01.
//
//

import SwiftUI

// https://61cfc2fe65c32600170c7fbc.mockapi.io/user


struct ContentView: View {

    private var webService = WebService()

    @State
    private var userList = [UserModel]()

    private var columns = [GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(userList) { (user: UserModel) in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            UserListView(user: user)
                        }

                    }
                }
            }
                .navigationBarTitle("User List", displayMode: .large)
        }


            .onAppear {
                try! webService.loadUsers { (userList: [UserModel]) in
                    self.userList = userList
                }
            }
            


            .eraseToAnyView()
    }

    #if DEBUG
    @ObservedObject var iO = injectionObserver
    #endif
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
