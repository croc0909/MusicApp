//
//  PlayPage.swift
//  MusicApp
//
//  Created by AndyLin on 2022/6/20.
//

import SwiftUI
import AVFoundation
var Musicplaybool = false
let player = AVPlayer()
var Musicplayicon = "play.circle.fill"
var musicIndex = 0
var playIndex = 0

struct PlayPage: View {
    @State private var scale:Double = 1
    @State var time:CGFloat = 0;
    @State var musicDataIndex:Int
    @State public var DDDD:Float!
    
    var body: some View {
        VStack{
            //let XX = print(String(musicDataIndex))
            Image(songs[musicDataIndex].name)
                      .resizable()
                      .scaledToFill()
                      .frame(width: 400, height: 400)
                      .clipped()
            Text(songs[musicDataIndex].name)
                .padding(.leading,10)
                .font(.system(size: 25))
            Text(songs[musicDataIndex].singer)
                .padding(.leading,10)
                .font(.system(size: 20))
            
            ZStack{
                Capsule()
                    .fill(Color.gray).frame(height: 8)
                    .padding(8)
                Capsule()
                    .fill(Color.blue).frame(width: time, height: 8)
                    .padding(8)
            }
            
            let scaleString = scale.formatted(.number.precision(.fractionLength(2)))
            HStack{
            Text("00")
                    .padding(.leading,10)
            Spacer()
            Text("010")
                    .padding(.trailing,10)
            }
            HStack{
                Button(action: {
                    
                }, label: {
                    Image(systemName:"shuffle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                })
                .padding(.leading, 20)
                Spacer()
                Button(action: {
                    musicDataIndex-=1
                    BackwardMusic()
                }, label: {
                    Image(systemName:"backward.end")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                })
                Spacer()
                Button(action: {
                    ViewInit(value: musicDataIndex)
                    CheckPlayerButton(name: songs[musicDataIndex+musicIndex].name)
                }, label: {
                    Image(systemName:Musicplayicon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipped()
                })
                Spacer()
                Button(action: {
                    musicDataIndex+=1
                    ForwardMusic()
                }, label: {
                    Image(systemName:"forward.end")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipped()
                })
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image(systemName:"repeat")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipped()
                })
                .padding(.trailing, 20)
            }
            
        }
      
    }
}

struct PlayPage_Previews: PreviewProvider {
    static var previews: some View {
        PlayPage(musicDataIndex: 1)
    }
}

func CheckPlayerButton(name:String){
    if(!Musicplaybool)
    {
        Musicplaybool = true
        //Musicplayicon = "pause.circle"
        PlayMusic(musicName: name)
        
    }else{
        Musicplaybool = false
        //Musicplayicon = "play.circle.fill"
        player.pause()
    }
}

func PlayMusic(musicName:String){
    let fileUrl = Bundle.main.url(forResource: musicName, withExtension: "mp3")!
    let playerItem = AVPlayerItem(url: fileUrl)
    player.replaceCurrentItem(with: playerItem)
    player.play()
    MusicSchedule()
}

func ViewInit(value:Int)
{
    playIndex = value
}

func ForwardMusic()
{
    musicIndex+=1
    PlayMusic(musicName: songs[playIndex+musicIndex].name)
}

func BackwardMusic()
{
    musicIndex-=1
    PlayMusic(musicName: songs[playIndex+musicIndex].name)
}


func MusicSchedule(){
    let screenWidth = UIScreen.main.bounds.width - 20
    let currenttime = player.currentTime().seconds
    let duration = player.currentItem?.asset.duration
    let durationtime = CMTimeGetSeconds(duration!)
    let durationtimefloat = Float(durationtime)
    
    
    var log_y = print(currenttime)
    var log_z = print("-------------------")
    var log_x = print(durationtimefloat)

}
