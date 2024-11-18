//
//  ProductDetailView.swift
//  FakeStore
//
//  Created by Martin Bucko on 18/11/2024.
//

import SwiftUI

struct ProductDetailView: View {
    @State private var product: Product? = Product(
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
    let productId: Int
    
    var body: some View {
        ZStack {
            if let product {
                ScrollView {
                    ProductImageView(url: URL(string: product.image))
                        .frame(width: 200, height: 200)
                    
                    VStack(alignment: .leading, spacing: 32) {
                        Text(product.title)
                            .font(.headline)
                            .foregroundStyle(.blue)
                        
                        Text(product.description)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("ID produktu:")
                                    .font(.footnote)
                                
                                Text("\(product.id)")
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Cena:")
                                    .font(.footnote)
                                
                                Text(product.price, format: .currency(code: "EUR"))
                                    .font(.headline)
                            }
                        }
                    }
                    .padding(32)
                }
            } else {
                ProgressView()
                    .controlSize(.large)
            }
        }
        .navigationTitle(product?.category ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ProductDetailView(productId: 1)
    }
    .preferredColorScheme(.light)
}

#Preview {
    NavigationView {
        ProductDetailView(productId: 1)
    }
    .preferredColorScheme(.dark)
}
