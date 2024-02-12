//
//  AddBookView.swift
//  bookWormCore
//
//  Created by Alfredo Sandoval-Luis on 1/31/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 0
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Children", "Mystery", "Poetry", "Romance", "Thriller", "Philosophy"]


    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id:\.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a reivew")
                }
                
                Section {
                    Button("Save") {
                        // add the book
                        let newBook = Book(context: moc)
                        newBook.id = UUID()
                        newBook.title = title
                        newBook.author = author
                        newBook.rating = Int16(rating)
                        newBook.genre = genre
                        newBook.review = review
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
