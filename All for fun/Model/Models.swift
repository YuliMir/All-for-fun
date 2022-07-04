//
//  ChuckNorris.swift
//  All for fun
//
//  Created by Юлия Миронова on 23.06.2022.
//
struct ChuckNorris: Decodable {
    let icon_url: String?
    let url: String?
    let value: String?
}

struct Cats: Decodable {
    let url: String?
}
