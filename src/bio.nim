import streams, endians


proc toByteSeq*(str: string): seq[byte] {.inline.} =
  ## Converts a string to the corresponding byte sequence.
  @(str.toOpenArrayByte(0, str.high))

proc fromByteSeq*(arr: openArray[byte]): string {.inline.} =
  ## Converts a byte sequence to the corresponding string.
  let length = arr.len

  if length > 0:
    result = newString(length)
    copyMem(result.cstring, arr[0].unsafeAddr, length)

template castNumber(result, number: typed, endians: Endianness): untyped =
  ## Casts ``number`` to array[byte] in ``endians`` order.
  if endians == cpuEndian:
    cast[type(result)](number)
  else:
    let 
      reversedArray = cast[type(result)](number)
      size = reversedArray.high

    for idx in 0 .. size:
      result[idx] = reversedArray[size - idx]
    result

proc serialize*(number: uint64 | uint64, endians: Endianness): array[8, byte] {.inline.} =
  ## Serializes uint64|int64 to byte array in ``endians`` order.
  result = castNumber(result, number, endians)

proc serialize*(number: uint32 | uint32, endians: Endianness): array[4, byte] {.inline.} =
  ## Serializes uint32|int32 to byte array.in ``endians`` order.
  result = castNumber(result, number, endians)

proc serialize*(number: uint16 | uint16, endians: Endianness): array[2, byte] {.inline.} =
  ## Serializes uint16|int16 to byte array.in ``endians`` order.
  
  # result[0] = byte(number shr 8'u16)
  # result[1] = byte(number)
  result = castNumber(result, number, endians)

template offset*(p: pointer, n: int): pointer = 
  ## Gets pointer ``p`` of offset ``n``.
  cast[pointer](cast[ByteAddress](p) + n)

template canReadNBytes*(stream: StringStream, length: Natural): bool =
  ## Decides whether can read ``length`` bytes.
  stream.data.len >= stream.getPosition() + length

template canReadHowManyBytes*(stream: StringStream): int =
  ## Can read how many bytes.
  stream.data.len - stream.getPosition()

proc readBEInt64*(strm: Stream): int64 {.inline.} =
  ## Reads int64 in big endians order.
  var input = strm.readInt64
  bigEndian64(result.addr, input.addr)

proc readBEInt32*(strm: Stream): int32 {.inline.} =
  ## Reads int32 in big endians order.
  var input = strm.readInt32
  bigEndian32(result.addr, input.addr)

proc readBEInt16*(strm: Stream): int16 {.inline.} =
  ## Reads int16 in big endians order.
  var input = strm.readInt16
  bigEndian16(result.addr, input.addr)

proc readBEInt8*(strm: Stream): int8 {.inline.} =
  ## Reads int8 in big endians order.
  result = strm.readInt8

proc readLEInt64*(strm: Stream): int64 {.inline.} =
  ## Reads int64 in small endians order.
  var input = strm.readInt64
  littleEndian64(result.addr, input.addr)

proc readLEInt32*(strm: Stream): int32 {.inline.} =
  ## Reads int32 in small endians order.
  var input = strm.readInt32
  littleEndian32(result.addr, input.addr)

proc readLEInt16*(strm: Stream): int16 {.inline.} =
  ## Reads int16 in small endians order.
  var input = strm.readInt16
  littleEndian16(result.addr, input.addr)

proc readLEInt8*(strm: Stream): int8 {.inline.} =
  ## Reads int8 in small endians order.
  result = strm.readInt8

proc readBEUint64*(strm: Stream): uint64 {.inline.} =
  ## Reads uint64 in big endians order.
  var input = strm.readUint64
  bigEndian64(result.addr, input.addr)

proc readBEUint32*(strm: Stream): uint32 {.inline.} =
  ## Reads uint32 in big endians order.
  var input = strm.readUint32
  bigEndian32(result.addr, input.addr)

proc readBEUint16*(strm: Stream): uint16 {.inline.} =
  ## Reads uint16 in big endians order.
  var input = strm.readUint16
  bigEndian16(result.addr, input.addr)

proc readBEUint8*(strm: Stream): uint8 {.inline.} =
  ## Reads uint8 in big endians order.
  result = strm.readUint8

proc readLEUint64*(strm: Stream): uint64 {.inline.} =
  ## Reads uint64 in small endians order.
  var input = strm.readUint64
  littleEndian64(result.addr, input.addr)

proc readLEUint32*(strm: Stream): uint32 {.inline.} =
  ## Reads uint32 in small endians order.
  var input = strm.readUint32
  littleEndian32(result.addr, input.addr)

proc readLEUint16*(strm: Stream): uint16 {.inline.} =
  ## Reads uint16 in small endians order.
  var input = strm.readUint16
  littleEndian16(result.addr, input.addr)

proc readLEUint8*(strm: Stream): uint8 {.inline.} =
  ## Reads uint8 in small endians order.
  result = strm.readUint8
