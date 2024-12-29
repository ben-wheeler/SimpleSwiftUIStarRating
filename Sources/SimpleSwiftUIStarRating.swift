// The Swift Programming Language
// https://docs.swift.org/swift-book
//
//  SimpleSwiftUIStarRating.swift
//  BookEnd
//
//  Created by Ben Wheeler on 29/12/2023.
//

import SwiftUI

public struct SimpleSwiftUIStarRating: View {
    var rating: Double
    var maxRating: Int?
    var color: Color?

    private var effectiveMaxRating: Int {
        maxRating ?? 5
    }

    private func starType(for index: Int) -> String {
        let fullStars = floor(rating)
        let isHalfStar = rating - fullStars >= 0.5

        if Double(index) < fullStars {
            return "star.fill"
        } else if Double(index) == fullStars && isHalfStar {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }

    public var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<effectiveMaxRating, id: \.self) { index in
                Image(systemName: starType(for: index))
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
            SimpleSwiftUIStarRating(rating: 3.5, maxRating: 5, color: .red)
            SimpleSwiftUIStarRating(rating: 4.0, maxRating: 10, color: .blue)
            SimpleSwiftUIStarRating(rating: 1.5, maxRating: nil, color: nil)
        }
        .padding()
    }
}
