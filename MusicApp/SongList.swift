//
//  SongList.swift
//  MusicApp
//
//  Created by AndyLin on 2022/6/17.
//

import SwiftUI
import os

var SongNumber = "SONLIST"

struct SongList: View {
  
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Image("專輯")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipped()
                Text("播放清單")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,10)
                    .font(.system(size: 25))
                
                    ForEach(0..<songs.count){ (index) in
                        NavigationLink(destination: PlayPage( musicDataIndex: index)){
                            SongRow(song:songs[index])
                            
                        }
                    }
              
            }
        }
    }
}

struct SongList_Previews: PreviewProvider {
    static var previews: some View {
        SongList()
    }
}
