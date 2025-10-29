/** Sources: 
 * https://developer.apple.com/documentation/technotes/tn3151-choosing-the-right-networking-api
 * 
*/
import Glibc
// Basic HTTP response object taking a body and argument
struct Response {
    // body is optional, meaning is can be nil or a valid string
    // Docs: https://developer.apple.com/documentation/swift/optional
    var body: String?
    var header: String
}

// Unsingned 16 bit integer
func run(port: UInt16 = 8080) throws {
    // Signed 32 bit integer
    // Docs: https://man7.org/linux/man-pages/man2/socket.2.html
    let s = socket(AF_INET, Int32(SOCK_STREAM.rawValue), 0)

    var addr = sockaddr_in()
    // Mapping address values 
    addr.sin_family = sa_family_t(AF_INET)

    // Numbers are converted to big Endian as that is network byte order
    // https://developer.apple.com/documentation/swift/uint32/bigendian
    // Help From: https://forums.swift.org/t/basic-http-client-from-scratch/67663
    addr.sin_port = in_port_t(port.bigEndian)

    addr.sin_addr = in_addr(s_addr: INADDR_ANY.bigEndian)
    // Takes a pointer to a value and returns a value if any
    // Docs: https://developer.apple.com/documentation/swift/withunsafepointer(to:_:)-35wrn
    withUnsafePointer(to: &addr) {
        // Takes a typed buffer and returns a value if any
        // Docs: https://developer.apple.com/documentation/swift/unsafebufferpointer/withmemoryrebound(to:_:)
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            // https://man7.org/linux/man-pages/man2/bind.2.html
            // mapping it to a memory layout with size and then casting that to the socklen_t type
            _ = bind(
                // s = socket
                s,
                // $0 -> passed down from withUnsafePointer and then withMemoryRebound but is the pointer to the address to bind to
                $0,
                // socklen_t(MemoryLayout<sockaddr_in>.size) = size of the address constructed from taking the socket address in
                socklen_t(
                    // Built in data structure, takes in another pointer data structure and assigns
                    // 1. size
                    // 2. stride
                    // 3. alignment
                    // Source: https://developer.apple.com/documentation/swift/memorylayout
                    MemoryLayout<sockaddr_in>.size
                )
            )            
        }
    }
    // https://man7.org/linux/man-pages/man2/listen.2.html
    _ = listen(s, SOMAXCONN)

    print("Server live at http://localhost:\(port)")
    // Listen's forever
    while true {
        // https://man7.org/linux/man-pages/man2/accept.2.html
        let c = accept(s, nil, nil);

        if c < 0 { continue }

        let body = "{ \"message\": \"Hello from swift http!\", \"response\": \"success\" }"
        let header = "HTTP/1.1 200 ok\r\nContent-Type: application/json\r\nContent-Length: \(body.utf8.count)\r\nConnection: close\r\n\r\n"
        // Crafting Response struct
        let res = Response(
            body: body,
            header: header
        )

        // withCString converts Swift string to null-terminated string 
        // https://developer.apple.com/documentation/swift/string/withcstring(_:)
        _ = res.header.withCString {
            // Write simple writes out to a file descriptor
            // https://man7.org/linux/man-pages/man2/write.2.html
            write(c, $0, strlen($0)) 
        }
        _ = (res.body ?? "{\"error\": \"Blank Body\"}").withCString {
            write(c, $0, strlen($0))
        }

        // Closes write from body and header conversion
        // https://man7.org/linux/man-pages/man2/close.2.html
        _ = close(c)

    }
}

do {
    try run()
} catch {
    print("Error: \(error)")
}