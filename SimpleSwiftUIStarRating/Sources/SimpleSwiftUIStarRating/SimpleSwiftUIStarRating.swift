// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

struct StarRatingView: View {
    var rating: Double
    var maxRating: Int?
    var starColor: Color?

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

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<effectiveMaxRating, id: \.self) { index in
                Image(systemName: starType(for: index))
                    .foregroundColor(starColor ?? .yellow)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Rating \(rating, specifier: "%.1f") out of \(effectiveMaxRating)")
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            StarRatingView(rating: 3.5, maxRating: 5, starColor: .red)
            StarRatingView(rating: 4.0, maxRating: 10, starColor: .blue)
            StarRatingView(rating: 1.5, maxRating: nil, starColor: nil)
        }
        .padding()
    }
}
