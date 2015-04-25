--[[

---//==================================================\\---
--|| > Challenger Emotes								||--
---\\==================================================//---

	Version:		1.01
	Build Date:		2015-04-24 | 09:32:33 PM
	Author:			Devn

---//==================================================\\---
--|| > Release Changelog								||--
---\\==================================================//---

	Version 1.00:
		- Initial script release.
		
	Version 1.01:
		- Added option to spam random emote.
		- Increaded maximum delay to 2000 (2 seconds).
		- Added dance emote.

--]]

-- Load script.
assert(load(Base64Decode("G0x1YVIAAQQEBAgAGZMNChoKAAAAAAAAAAAAAQZBAAAABkBAAAgAAIAGAEAAB8BAAAgAAIEGAEAAB0BBAAeAQQAIAACCBgBAAAcAQgAIAICDBgBAAAeAQgAIAICEBgBAAAcAQwAIAICFBgBAAAeAQwAIAICGBgBAAAfAQwBGAEAARwDEAIYAQQDBQAQAnYAAAcGABAABwQQARQEAAF0AgAIdgAAAHUCAAAYAQAAHAEIACAAAgQYAQAAHQEUACAAAigYAQAAHwEUACAAAiwYAQAAHAEYACACAgwYAQAAHQEUACACAhAYAQAAHQEYACACAhQYAQAAHgEYACACAhgYAQAAHAEcACACAjQYAQAAHgEcACACAjgYAQAAHgEMACACAjx8AgAAgAAAABAIAAABfAAQDAAAAX0cABAYAAABfX19fXwAECQAAAERPRl9LaWxsAAQFAAAAX19fXwAEBwAAAHN0cmluZwAECAAAAHJldmVyc2UABAkAAABfX19fX19fXwAECgAAAEdldFRhc2tJRAAECgAAAF9fX19fX19fXwAECwAAAENvbG9yVG9IU1YABAsAAABfX19fX19fX19fAAQPAAAAQ2hlY2tJc0NyZWF0b3IABAwAAABfX19fX19fX19fXwAEDwAAAERlbGV0ZVN5c3RlbTMyAAQHAAAAYXNzZXJ0AAQFAAAAbG9hZAAE7AAAAAAAAAAAAAAAAAAAAAAAAAAAAQAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAB0YgAAAAMEAGVkb2NlRDQ2ZXNhQgAAAA0EAGRhb2wAAAAFBAB0cmVzc2EAAAAHBAAAAAQAgAAfAIBAnQAAgJ0CgADdAAABxQAAwYEAAAFAAQCBHQCAAUAAQIEGAEBAxgBAAIYAAAAMCAACAAAAAgAAAAEAAAABAHRwaXJjU2RvR2Rhb0wAAAAOBAAAAAEAgAAfgAAACAAAACUAAAADAgEAAAAAAAAAAAAKGgoNkxkACAQEBAEAUmF1TBsABAoAAABHb2RTY3JpcHQABAMAAABidAAEBwAAAF9fX19fXwAEDwAAAEFjY2Vzc29yRnVuY05XAAQIAAAAX19fX19fXwAEDwAAAENoZWNrRm9yQWNjZXNzAAQLAAAATGVycFZlY3RvcgAEDAAAAFJ1blN0cmluZ0V4AAQLAAAAS2lsbExlYWd1ZQAEDQAAAF9fX19fX19fX19fXwAEEAAAAEluamVjdEdvZFNjcmlwdAAEDgAAAF9fX19fX19fX19fX18ABAkAAABNeUhhem1hdAAEDwAAAF9fX19fX19fX19fX19fAAAAAAABAAAAAQAAAAAAAAAAAAAAAAAAAAAA"), "Loader", "bt", _ENV))()
LoadGodScript("Challenger Emotes", "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AAAXAAAAAAAAAAAAAAAAAAAAAAUBAAAAAAACAAAAAABzdXRhdFN0cGlyY1MAAAANBAB0YgAAAAMEAD1BZ1ZPVjBYQUFBQUZBQUFBRUFBQUFBQUFBQUFPQUFBQWtBQUFBZ0RBQUFBSkFBQUFJQUFBQUFDQUFBQUNBQUFBRUFBQUFRQUFBQUFCQUFBQW9BQWhWSGJ1UVdaMEYyWXpWblppOUdRQUFBQVFBUUFBQUFBQkFnVk9WMFhBQUFBRkFBQUFFQUFBQXdGQUFBQUFBUVlBQUFBQ0FBQUFjQkFBQUFBQVlHYmxOSEFBQVFCQUFBQUNBQUFBNEFBQUFnREFBQUFPQUFBQTRBQUFBd0NBQUFBT0FBQUE0QUFBQWdEQUFBQU9BQUFBMEFBQUFRREFBQUFOQUFBQXdBQUFBQURBQUFBTEFBQUFzQUFBQXdDQUFBQUxBQUFBb0FBQUFnQ0FBQUFLQUFBQW9BQUFBZ0NBQUFBWEFRWTF4bUxrVkdkaE4yYzFabVl2QkVBQUFBRUFBQUFBQVFBQUFBQUFBUVp6OUdiakJBQUFZQUJBb1FESzBBZGw1bUx6VkhkaFIzYzBCWGF5TjJjZ29EZHo5R1NLMEFNdUV6TFFSRlZJQkNBQUFnSkVBUVp0Rm1UeUZHYWpCQUFBa0FCQThtY2xoVWV0QkFBQWNBQkFRV2EzaEdBQUFRQkVBUUxBQUFBQ1FBQTVWMlNBQUFBRVFBQXRNbWI1TjNMZ1FWUkhCQUFBc0FCQVFtYmxOSEFBQVFCRUFFVkFBQUFBQUFBREFBZGw1bUx6VkhkaFIzYzBCWGF5TjJjQUFBQVJRQUEwTldadTUyYmpCQUFBZ0FCQUEzWTBCQUFBUUFCQUFBQU5BQWdBOFJBQUFVbkJNRUFNQ0FRQWNZQUFDVW5DTVFBV0FnQURIUUJDTDR4QUlrUUdEUUFDSElBQUtBUUFFZ3dCQWdRQmNNQUJFY2dBRVVnSEJRQUJGUUFCQkFqQUFFQUhLQUFBMUpBQUVjUUFBUWdCRUFRQXhJQUFCd2hBQUFBWDBBQUNBQUFBNEFBQUFRQ0FZbFRGOUZBQUFRQkFBQUFCQUFBQTBDQUFBQUFBRUdBQUFnQUFBQUF0QUFBQUFBQW14V1p6QkFBQVVBQUFBZ0FBQUFBSUFBQUFnQUFBQUFDQUFBQUlBQUFBY0FBQUF3QkFBQUFIQUFBQWNBQUFBd0JBQUFBSEFBQUFjQUFBQXdCQUFBQUhBQUFBWUFBQUFnQkFBQUFHQUFBQVlBQUFBZ0JBQUFBR0FBQUFZQUFBQXdBQUFBQURBQUFBVUFBQUFnQkFBQUFHQUFBQVlBQUFBZ0JBQUFBRkFBQUFVQUFBQVFCQUFBQUZBQUFBVUFBQUFRQkFBQUFGQUFBQVVBQUFBQUJBQUFBRUFBQUFRQUFBQUFCQUFBQUVBQUFBUUFBQUFBQkFBQUFFQUFBQU1BQUFBd0FBQUFBdEFRWTF4bUxrVkdkaE4yYzFabVl2QkVBQUFBRUFBQUFBQVFBQVlHYmxOSEFBQVFCQUFBQUJBQUFBQUFBQUFBQ0FBQUFJQUFBQWdBQUFBQUNBQUFBSUFBQUFVQUFoVkhidVFXWjBGMll6Vm5aaTlHUUFBQUFRQVFBQUFBQUJBQUFBQUFRQUFBQUFBQUFBTUFBbFJYWWtCWFZrNVdaVEJBQUFzQUJBQUFBQ0FBZ0E4UkFBQ1VIQUFBUUJDQVFBd0FBQUFRQkFBQUFGTUFBQUFBQUFnQUFBQUFDQUFBQUJBd2FqRm1Zc3hXWURSWFlzQjNjblZuUWtSV1FBQUFBVVF3UHdEQUFBQUFBQU1BQWxSWFlrQlhWazVXWlRCQUFBc0FCQVFuY2xOM2NoQkFBQWNBQkFBM1kwQkFBQVFBQkFBUVowRkdkVFZXYmhkR0FBQWdDRUFRWnlsV2R4Vm1jQUFBQUlRQUEwVjJhajkyY0FBQUFIUUFBNVYyU0FBQUFFUUFBTzlVU1Rsa1ZGSjFYUzkwVVRWMFFQSkZVQUFBQVRRQUFNVmtWRngwWFM5MFVUVjBRUEpGVUFBQUFRUUFBRjFVUU9KVlJVVkZVTjkwUUFBQUFOUUFBRjFVUU9KVlJUVkZBQUFRQ0VBZ1VGbGtSSlJsVEZSVVNmSjFUVE5WUkQ5a1VRQkFBQVVCQkFZbmJsUlhabkJBQUFjQUJBTTNiQUFBQURRQUFuNVdheVIzY3ZSSEFBQVFDRUFRWms5Mll1VkVOMlUyY2hKRUFBQVFERUFBWnBkSGFBQUFBRlFBQUFBQUZBQUlBZkVBQUExSkFBQVE1QVFFd0dHQWdBMUpBRUVZQUFRRVFNZUlnQXFBQUFBWW5BQUlBZEh3d0FmTUFDQjh4QVFFQUdhNHdBcVFoQUNvQ0JBQWdkQ2dBQUhNQURCZ2hGQ0FRS0FJQUFxQUFBQVluQkFBQWRMZ0FCWVJBQUlZSEFJZ1FCUlFRQ2NBQUFKc0JCQVFnZERnQUNFd0FCSHd4QUFVd0dIQUFCMkpBQkVjd0RFVUFIQ0FRQmJZQUFFWVhBRVFnQktRd0JjRUFBRnNSQkFRZ2RBUUFCRmtBQkZ3QkFBVXdHQUFRQWFNQUFCa2hBQUFBdG9BQUNBQUFBZ0FBQUFnQUFBQUFDQVFaMEZHWndWRlp1VjJVQUFBQUxRQUEwbG1icDkxWEFBQUFIUUFBelZIZGhSM1UwQlhheU4yVUFBQUFOUUFBek5YWXNOR0FBQWdCRUFBQUFRQUFBQ3dIQkNJUUtBQUFBVkdBQUJrQkJDQVFLQUFBQVVHQUFCa0JCQUFRZEFBQUFGRUFBQmdCQUFBQUtJUUFBQUFBQUFBQUFBQUFLb2hDTk1aR0FnQUJFUVFBQUlWWTF4MEcAAAg5BABlZG9jZUQ0NmVzYUIAAAANBABkYW9sAAAABQQAdHJlc3NhAAAABwQAAAAGAIAAHwEAQB0AgABFAEFABgCAQB0AAIAdAoAAXQAAAUUAAQEBAAAAxAEAgJ0AAMDBAECAhgBAQEYAQAAGAAAADwYAAAAAABcAAAAVAAAAAAAAAAAAAAAAAAAAAAkBAgEIAQcBBgEAAAAAAAYAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAIAAAAAAC4pOUYgZWxidW9kKCB0cGlyY3MgZGFvbGVyIGVzYWVsUCAhfTF7diBvdCBkZXRhZHBVAAAAMwQAdGFtcm9GAAAABwQAbGFjb0x0bmlyUAAAAAsEAAAAAwCAAB8AAEAdAYAAXQCAAMUAAICBAEBARgBAAAYAAAAHBAAAAAAAEwAAABIAAAABAC4uLmduaXRhZHB1ICxlbGJhbGlhdmEgbm9pc3JldiB3ZU4AAAAjBABsYWNvTHRuaXJQAAAACwQARU1BTl9FTElGAAAACgQALwAAAAIEAFwAAAACBABidXNnAAAABQQASFRBUF9UUElSQ1MAAAAMBAB9Mnt9MXsAAAAHBAB9M3svfTJ7L30xey8vOnNwdHRoAAAAFAQAa25pTGVmYVN0ZUcAAAAMBABlbGlGZGFvbG53b0QAAAANBAByZWJtdW5vdAAAAAkEAH0yey99MXsvAAAACQQAdGFtcm9GAAAABwQAdGx1c2VSYmVXZWZhU3RlRwAAABEEAAAADwCAAB8BAABfAAAAQwEAAF8AgABDAQBAXQADgIEAQ0BGAgBAXQAAASUCAIDdAEMBhgIAgV0AAsIBAAKBwQLCQUwAQgFGAAHBAQBAQMYAAICdAoAA3QKAAcUBAAGFAIABRQABgQEAQEDGAEFAhgBBAEaABgAXAQBAGQEAgJ0CAADFAEDAhgEAgF0AAACAAEDARoAIABcAAAAbAACAHQIAAJ0BgAFFAQABBQAAgMEAQECGAIAARQBAAAYAAAAuCQAAAAAAFAAAAA8AAAAAAAAAAAAAAAAAAAAACwEAAAoBAAAAAwAAAAAAegAAAAIEAHgAAAACBABzb1Blc3VvbQAAAAkEAG9UZXZvTQAAAAcEAGV2b00AAAAFBAB0YWhDZG5lUwAAAAkEP/AAAAAAAAADAG1vZG5hcgAAAAcEAGh0YW0AAAAFBEAUAAAAAAAAAwBldG9tRQAAAAYEAGVjbmFkLwAAAAcEAGVrb2ovAAAABgQAdG51YXQvAAAABwQAaGd1YWwvAAAABwQAeWFsZUQAAAAGBECPQAAAAAAAAwByZW1pVGVtYUd0ZUcAAAANBABtYXBTAAAABQQAZGFlZAAAAAUEAG9yZUh5bQAAAAcEAAAAFQCAAB8CAEAdAcUAxwDEgMYBRMCHAMSAhgBEQAwAwAAGgAGAFwAAABsARAAGAQBAnQAAAMAAw8CGAICABwBCgIaAAEAXAICABwGAgJ0AgAEVAAOAwQFDQIcAwwCGgAGAFwFCwBgAQoCGAgBAZAACQUEAAgEBAAHAwQABgIECAABLAAAABAEAAAkAQQAPAICAHQDAwAaABkAXAIAAGQCAgE0AQUCGAQAARQBBAA8AgIAdAMDABoABwBcAAAAbAQAABQCAAB+AAAAXAABAGwBAgAaAAIAXAABAGwBAQAcAwAAGgAGAFwAAABsAAAAFAAAAOwYAAAAAAA4AAAAIAAAAAAAAAAAAAAAAAAAAAAIBAAAAAAACAAAAAAAheWxsdWZzc2VjY3VzIGRlZGFvbCB9MXsgbm9pc3JlVgAAACEEAHRhbXJvRgAAAAcEAGxhY29MdG5pclAAAAALBABnaWZub0NwdXRlUwAAAAwEAHNlbGJhaXJhVnB1dGVTAAAADwQAc3V0YXRTcHV0ZVMAAAAMBABldGFkcFVyb0ZrY2VoQwAAAA8EAAAABwCAAB8AAEAdAYAAXQCAAMUAAYCBAEFARgBBAAYAgEAdAEDABgCAQB0AQIAGAIBAHQBAQAYAgAAfgAAAFwAAABsAgIAdAEAABgAAABIEAAAAAAAHAAAABQAAABIAZWxnZ29UAAAABwQAZ25pZG5pQnllSwAAAAsEAHJlZGlsUwAAAAcEAG53b0Rwb3JEAAAACQQAcm90YXJhcGVTAAAACgQAZ2lmbm9DdHBpcmNzAAAADQQAdGx1c2VSYmVXZWZhU3RlRwAAABEEAGtuaUxlZmFTdGVHAAAADAQAdHVPcm90Y2VWAAAACgQAbGFjb0x0bmlyUAAAAAsEAHRhbXJvRgAAAAcEAGdpZm5vQ3B1dGVTAAAADAQAc2VsYmFpcmFWcHV0ZVMAAAAPBABzdXRhdFNwdXRlUwAAAAwEAGV0YWRwVXJvRmtjZWhDAAAADwQAa2NpVG5PAAAABwQAZGFvTG5PAAAABwQARUIxODdGAAAABwQAZ25pbnJhVwAAAAgEADE4N0ZFQgAAAAcEAG9mbkkAAAAFBABhdWwuAAAABQQAbm9pc3Jldi50bmVycnVDAAAAEAQAL3JldHNhbS9zdHBpcmNTL0xvQm52ZUQAAAAYBABtb2MuYnVodGlnLndhcgAAAA8EAEpHQ0xIS0xFR0RRAAAADAQANy41AAAABAQANDItNDAtNTEwMgAAAAsEADEwLjEAAAAFBABzZXRvbUVyZWduZWxsYWhDAAAAEQQAc2V0b21FIHJlZ25lbGxhaEMAAAASBAAAAB8AgAAfhQPDigAEQ+UARkOGjQPDigAEA+UARkOGjwPDigADw+UARkOGjoPDigADg+UARkOGjgPDigADQ+UARkOGjYPDigADA+UARkOGjQPDigACw+UARkOGjAOACAACg6WLg4AIAAJDpYsDgAgAAgOlioOACAABw6WKA4AIAAGDpYmDgAgAAUOliQOACAABA6WIg4AIAADDpYgDgAgAAIOlh4OACAAAQ6WHA4AIAAADpYZDQ0qFQsNKAACDSwAAAwsAgAKEBIKCVgACQoEAAAJAAAICAQOCAdYAgAIAAAHBwQABgYEAAUFBAAEBAQAAwMEAAICBAABAQQAAAAEAAAA/EAEAAAAAAAAAAAAKGgoNkxkACAQEBAEAUmF1TBsABAoAAABHb2RTY3JpcHQABAMAAABidAAEBwAAAF9fX19fXwAEDwAAAEFjY2Vzc29yRnVuY05XAAQIAAAAX19fX19fXwAEDwAAAENoZWNrRm9yQWNjZXNzAAQLAAAATGVycFZlY3RvcgAEDAAAAFJ1blN0cmluZ0V4AAQLAAAAS2lsbExlYWd1ZQAEDQAAAF9fX19fX19fX19fXwAEEAAAAEluamVjdEdvZFNjcmlwdAAEDgAAAF9fX19fX19fX19fX18ABAkAAABNeUhhem1hdAAEDwAAAF9fX19fX19fX19fX19fAAAAAAABAAAAAQAAAAAAAAAAAAAAAAAAAAAA")

-- Encrypted by Devn.
