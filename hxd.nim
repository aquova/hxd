import parseopt, strutils

proc usage() =
    echo """
hxd
hex to decimal utility
Usage:
    hxd HEX
    hxd -d DEC
    """

proc main() =
    var opts = initOptParser()
    var decimal = false
    var num = ""

    for kind, key, val in opts.getopt():
        case kind:
            of cmdShortOption:
                if key == "d":
                    decimal = true
            of cmdArgument:
                num = key
            else: discard

    if num == "":
        usage()
        quit(0)

    if decimal:
        let hex = parseInt(num).toHex()
        echo("0x" & hex.strip(leading = true, trailing = false, chars = {'0'}))
    else:
        echo(parseHexInt(num))

when isMainModule:
    main()
