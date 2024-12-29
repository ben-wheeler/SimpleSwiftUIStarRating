# SimpleSwiftUIStarRating
A simple component used to view star ratings in SwiftUI.

### Requires:
iOS 14+

### Installation
Installation can be handled via Xcode. `File` > `Add package dependencies` using the Package URL: `https://github.com/ben-wheeler/SimpleSwiftUIStarRating`

See Xcode [documentation for more details](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

## Example Usages
Component can easily be created with only a `rating:`. But can also take in additional `color` and `maxRating`. 
For Example:
```
SimpleSwiftUIStarRating(rating: 1.5)
SimpleSwiftUIStarRating(rating: 4.0, maxRating: 10)
SimpleSwiftUIStarRating(rating: 3.5, starColor: .red)
```

Example usages:
```
SimpleSwiftUIStarRating(rating: 3.5, maxRating: 5, starColor: .red)
SimpleSwiftUIStarRating(rating: 4.0, maxRating: 10, starColor: .blue)
SimpleSwiftUIStarRating(rating: 1.5, maxRating: nil, starColor: nil)
```