//
//  HotelDetail.swift
//  MyProject
//
//  Designed in DetailsPro
//  Copyright © (My Organization). All rights reserved.
//

import SwiftUI

struct HotelDetail: View {
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [.black, .yellow.opacity(0.7)]), startPoint: .top, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        ScrollView {
            
            VStack {
                ZStack(alignment: .top) {
              
                    
                    Image("coverr")
                      
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 390, height: 320)
                        .clipped()
                        .shadow(radius: 20)
                    HStack {
                        Image(systemName: "arrow.backward")
                            .font(.title3)
                            .padding(11)
                            .background {
                                Circle()
                                    .fill(Color(.white))
                            }
                        Spacer()
                    }
                    .padding()
                    .padding(.top, 44)
                }
                .frame(width: 390, height: 320)
                .clipped()
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("1917")
                            .shadow(radius: 20)
                            .font(.system(size: 29, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                        
                        Spacer()
                        HStack(alignment: .firstTextBaseline, spacing: 3) {
                            Image(systemName: "star.fill")
                                .symbolRenderingMode(.multicolor)
                            Text("4.55")
                                .foregroundColor(.white)
                        }
                        .font(.subheadline.weight(.medium))
                    }
                    Text("East NY")
                        .foregroundColor(.white)
                        .font(.callout.weight(.medium))
                    Text("Recently re-opened in 2017, The Brookfield is a shining example of a design hotel — 423 custom rooms warmly greet jet-setting guests. Make your next stay in New York a relaxing, elegant one at The Brookfield.")
                        .foregroundColor(.white)
                        .font(.callout)
                        .padding(.vertical)
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
                VStack(alignment: .leading, spacing: 15) {
                    Text("HIGHLIGHTS")
                   
                        .kerning(2.0)
                        .font(.system(size: 12, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    ForEach(0..<3) { _ in // Replace with your data model here
                        HStack(spacing: 9) {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.red)
                                .frame(width: 20)
                                .clipped()
                            Text("Amazing!!")
                            Spacer()
                        }
                        .foregroundColor(.white)
                        .font(.subheadline)
                    }
                }
                .padding(.horizontal, 24)
                VStack(spacing: 14) {
                    HStack(spacing: 4) {
                        Text("$49")
                            .foregroundColor(.white)
                            .font(.headline)
                        Text("per person")
                            .foregroundColor(.white)
                    }
                    Text("Reserve")
                        .font(.title3.weight(.medium))
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(.yellow)
                        .foregroundColor(.white)
                        .shadow(radius: 20)
                        .mask {
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                        }
                }
                .padding(.vertical, 28)
            }
        } }
    }
}

struct HotelDetail_Previews: PreviewProvider {
    static var previews: some View {
        HotelDetail()
    }
}
