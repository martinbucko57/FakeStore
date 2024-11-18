//
//  ProductsView.swift
//  FakeStore
//
//  Created by Martin Bucko on 18/11/2024.
//

import SwiftUI

struct ProductsView: View {
    @State private var products: [Product] = [
        Product(
            id: 1,
            title: "Test",
            price: 10.2,
            description: "Description",
            category: "jewelery",
            image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
            rating: Rating(
                rate: 10,
                count: 2
            )
        )
    ]
    
    var body: some View {
        List(products) { product in
            ProductRow(product: product)
        }
        .listStyle(.inset)
        .navigationTitle("Produkty")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Filter") {
                    //TODO: Filter
                }
            }
        }
    }
}

struct ProductRow: View {
    let product: Product
    
    var body: some View {
        HStack {
            ProductImageView(url: URL(string: product.image))
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Text(product.category)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

struct ProductImageView: View {
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "photo")
                    .font(.title)
                    .foregroundStyle(.secondary)
            default:
                ProgressView()
            }
        }
    }
}

#Preview {
    NavigationView {
        ProductsView()
    }
    .preferredColorScheme(.light)
}

#Preview {
    NavigationView {
        ProductsView()
    }
    .preferredColorScheme(.dark)
}
