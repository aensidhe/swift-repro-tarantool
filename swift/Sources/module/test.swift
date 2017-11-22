import MessagePack
import TarantoolModule

// Pros: Performance, module reload
// Cons: Addition of a new function is annoying, harder to read: a lot of noise
// To add a new funcion you have to:
//   1. copy/paste this signature (or remember)
//   3. add of fix @_silgen_name("")
//   2. modify lua bootstrap script
@_silgen_name("hello_swift_native")
public func helloSwift(context: Box.Context) -> Box.Result {
    return Box.convertCall(context) { output in
        try output.append(["hello"])
        try output.append(["from"])
        try output.append(["swift"])
    }
}
