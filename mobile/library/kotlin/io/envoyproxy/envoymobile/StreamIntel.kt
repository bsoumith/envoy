package io.envoyproxy.envoymobile

import io.envoyproxy.envoymobile.engine.types.EnvoyStreamIntel

/**
 * Exposes internal HTTP stream metrics, context, and other details.
 *
 * @param streamId An internal identifier for the stream. -1 if not set.
 * @param connectionId An internal identifier for the connection carrying the stream. -1 if not set.
 * @param attemptCount The number of internal attempts to carry out a request/operation. 0 if not
 *   set.
 * @param consumedBytesFromResponse The number of bytes consumed by the non terminal callbacks, from
 *   the response.
 * @param sconeMaxKbps The latest SCONE maximum bitrate received from the network, in kbps.
 * @param sconeTimestampMs Time since epoch when SCONE value was received, -1 if no new value
 */
open class StreamIntel(
  val streamId: Long,
  val connectionId: Long,
  val attemptCount: Long,
  val consumedBytesFromResponse: Long = -1,
  val sconeMaxKbps: Long = -1,
  val sconeTimestampMs: Long = -1
) {
  constructor(
    base: EnvoyStreamIntel
  ) : this(
    base.streamId,
    base.connectionId,
    base.attemptCount,
    base.consumedBytesFromResponse,
    base.sconeMaxKbps,
    base.sconeTimestampMs
  )
}
