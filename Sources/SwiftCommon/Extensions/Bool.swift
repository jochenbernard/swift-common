extension Bool: @retroactive Comparable {
    public static func < (lhs: Bool, rhs: Bool) -> Bool {
        !lhs && rhs
    }
}
