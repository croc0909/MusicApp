//
//  FrontPage.swift
//  MusicApp
//
//  Created by AndyLin on 2022/6/20.
//

import SwiftUI

struct FrontPage: View {
    var body: some View {
        TabView{
            SongList()
                .tabItem{
                    Image(systemName:"music.house.fill")
                    Text("首頁")
                }
            SearchPage()
                .tabItem{
                    Image(systemName:"magnifyingglass")
                    Text("搜尋")
                }
            SongList()
                .tabItem{
                    Image(systemName:"square.stack.3d.down.right")
                    Text("音樂庫")
                }
        }
    }
}

struct FrontPage_Previews: PreviewProvider {
    static var previews: some View {
        FrontPage()
    }
}
