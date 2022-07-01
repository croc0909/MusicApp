//
//  SongRow.swift
//  MusicApp
//
//  Created by AndyLin on 2022/6/17.
//

import SwiftUI

struct SongRow: View {
    var song:Song
    var body: some View {
        HStack{
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .padding(.leading,10)
                .clipped()
            VStack(alignment: .leading){
                Text(song.name)
                    .font(.system(size: 20))
                Text(song.singer)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                
            }, label: {
                Image(systemName:"ellipsis.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.black)
                    .clipped()
            })
            .padding(.trailing,10)
            //Spacer()
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song:Song(name: "LoveIsACompass", singer: "Griff"))
            .previewLayout(.fixed(width: 400, height: 70))
        
    }
}
