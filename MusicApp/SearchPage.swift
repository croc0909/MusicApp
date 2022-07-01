//
//  SearchPage.swift
//  MusicApp
//
//  Created by AndyLin on 2022/6/20.
//

import SwiftUI

struct SearchPage: View {
    let names = [["孤獨","暫時的記號"],["LoveIsACompass","慢冷"]]
    let searchnames = [["Podcast","現場活動"],["排行榜","家居生活"],["電台","最新發行"]]
    var columnCount = 2
    let photoWidth = (UIScreen.main.bounds.size.width - 10)/2
    
    var body: some View {
        List{
            Text("你最喜歡的歌曲類型")
            ForEach(0..<names.count){ (row) in
                HStack(spacing:10){
                    ForEach(0..<self.names[row].count) { (column) in
                        Image(self.names[row][column])
                            .resizable()
                            .scaledToFill()
                            .frame(width: self.photoWidth, height: self.photoWidth/2)
                            .clipped()
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .onAppear{
                UITableView.appearance().separatorColor = .clear
            }
            
            Text("瀏覽全部")
            ForEach(0..<searchnames.count){ (row) in
                HStack(spacing:10){
                    ForEach(0..<self.searchnames[row].count) { (column) in
                        Image(self.searchnames[row][column])
                            .resizable()
                            .scaledToFill()
                            .frame(width: self.photoWidth, height: self.photoWidth/2)
                            .clipped()
                    }
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .onAppear{
                UITableView.appearance().separatorColor = .clear
            }
        }
        
    }
}

struct SearchPage_Previews: PreviewProvider {
    static var previews: some View {
        SearchPage()
    }
}
