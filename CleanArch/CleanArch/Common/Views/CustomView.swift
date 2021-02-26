//
//  CustomView.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

// MARK: - Views

struct CustomView {

    struct MyCustomView: View {
        var body: some View {
            ScrollView {
                Text("TODO")
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Loaders

extension CustomView {

    struct LoaderView: View {
        let loading: Bool

        var body: some View {
            Group {
                if loading {
                    //ProgressView()
                }
            }
        }
    }
}

// MARK: - Placeholders

extension CustomView {

    struct PlaceholderView: View {
        let iconName: String
        let textTitle: String
        let textBody: String

        var body: some View {
            VStack(alignment: .center, spacing: 3) {
                Spacer()
                Image(iconName)
                    .frame(width: 32, height: 32)
                Text(textTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                Text(textBody)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(Assets.Colors.PlaceholderSecondary.rawValue))
                Spacer()
            }
        }
    }

    struct PlaceholderCompactView: View {
        let iconName: String
        let textTitle: String
        let textBody: String

        var body: some View {
            VStack(alignment: .center, spacing: 3) {
                Image(iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32, height: 32)
                Text(textTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
                Text(textBody)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(Assets.Colors.PlaceholderSecondary.rawValue))
                    .lineLimit(3)
                    .minimumScaleFactor(0.5)
            }
        }
    }
}

// MARK: - Controls

extension CustomView {

    struct Control {

        struct NavigationLink: View {
            let icon: String
            let text: String
            let leadingPadding: CGFloat

            init(icon: String, text: String, leadingPadding: CGFloat = 8) {
                self.icon = icon
                self.text = text
                self.leadingPadding = leadingPadding
            }

            var body: some View {
                HStack {
                    Image(icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .background(Color.black)
                    Text(text)
                    Spacer()
                }
            }
        }

        struct Badge: View {
            let label: String
            let disabled: Bool

            init(_ label: String = "", disabled: Bool = false) {
                self.label = label
                self.disabled = disabled
            }

            var body: some View {
                Text(label)
                    .padding(3)
                    .background(disabled ? .black : Color(Assets.Colors.Badge.rawValue))
                    .foregroundColor(disabled ? Color(Assets.Colors.TextDisabled.rawValue) : .white)
                    .clipShape(Circle())
            }
        }
    }
}

// MARK: - Cells

extension CustomView {

    struct AudioCell: View {
        let audio: Audio

        init(_ audio: Audio) {
            self.audio = audio
        }

        var body: some View {
            HStack(alignment: .top, spacing: 5) {
                WebImage(url: audio.image)
                    .resizable()
                    .placeholder(Image(Assets.Icons.Placeholder.rawValue))
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .cornerRadius(1)
                    .padding(.top, 4)
                VStack(alignment: .leading) {
                    Text(audio.title)
                        .lineLimit(2)
                    HStack {
                        Text(audio.uplodateTimestampPretty)
                        Text(audio.duration)
                    }
                    .lineLimit(1)
                    .foregroundColor(Color(Assets.Colors.CellTextSecondary.rawValue))
                }
            }
        }
    }

    struct PlaylistCell: View {
        let playlist: Playlist
        @State private var images = [URL]()

        init(_ playlist: Playlist) {
            self.playlist = playlist
        }

        var body: some View {
            HStack(alignment: .center, spacing: 6) {
                WebImage(url: images.first)
                    .onFailure(perform: { error in
                        if images.count > 1 {
                            images.removeFirst()
                        }
                    })
                    .resizable()
                    .placeholder(Image(Assets.Icons.Placeholder.rawValue))
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .cornerRadius(1)
                Text(playlist.title)
                    .lineLimit(2)
                Spacer()
            }
            .onAppear(perform: {
                if images.count == 0 {
                    images = playlist.imgFiles
                }
            })
        }
    }
}
