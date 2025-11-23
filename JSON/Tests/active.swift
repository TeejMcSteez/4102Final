import Foundation
import FoundationNetworking  // Needed for Linux
import Testing


@Test
func testServerIsAvailable() async throws {
    guard let url = URL(string: "http://localhost:8080") else {
        #expect(false, "Failed to build URL")
        return
    }

    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse else {
        #expect(false, "Response was not HTTP")
        return
    }

    #expect((200...299).contains(httpResponse.statusCode),
            "Server returned status code \(httpResponse.statusCode)")

    #expect(!data.isEmpty, "Response body is empty")

}
