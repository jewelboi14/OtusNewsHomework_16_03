//
//  Collection+Extension.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 25.03.2022.
//

import Foundation

import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func isLastItem<Item: Identifiable>(_ item: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        let distance = self.distance(from: itemIndex, to: endIndex)

        return distance == 1
    }
}
