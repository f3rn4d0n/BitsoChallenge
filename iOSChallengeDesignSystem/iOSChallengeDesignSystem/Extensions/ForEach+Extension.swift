//
//  ForEach+Extension.swift
//  iOSChallengeDesignSystem
//
//  Created by Luis Fernando Bustos Ramírez on 27/02/24.
//

import SwiftUI

public extension ForEach {
    
    init<T: RandomAccessCollection>(
        data: T,
        content: @escaping (T.Index, T.Element) -> Content
    ) where T.Element: Identifiable, T.Element: Hashable, Content: View, Data == [(T.Index, T.Element)], ID == T.Element  {
        self.init(Array(zip(data.indices, data)), id: \.1) { index, element in
            content(index, element)
        }
    }
}
