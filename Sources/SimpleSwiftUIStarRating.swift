// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  SimpleSwiftUIStarRating.swift
//  SimpleSwiftUIStarRating
//
//  Created by Ben Wheeler on 29/12/2023.
//

import SwiftUI

@available(iOS 14.0, macOS 11.0, watchOS 7, tvOS 14.0, *)
public struct SimpleSwiftUIStarRating: View {
    var rating: Double
    var maxRating: Int?
    var color: Color?

    private var effectiveMaxRating: Int {
        maxRating ?? 5
    }

    private func starType(for index: Int) -> String {
        let roundedRating = (rating * 2).rounded(.toNearestOrEven) / 2
        let fullStars = floor(roundedRating)
        let isHalfStar = roundedRating - fullStars == 0.5

        if Double(index) < fullStars {
            return "star.fill"
        } else if Double(index) == fullStars && isHalfStar {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }
    
    public init(rating: Double, maxRating: Int? = nil, color: Color? = nil) {
        self.rating = rating
        self.maxRating = maxRating
        self.color = color
    }


    public var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<effectiveMaxRating, id: \.self) { index in
                Text(Image(systemName: starType(for: index)))
                    .foregroundColor(color ?? .yellow)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rating \(rating, specifier: "%.1f") out of \(effectiveMaxRating)")
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            SimpleSwiftUIStarRating(rating: 3.26, maxRating: 5, color: .red)
            SimpleSwiftUIStarRating(rating: 4.0, maxRating: 10, color: .blue)
            SimpleSwiftUIStarRating(rating: 1.5, maxRating: nil, color: nil)
                .font(.title)
        }
        .padding()
    }
}
