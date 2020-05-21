import Foundation

// A genric closure, that prints 'Any' tye of object
    var printf : (Any) -> Void = { arg in
        let myStr = """
        |>==================================================
        | \(arg)
        |>==================================================
        """
        print(myStr)
    }
