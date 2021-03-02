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

    struct DetailView: View {
        let detailItem: DetailItem

        init(_ detailItem: DetailItem) {
            self.detailItem = detailItem
        }

        var body: some View {
            HStack(alignment: .top, spacing: 5) {
                WebImage(url: detailItem.image)
                    .resizable()
                    .placeholder(Image(Assets.Icons.Placeholder.rawValue))
                    .transition(.fade(duration: 0.5))
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .cornerRadius(1)
                    .padding(.top, 4)
                VStack(alignment: .leading) {
                    Text(detailItem.name)
                        .lineLimit(2)
                    Text(detailItem.timestampPretty)
                        .lineLimit(1)
                        .foregroundColor(Color(Assets.Colors.CellTextSecondary.rawValue))
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
                        .frame(width: 32, height: 32)
                        .background(Color.black)
                    Text(text)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Cells

extension CustomView {

    struct ListItemCell: View {
        let listItem: ListItem
        @State private var images = [URL]()

        init(_ listItem: ListItem) {
            self.listItem = listItem
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
                    .frame(width: 32, height: 32)
                    .cornerRadius(1)
                Text(listItem.name)
                    .lineLimit(2)
                Spacer()
            }
            .onAppear(perform: {
                if images.count == 0 {
                    images = listItem.images
                }
            })
        }
    }
}
