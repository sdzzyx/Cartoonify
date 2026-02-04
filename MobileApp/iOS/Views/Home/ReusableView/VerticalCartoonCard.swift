//
//  CartoonCardView.swift
//  Cartoonify
//
//  Created by Lenard Cortuna on 1/28/26.
//
import SwiftUI

struct VerticalCartoonCard: View {
    @Binding var cartoon: Cartoon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // Image (top)
            AsyncImage(url: URL(string: cartoon.imageUrl)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                default:
                    Color.gray.opacity(0.2)
                }
            }
            .frame(height: 200)
            .clipped()
            
            // Text Area
            VStack(alignment: .leading, spacing: 8) {
                
                // Title and icon
                HStack(alignment: .center) {
                    
                    Text(cartoon.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                            cartoon.isFavorite.toggle()
                        }
                    } label: {
                        Image(cartoon.isFavorite ? "heart.fill@24" : "heart.unfill@24")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                }
                
                // Description
                Text(cartoon.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding()
            .background(Color(.systemBackground))
        }
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.12), radius: 6, x: 0, y: 4)
    }
}
