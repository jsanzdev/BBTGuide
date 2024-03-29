//
//  RatingViewCell.swift
//  BBTGuide
//
//  Created by Jesus Sanz on 21/12/22.
//

import SwiftUI

struct RatingViewCell: View {
    let rating: Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingViewCell_Previews: PreviewProvider {
    static var previews: some View {
        RatingViewCell(rating:4)
    }
}
