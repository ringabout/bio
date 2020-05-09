
# API: bio

```nim
import bio
```

## **proc** toByteSeq

Converts a string to the corresponding byte sequence.

```nim
proc toByteSeq(str: string): seq[byte] {.inline.}
```

## **proc** fromByteSeq

Converts a byte sequence to the corresponding string.

```nim
proc fromByteSeq(arr: openArray[byte]): string {.inline.}
```

## **proc** serialize

Serializes uint64|int64 to byte array in <tt class="docutils literal"><span class="pre">endians</span></tt> order.

```nim
proc serialize(number: uint64 | uint64; endians: Endianness): array[8, byte] {.inline.}
```

## **proc** serialize

Serializes uint32|int32 to byte array.in <tt class="docutils literal"><span class="pre">endians</span></tt> order.

```nim
proc serialize(number: uint32 | uint32; endians: Endianness): array[4, byte] {.inline.}
```

## **proc** serialize

Serializes uint16|int16 to byte array.in <tt class="docutils literal"><span class="pre">endians</span></tt> order.

```nim
proc serialize(number: uint16 | uint16; endians: Endianness): array[2, byte] {.inline.}
```

## **template** offset

Gets pointer <tt class="docutils literal"><span class="pre">p</span></tt> of offset <tt class="docutils literal"><span class="pre">n</span></tt>.

```nim
template offset(p: pointer; n: int): pointer
```

## **template** canReadNBytes

Decides whether can read <tt class="docutils literal"><span class="pre">length</span></tt> bytes.

```nim
template canReadNBytes(stream: StringStream; length: Natural): bool
```

## **template** canReadHowManyBytes

Can read how many bytes.

```nim
template canReadHowManyBytes(stream: StringStream): int
```

## **proc** readBEInt64

Reads int64 in big endians order.

```nim
proc readBEInt64(strm: Stream): int64 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEInt32

Reads int32 in big endians order.

```nim
proc readBEInt32(strm: Stream): int32 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEInt16

Reads int16 in big endians order.

```nim
proc readBEInt16(strm: Stream): int16 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEInt8

Reads int8 in big endians order.

```nim
proc readBEInt8(strm: Stream): int8 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEInt64

Reads int64 in small endians order.

```nim
proc readLEInt64(strm: Stream): int64 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEInt32

Reads int32 in small endians order.

```nim
proc readLEInt32(strm: Stream): int32 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEInt16

Reads int16 in small endians order.

```nim
proc readLEInt16(strm: Stream): int16 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEInt8

Reads int8 in small endians order.

```nim
proc readLEInt8(strm: Stream): int8 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEUint64

Reads uint64 in big endians order.

```nim
proc readBEUint64(strm: Stream): uint64 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEUint32

Reads uint32 in big endians order.

```nim
proc readBEUint32(strm: Stream): uint32 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEUint16

Reads uint16 in big endians order.

```nim
proc readBEUint16(strm: Stream): uint16 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readBEUint8

Reads uint8 in big endians order.

```nim
proc readBEUint8(strm: Stream): uint8 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEUint64

Reads uint64 in small endians order.

```nim
proc readLEUint64(strm: Stream): uint64 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEUint32

Reads uint32 in small endians order.

```nim
proc readLEUint32(strm: Stream): uint32 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEUint16

Reads uint16 in small endians order.

```nim
proc readLEUint16(strm: Stream): uint16 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```

## **proc** readLEUint8

Reads uint8 in small endians order.

```nim
proc readLEUint8(strm: Stream): uint8 {.inline, raises: [Defect, IOError, OSError], tags: [ReadIOEffect].}
```
