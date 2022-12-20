//
//  DuckExam.swift
//  duckie
//
//  Created by DongHo Lee on 2022/11/16.
//

struct DuckExam {
    let id: Int
    let title: String
    let description: String
    let buttonTitle: String
    let hasMusic: Bool
    let thumbnail: String = ""
    let user: User = User()
    let solvedCount: Int = 20
}
