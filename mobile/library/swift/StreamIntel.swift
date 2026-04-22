@_implementationOnly import EnvoyEngine
import Foundation

/// Exposes internal HTTP stream metrics, context, and other details.
@objcMembers
public class StreamIntel: NSObject, Error {
  // An internal identifier for the stream. -1 if not set.
  public let streamId: Int64
  // An internal identifier for the connection carrying the stream. -1 if not set.
  public let connectionId: Int64
  // The number of internal attempts to carry out a request/operation. 0 if not set.
  public let attemptCount: UInt64
  // The number of bytes consumed by the non terminal callbacks, from the response.
  public let consumedBytesFromResponse: UInt64
  // The latest SCONE maximum bitrate received from the network, in kbps.
  public let sconeMaxKbps: Int64
  // Time since epoch when SCONE value was received, -1 if no new value
  public let sconeTimestampMs: Int64

  public init(streamId: Int64, connectionId: Int64, attemptCount: UInt64,
              consumedBytesFromResponse: UInt64, sconeMaxKbps: Int64,
              sconeTimestampMs: Int64) {
    self.streamId = streamId
    self.connectionId = connectionId
    self.attemptCount = attemptCount
    self.consumedBytesFromResponse = consumedBytesFromResponse
    self.sconeMaxKbps = sconeMaxKbps
    self.sconeTimestampMs = sconeTimestampMs
  }
}

extension StreamIntel {
  internal convenience init(_ cStruct: EnvoyStreamIntel) {
    self.init(streamId: cStruct.stream_id,
              connectionId: cStruct.connection_id,
              attemptCount: cStruct.attempt_count,
              consumedBytesFromResponse: cStruct.consumed_bytes_from_response,
              sconeMaxKbps: cStruct.scone_max_kbps,
              sconeTimestampMs: cStruct.scone_timestamp_ms)
  }
}
