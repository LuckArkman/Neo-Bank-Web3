; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [403 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [1209 x i64] [
	i64 u0x001e58127c546039, ; 0: lib_System.Globalization.dll.so => 41
	i64 u0x0024d0f62dee05bd, ; 1: Xamarin.KotlinX.Coroutines.Core.dll => 358
	i64 u0x0071cf2d27b7d61e, ; 2: lib_Xamarin.AndroidX.SwipeRefreshLayout.dll.so => 334
	i64 u0x00b3aadb3a4c4038, ; 3: lib_Refit.dll.so => 250
	i64 u0x01109b0e4d99e61f, ; 4: System.ComponentModel.Annotations.dll => 13
	i64 u0x014b43fdeb5d21ad, ; 5: Microsoft.AspNetCore.Authorization.Policy.dll => 178
	i64 u0x018d2cc5e2de2b95, ; 6: lib_Microsoft.AspNetCore.SignalR.Common.dll.so => 194
	i64 u0x01af0bd6467d518e, ; 7: lib_ZXing.Net.MAUI.dll.so => 363
	i64 u0x02123411c4e01926, ; 8: lib_Xamarin.AndroidX.Navigation.Runtime.dll.so => 324
	i64 u0x022e81ea9c46e03a, ; 9: lib_CommunityToolkit.Maui.Core.dll.so => 172
	i64 u0x022f31be406de945, ; 10: Microsoft.Extensions.Options.ConfigurationExtensions => 218
	i64 u0x0284512fad379f7e, ; 11: System.Runtime.Handles => 103
	i64 u0x02abedc11addc1ed, ; 12: lib_Mono.Android.Runtime.dll.so => 166
	i64 u0x02f55bf70672f5c8, ; 13: lib_System.IO.FileSystem.DriveInfo.dll.so => 47
	i64 u0x032267b2a94db371, ; 14: lib_Xamarin.AndroidX.AppCompat.dll.so => 273
	i64 u0x03621c804933a890, ; 15: System.Buffers => 7
	i64 u0x0363ac97a4cb84e6, ; 16: SQLitePCLRaw.provider.e_sqlite3.dll => 256
	i64 u0x0399610510a38a38, ; 17: lib_System.Private.DataContractSerialization.dll.so => 84
	i64 u0x03b83394b41533a3, ; 18: lib_System.Net.WebSockets.WebSocketProtocol.dll.so => 260
	i64 u0x043032f1d071fae0, ; 19: ru/Microsoft.Maui.Controls.resources => 389
	i64 u0x044440a55165631e, ; 20: lib-cs-Microsoft.Maui.Controls.resources.dll.so => 367
	i64 u0x046eb1581a80c6b0, ; 21: vi/Microsoft.Maui.Controls.resources => 395
	i64 u0x047408741db2431a, ; 22: Xamarin.AndroidX.DynamicAnimation => 300
	i64 u0x0517ef04e06e9f76, ; 23: System.Net.Primitives => 69
	i64 u0x0543f2adcf7474d0, ; 24: Nethereum.Contracts.dll => 231
	i64 u0x0565d18c6da3de38, ; 25: Xamarin.AndroidX.RecyclerView => 327
	i64 u0x0581db89237110e9, ; 26: lib_System.Collections.dll.so => 12
	i64 u0x05989cb940b225a9, ; 27: Microsoft.Maui.dll => 222
	i64 u0x05a1c25e78e22d87, ; 28: lib_System.Runtime.CompilerServices.Unsafe.dll.so => 100
	i64 u0x05c27cf2b380bbf2, ; 29: lib_Microsoft.AspNetCore.Hosting.Server.Abstractions.dll.so => 181
	i64 u0x05df7affc8138818, ; 30: lib_Microsoft.Bcl.TimeProvider.dll.so => 200
	i64 u0x06076b5d2b581f08, ; 31: zh-HK/Microsoft.Maui.Controls.resources => 396
	i64 u0x06388ffe9f6c161a, ; 32: System.Xml.Linq.dll => 151
	i64 u0x06600c4c124cb358, ; 33: System.Configuration.dll => 19
	i64 u0x067f95c5ddab55b3, ; 34: lib_Xamarin.AndroidX.Fragment.Ktx.dll.so => 305
	i64 u0x0680a433c781bb3d, ; 35: Xamarin.AndroidX.Collection.Jvm => 286
	i64 u0x069fff96ec92a91d, ; 36: System.Xml.XPath.dll => 156
	i64 u0x06b9c6ef24c2e082, ; 37: lib_Nethereum.Web3.dll.so => 245
	i64 u0x070b0847e18dab68, ; 38: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 302
	i64 u0x0739448d84d3b016, ; 39: lib_Xamarin.AndroidX.VectorDrawable.dll.so => 338
	i64 u0x07469f2eecce9e85, ; 40: mscorlib.dll => 162
	i64 u0x07c57877c7ba78ad, ; 41: ru/Microsoft.Maui.Controls.resources.dll => 389
	i64 u0x07dcdc7460a0c5e4, ; 42: System.Collections.NonGeneric => 10
	i64 u0x08122e52765333c8, ; 43: lib_Microsoft.Extensions.Logging.Debug.dll.so => 215
	i64 u0x088610fc2509f69e, ; 44: lib_Xamarin.AndroidX.VectorDrawable.Animated.dll.so => 339
	i64 u0x08a7c865576bbde7, ; 45: System.Reflection.Primitives => 94
	i64 u0x08c9d051a4a817e5, ; 46: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 298
	i64 u0x08f3c9788ee2153c, ; 47: Xamarin.AndroidX.DrawerLayout => 299
	i64 u0x09138715c92dba90, ; 48: lib_System.ComponentModel.Annotations.dll.so => 13
	i64 u0x0919c28b89381a0b, ; 49: lib_Microsoft.Extensions.Options.dll.so => 217
	i64 u0x092266563089ae3e, ; 50: lib_System.Collections.NonGeneric.dll.so => 10
	i64 u0x098b88b592a366b9, ; 51: Bank.MobileUI.dll => 0
	i64 u0x09d144a7e214d457, ; 52: System.Security.Cryptography => 125
	i64 u0x09e2b9f743db21a8, ; 53: lib_System.Reflection.Metadata.dll.so => 93
	i64 u0x0a35a8bc10c3311e, ; 54: Bank.Infrastructure.dll => 401
	i64 u0x0a832f2c97e71637, ; 55: Xamarin.AndroidX.Camera.Video => 282
	i64 u0x0abb3e2b271edc45, ; 56: System.Threading.Channels.dll => 263
	i64 u0x0ae84ecd7ca62352, ; 57: lib_Nethereum.ABI.dll.so => 228
	i64 u0x0b06b1feab070143, ; 58: System.Formats.Tar => 38
	i64 u0x0b3b632c3bbee20c, ; 59: sk/Microsoft.Maui.Controls.resources => 390
	i64 u0x0b6aff547b84fbe9, ; 60: Xamarin.KotlinX.Serialization.Core.Jvm => 361
	i64 u0x0b74b547d9e0e85d, ; 61: Microsoft.AspNetCore.SignalR.Protocols.Json.dll => 196
	i64 u0x0be2e1f8ce4064ed, ; 62: Xamarin.AndroidX.ViewPager => 341
	i64 u0x0c3ca6cc978e2aae, ; 63: pt-BR/Microsoft.Maui.Controls.resources => 386
	i64 u0x0c3d7adcdb333bf0, ; 64: Xamarin.AndroidX.Camera.Lifecycle => 281
	i64 u0x0c59ad9fbbd43abe, ; 65: Mono.Android => 167
	i64 u0x0c65741e86371ee3, ; 66: lib_Xamarin.Android.Glide.GifDecoder.dll.so => 267
	i64 u0x0c74af560004e816, ; 67: Microsoft.Win32.Registry.dll => 5
	i64 u0x0c7790f60165fc06, ; 68: lib_Microsoft.Maui.Essentials.dll.so => 223
	i64 u0x0c83c82812e96127, ; 69: lib_System.Net.Mail.dll.so => 65
	i64 u0x0c9ed9990eaf50ca, ; 70: Nethereum.Signer.dll => 241
	i64 u0x0cce4bce83380b7f, ; 71: Xamarin.AndroidX.Security.SecurityCrypto => 331
	i64 u0x0d13cd7cce4284e4, ; 72: System.Security.SecureString => 128
	i64 u0x0d3b5ab8b2766190, ; 73: lib_Microsoft.Bcl.AsyncInterfaces.dll.so => 199
	i64 u0x0d63f4f73521c24f, ; 74: lib_Xamarin.AndroidX.SavedState.SavedState.Ktx.dll.so => 330
	i64 u0x0e04e702012f8463, ; 75: Xamarin.AndroidX.Emoji2 => 301
	i64 u0x0e14e73a54dda68e, ; 76: lib_System.Net.NameResolution.dll.so => 66
	i64 u0x0ea8769ffa29657e, ; 77: Nethereum.BlockchainProcessing.dll => 230
	i64 u0x0f37dd7a62ae99af, ; 78: lib_Xamarin.AndroidX.Collection.Ktx.dll.so => 287
	i64 u0x0f46a4b444b4843a, ; 79: lib_Nethereum.Accounts.dll.so => 229
	i64 u0x0f5e7abaa7cf470a, ; 80: System.Net.HttpListener => 64
	i64 u0x0f948418e9ebd6de, ; 81: Microsoft.AspNetCore.Hosting.Abstractions.dll => 180
	i64 u0x1001f97bbe242e64, ; 82: System.IO.UnmanagedMemoryStream => 55
	i64 u0x102861e4055f511a, ; 83: Microsoft.Bcl.AsyncInterfaces.dll => 199
	i64 u0x102a31b45304b1da, ; 84: Xamarin.AndroidX.CustomView => 297
	i64 u0x1065c4cb554c3d75, ; 85: System.IO.IsolatedStorage.dll => 51
	i64 u0x10f6cfcbcf801616, ; 86: System.IO.Compression.Brotli => 42
	i64 u0x1140109eb2e77ceb, ; 87: Microsoft.Extensions.ObjectPool.dll => 216
	i64 u0x114443cdcf2091f1, ; 88: System.Security.Cryptography.Primitives => 123
	i64 u0x118d570f508803d1, ; 89: Xamarin.AndroidX.Camera.Camera2.dll => 279
	i64 u0x11a603952763e1d4, ; 90: System.Net.Mail => 65
	i64 u0x11a70d0e1009fb11, ; 91: System.Net.WebSockets.dll => 79
	i64 u0x11d2a2a57f14fcae, ; 92: Xamarin.AndroidX.Biometric => 277
	i64 u0x11f26371eee0d3c1, ; 93: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll.so => 315
	i64 u0x11f2fa4fda5a47de, ; 94: lib_ADRaffy.ENSNormalize.dll.so => 169
	i64 u0x12128b3f59302d47, ; 95: lib_System.Xml.Serialization.dll.so => 153
	i64 u0x123639456fb056da, ; 96: System.Reflection.Emit.Lightweight.dll => 90
	i64 u0x12521e9764603eaa, ; 97: lib_System.Resources.Reader.dll.so => 97
	i64 u0x125b7f94acb989db, ; 98: Xamarin.AndroidX.RecyclerView.dll => 327
	i64 u0x12d3b63863d4ab0b, ; 99: lib_System.Threading.Overlapped.dll.so => 136
	i64 u0x134eab1061c395ee, ; 100: System.Transactions => 146
	i64 u0x1352a982679dc0c9, ; 101: ADRaffy.ENSNormalize.dll => 169
	i64 u0x138567fa954faa55, ; 102: Xamarin.AndroidX.Browser => 278
	i64 u0x13a01de0cbc3f06c, ; 103: lib-fr-Microsoft.Maui.Controls.resources.dll.so => 373
	i64 u0x13beedefb0e28a45, ; 104: lib_System.Xml.XmlDocument.dll.so => 157
	i64 u0x13f1e5e209e91af4, ; 105: lib_Java.Interop.dll.so => 164
	i64 u0x13f1e880c25d96d1, ; 106: he/Microsoft.Maui.Controls.resources => 374
	i64 u0x143d8ea60a6a4011, ; 107: Microsoft.Extensions.DependencyInjection.Abstractions => 205
	i64 u0x1497051b917530bd, ; 108: lib_System.Net.WebSockets.dll.so => 79
	i64 u0x14d612a531c79c05, ; 109: Xamarin.JSpecify.dll => 353
	i64 u0x14e68447938213b7, ; 110: Xamarin.AndroidX.Collection.Ktx.dll => 287
	i64 u0x15089560460fb845, ; 111: Microsoft.AspNetCore.SignalR.Client.Core => 193
	i64 u0x152a448bd1e745a7, ; 112: Microsoft.Win32.Primitives => 4
	i64 u0x1557de0138c445f4, ; 113: lib_Microsoft.Win32.Registry.dll.so => 5
	i64 u0x15bdc156ed462f2f, ; 114: lib_System.IO.FileSystem.dll.so => 50
	i64 u0x15e300c2c1668655, ; 115: System.Resources.Writer.dll => 99
	i64 u0x16bf2a22df043a09, ; 116: System.IO.Pipes.dll => 54
	i64 u0x16ea2b318ad2d830, ; 117: System.Security.Cryptography.Algorithms => 118
	i64 u0x16eeae54c7ebcc08, ; 118: System.Reflection.dll => 96
	i64 u0x17125c9a85b4929f, ; 119: lib_netstandard.dll.so => 163
	i64 u0x1716866f7416792e, ; 120: lib_System.Security.AccessControl.dll.so => 116
	i64 u0x174f71c46216e44a, ; 121: Xamarin.KotlinX.Coroutines.Core => 358
	i64 u0x1752c12f1e1fc00c, ; 122: System.Core => 21
	i64 u0x17b56e25558a5d36, ; 123: lib-hu-Microsoft.Maui.Controls.resources.dll.so => 377
	i64 u0x17f9358913beb16a, ; 124: System.Text.Encodings.Web => 261
	i64 u0x1809fb23f29ba44a, ; 125: lib_System.Reflection.TypeExtensions.dll.so => 95
	i64 u0x18402a709e357f3b, ; 126: lib_Xamarin.KotlinX.Serialization.Core.Jvm.dll.so => 361
	i64 u0x18a9befae51bb361, ; 127: System.Net.WebClient => 75
	i64 u0x18f0ce884e87d89a, ; 128: nb/Microsoft.Maui.Controls.resources.dll => 383
	i64 u0x18facb3695ca9224, ; 129: Refit.HttpClientFactory => 251
	i64 u0x19777fba3c41b398, ; 130: Xamarin.AndroidX.Startup.StartupRuntime.dll => 333
	i64 u0x19a4c090f14ebb66, ; 131: System.Security.Claims => 117
	i64 u0x1a040febb58bf51e, ; 132: lib_Xamarin.AndroidX.Camera.View.dll.so => 283
	i64 u0x1a63352be1054efd, ; 133: Microsoft.AspNetCore.Hosting.Server.Abstractions.dll => 181
	i64 u0x1a91866a319e9259, ; 134: lib_System.Collections.Concurrent.dll.so => 8
	i64 u0x1aac34d1917ba5d3, ; 135: lib_System.dll.so => 160
	i64 u0x1aad60783ffa3e5b, ; 136: lib-th-Microsoft.Maui.Controls.resources.dll.so => 392
	i64 u0x1aea8f1c3b282172, ; 137: lib_System.Net.Ping.dll.so => 68
	i64 u0x1b4b7a1d0d265fa2, ; 138: Xamarin.Android.Glide.DiskLruCache => 266
	i64 u0x1bbdb16cfa73e785, ; 139: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android => 316
	i64 u0x1bc766e07b2b4241, ; 140: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 328
	i64 u0x1bea5a36aa1ed8de, ; 141: Microsoft.AspNetCore.Http.Extensions => 187
	i64 u0x1c033050038635e3, ; 142: Nethereum.KeyStore => 236
	i64 u0x1c292b1598348d77, ; 143: Microsoft.Extensions.Diagnostics.dll => 206
	i64 u0x1c753b5ff15bce1b, ; 144: Mono.Android.Runtime.dll => 166
	i64 u0x1cd47467799d8250, ; 145: System.Threading.Tasks.dll => 140
	i64 u0x1d23eafdc6dc346c, ; 146: System.Globalization.Calendars.dll => 39
	i64 u0x1da4110562816681, ; 147: Xamarin.AndroidX.Security.SecurityCrypto.dll => 331
	i64 u0x1db6820994506bf5, ; 148: System.IO.FileSystem.AccessControl.dll => 46
	i64 u0x1dbb0c2c6a999acb, ; 149: System.Diagnostics.StackTrace => 29
	i64 u0x1e3d87657e9659bc, ; 150: Xamarin.AndroidX.Navigation.UI => 325
	i64 u0x1e71143913d56c10, ; 151: lib-ko-Microsoft.Maui.Controls.resources.dll.so => 381
	i64 u0x1e7c31185e2fb266, ; 152: lib_System.Threading.Tasks.Parallel.dll.so => 139
	i64 u0x1ed8fcce5e9b50a0, ; 153: Microsoft.Extensions.Options.dll => 217
	i64 u0x1f055d15d807e1b2, ; 154: System.Xml.XmlSerializer => 158
	i64 u0x1f1ed22c1085f044, ; 155: lib_System.Diagnostics.FileVersionInfo.dll.so => 27
	i64 u0x1f61df9c5b94d2c1, ; 156: lib_System.Numerics.dll.so => 82
	i64 u0x1f750bb5421397de, ; 157: lib_Xamarin.AndroidX.Tracing.Tracing.dll.so => 335
	i64 u0x20237ea48006d7a8, ; 158: lib_System.Net.WebClient.dll.so => 75
	i64 u0x209375905fcc1bad, ; 159: lib_System.IO.Compression.Brotli.dll.so => 42
	i64 u0x20b24e9c0d806c8b, ; 160: Nethereum.Util.Rest.dll => 244
	i64 u0x20f423eef97aa248, ; 161: lib_Nethereum.RPC.dll.so => 240
	i64 u0x20fab3cf2dfbc8df, ; 162: lib_System.Diagnostics.Process.dll.so => 28
	i64 u0x2110167c128cba15, ; 163: System.Globalization => 41
	i64 u0x21419508838f7547, ; 164: System.Runtime.CompilerServices.VisualC => 101
	i64 u0x2174319c0d835bc9, ; 165: System.Runtime => 115
	i64 u0x2198e5bc8b7153fa, ; 166: Xamarin.AndroidX.Annotation.Experimental.dll => 271
	i64 u0x219ea1b751a4dee4, ; 167: lib_System.IO.Compression.ZipFile.dll.so => 44
	i64 u0x21cc7e445dcd5469, ; 168: System.Reflection.Emit.ILGeneration => 89
	i64 u0x220fd4f2e7c48170, ; 169: th/Microsoft.Maui.Controls.resources => 392
	i64 u0x224538d85ed15a82, ; 170: System.IO.Pipes => 54
	i64 u0x22908438c6bed1af, ; 171: lib_System.Threading.Timer.dll.so => 143
	i64 u0x237be844f1f812c7, ; 172: System.Threading.Thread.dll => 141
	i64 u0x23852b3bdc9f7096, ; 173: System.Resources.ResourceManager => 98
	i64 u0x23986dd7e5d4fc01, ; 174: System.IO.FileSystem.Primitives.dll => 48
	i64 u0x2407aef2bbe8fadf, ; 175: System.Console => 20
	i64 u0x240abe014b27e7d3, ; 176: Xamarin.AndroidX.Core.dll => 293
	i64 u0x241a6f2bf4797e4d, ; 177: lib_Nethereum.BlockchainProcessing.dll.so => 230
	i64 u0x247619fe4413f8bf, ; 178: System.Runtime.Serialization.Primitives.dll => 112
	i64 u0x24de8d301281575e, ; 179: Xamarin.Android.Glide => 264
	i64 u0x252073cc3caa62c2, ; 180: fr/Microsoft.Maui.Controls.resources.dll => 373
	i64 u0x256b8d41255f01b1, ; 181: Xamarin.Google.Crypto.Tink.Android => 348
	i64 u0x25a0a7eff76ea08e, ; 182: SQLitePCLRaw.batteries_v2.dll => 253
	i64 u0x25e1850d10cdc8f7, ; 183: lib_Xamarin.AndroidX.Camera.Camera2.dll.so => 279
	i64 u0x25f650451790152a, ; 184: Nethereum.JsonRpc.Client.dll => 234
	i64 u0x2662c629b96b0b30, ; 185: lib_Xamarin.Kotlin.StdLib.dll.so => 354
	i64 u0x268c1439f13bcc29, ; 186: lib_Microsoft.Extensions.Primitives.dll.so => 219
	i64 u0x268f1dca6d06d437, ; 187: Xamarin.AndroidX.Camera.Core => 280
	i64 u0x26991fe407ba4a9e, ; 188: Nethereum.Util.dll => 243
	i64 u0x26a670e154a9c54b, ; 189: System.Reflection.Extensions.dll => 92
	i64 u0x26d077d9678fe34f, ; 190: System.IO.dll => 56
	i64 u0x26f6f9f5b45a2e5b, ; 191: Nethereum.ABI.dll => 228
	i64 u0x273f3515de5faf0d, ; 192: id/Microsoft.Maui.Controls.resources.dll => 378
	i64 u0x2742545f9094896d, ; 193: hr/Microsoft.Maui.Controls.resources => 376
	i64 u0x2759af78ab94d39b, ; 194: System.Net.WebSockets => 79
	i64 u0x27b2b16f3e9de038, ; 195: Xamarin.Google.Crypto.Tink.Android.dll => 348
	i64 u0x27b410442fad6cf1, ; 196: Java.Interop.dll => 164
	i64 u0x27b97e0d52c3034a, ; 197: System.Diagnostics.Debug => 26
	i64 u0x2801845a2c71fbfb, ; 198: System.Net.Primitives.dll => 69
	i64 u0x286835e259162700, ; 199: lib_Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll.so => 326
	i64 u0x288f0dc6b8b36b5f, ; 200: Refit.dll => 250
	i64 u0x28b311fffbc0f8df, ; 201: Microsoft.AspNetCore.WebUtilities => 198
	i64 u0x28e491b4ae3aff19, ; 202: Microsoft.AspNet.SignalR.Client.dll => 175
	i64 u0x28e52865585a1ebe, ; 203: Microsoft.Extensions.Diagnostics.Abstractions.dll => 207
	i64 u0x2949f3617a02c6b2, ; 204: Xamarin.AndroidX.ExifInterface => 303
	i64 u0x29a8b25c0b761dea, ; 205: Microsoft.Bcl.TimeProvider => 200
	i64 u0x2a128783efe70ba0, ; 206: uk/Microsoft.Maui.Controls.resources.dll => 394
	i64 u0x2a32a01be82d61e4, ; 207: lib_Microsoft.AspNet.SignalR.Client.dll.so => 175
	i64 u0x2a3b095612184159, ; 208: lib_System.Net.NetworkInformation.dll.so => 67
	i64 u0x2a6507a5ffabdf28, ; 209: System.Diagnostics.TraceSource.dll => 32
	i64 u0x2ad156c8e1354139, ; 210: fi/Microsoft.Maui.Controls.resources => 372
	i64 u0x2ad5d6b13b7a3e04, ; 211: System.ComponentModel.DataAnnotations.dll => 14
	i64 u0x2aebc46ec22b92e5, ; 212: Nethereum.HdWallet.dll => 232
	i64 u0x2af298f63581d886, ; 213: System.Text.RegularExpressions.dll => 135
	i64 u0x2afc1c4f898552ee, ; 214: lib_System.Formats.Asn1.dll.so => 37
	i64 u0x2b148910ed40fbf9, ; 215: zh-Hant/Microsoft.Maui.Controls.resources.dll => 398
	i64 u0x2b6989d78cba9a15, ; 216: Xamarin.AndroidX.Concurrent.Futures.dll => 288
	i64 u0x2c40db0dbedda89b, ; 217: lib_Microsoft.AspNetCore.WebUtilities.dll.so => 198
	i64 u0x2c6640652e21c312, ; 218: Microsoft.AspNetCore.Http.Connections.dll => 184
	i64 u0x2c8bd14bb93a7d82, ; 219: lib-pl-Microsoft.Maui.Controls.resources.dll.so => 385
	i64 u0x2cbd9262ca785540, ; 220: lib_System.Text.Encoding.CodePages.dll.so => 132
	i64 u0x2cc9e1fed6257257, ; 221: lib_System.Reflection.Emit.Lightweight.dll.so => 90
	i64 u0x2cd723e9fe623c7c, ; 222: lib_System.Private.Xml.Linq.dll.so => 86
	i64 u0x2d169d318a968379, ; 223: System.Threading.dll => 144
	i64 u0x2d47774b7d993f59, ; 224: sv/Microsoft.Maui.Controls.resources.dll => 391
	i64 u0x2d5ffcae1ad0aaca, ; 225: System.Data.dll => 24
	i64 u0x2db915caf23548d2, ; 226: System.Text.Json.dll => 262
	i64 u0x2dcaa0bb15a4117a, ; 227: System.IO.UnmanagedMemoryStream.dll => 55
	i64 u0x2e5a40c319acb800, ; 228: System.IO.FileSystem => 50
	i64 u0x2e6f1f226821322a, ; 229: el/Microsoft.Maui.Controls.resources.dll => 370
	i64 u0x2e7c9658c7fb7927, ; 230: Microsoft.Extensions.Features.dll => 208
	i64 u0x2ea8e1e9049dd1f6, ; 231: lib_NBitcoin.Secp256k1.dll.so => 227
	i64 u0x2f02f94df3200fe5, ; 232: System.Diagnostics.Process => 28
	i64 u0x2f2e98e1c89b1aff, ; 233: System.Xml.ReaderWriter => 152
	i64 u0x2f5911d9ba814e4e, ; 234: System.Diagnostics.Tracing => 33
	i64 u0x2f84070a459bc31f, ; 235: lib_System.Xml.dll.so => 159
	i64 u0x2ff49de6a71764a1, ; 236: lib_Microsoft.Extensions.Http.dll.so => 211
	i64 u0x309ee9eeec09a71e, ; 237: lib_Xamarin.AndroidX.Fragment.dll.so => 304
	i64 u0x30c6dda129408828, ; 238: System.IO.IsolatedStorage => 51
	i64 u0x31169aa21393c7ef, ; 239: Nethereum.JsonRpc.RpcClient.dll => 235
	i64 u0x31195fef5d8fb552, ; 240: _Microsoft.Android.Resource.Designer.dll => 402
	i64 u0x312c8ed623cbfc8d, ; 241: Xamarin.AndroidX.Window.dll => 343
	i64 u0x31496b779ed0663d, ; 242: lib_System.Reflection.DispatchProxy.dll.so => 88
	i64 u0x3156b7decbc904e6, ; 243: Xamarin.AndroidX.Tracing.Tracing.Ktx.dll => 336
	i64 u0x315f08d19390dc36, ; 244: Xamarin.Google.ErrorProne.TypeAnnotations => 350
	i64 u0x31700b3b2a9fc1c2, ; 245: Microsoft.AspNetCore.SignalR.Core.dll => 195
	i64 u0x31a82e81871cfd35, ; 246: lib_Nethereum.JsonRpc.RpcClient.dll.so => 235
	i64 u0x32243413e774362a, ; 247: Xamarin.AndroidX.CardView.dll => 284
	i64 u0x3235427f8d12dae1, ; 248: lib_System.Drawing.Primitives.dll.so => 34
	i64 u0x329753a17a517811, ; 249: fr/Microsoft.Maui.Controls.resources => 373
	i64 u0x32aa989ff07a84ff, ; 250: lib_System.Xml.ReaderWriter.dll.so => 152
	i64 u0x33829542f112d59b, ; 251: System.Collections.Immutable => 9
	i64 u0x33a31443733849fe, ; 252: lib-es-Microsoft.Maui.Controls.resources.dll.so => 371
	i64 u0x341abc357fbb4ebf, ; 253: lib_System.Net.Sockets.dll.so => 74
	i64 u0x343e640b18927294, ; 254: Nethereum.Merkle.Patricia => 237
	i64 u0x3496c1e2dcaf5ecc, ; 255: lib_System.IO.Pipes.AccessControl.dll.so => 53
	i64 u0x34dfd74fe2afcf37, ; 256: Microsoft.Maui => 222
	i64 u0x34e292762d9615df, ; 257: cs/Microsoft.Maui.Controls.resources.dll => 367
	i64 u0x3508234247f48404, ; 258: Microsoft.Maui.Controls => 220
	i64 u0x3528b07f24103892, ; 259: Nethereum.JsonRpc.Client => 234
	i64 u0x353590da528c9d22, ; 260: System.ComponentModel.Annotations => 13
	i64 u0x3549870798b4cd30, ; 261: lib_Xamarin.AndroidX.ViewPager2.dll.so => 342
	i64 u0x355282fc1c909694, ; 262: Microsoft.Extensions.Configuration => 201
	i64 u0x3552fc5d578f0fbf, ; 263: Xamarin.AndroidX.Arch.Core.Common => 275
	i64 u0x355c649948d55d97, ; 264: lib_System.Runtime.Intrinsics.dll.so => 107
	i64 u0x35e6534d56bf7f73, ; 265: ADRaffy.ENSNormalize => 169
	i64 u0x35ea9d1c6834bc8c, ; 266: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 319
	i64 u0x3628ab68db23a01a, ; 267: lib_System.Diagnostics.Tools.dll.so => 31
	i64 u0x3673b042508f5b6b, ; 268: lib_System.Runtime.Extensions.dll.so => 102
	i64 u0x36740f1a8ecdc6c4, ; 269: System.Numerics => 82
	i64 u0x368fb4099f614993, ; 270: lib_Nethereum.Signer.dll.so => 241
	i64 u0x36b14365094131ba, ; 271: Nethereum.Util.Rest => 244
	i64 u0x36b2b50fdf589ae2, ; 272: System.Reflection.Emit.Lightweight => 90
	i64 u0x36cada77dc79928b, ; 273: System.IO.MemoryMappedFiles => 52
	i64 u0x374ef46b06791af6, ; 274: System.Reflection.Primitives.dll => 94
	i64 u0x376bf93e521a5417, ; 275: lib_Xamarin.Jetbrains.Annotations.dll.so => 352
	i64 u0x37bc29f3183003b6, ; 276: lib_System.IO.dll.so => 56
	i64 u0x380134e03b1e160a, ; 277: System.Collections.Immutable.dll => 9
	i64 u0x38049b5c59b39324, ; 278: System.Runtime.CompilerServices.Unsafe => 100
	i64 u0x385c17636bb6fe6e, ; 279: Xamarin.AndroidX.CustomView.dll => 297
	i64 u0x38869c811d74050e, ; 280: System.Net.NameResolution.dll => 66
	i64 u0x38f71e7a64343c93, ; 281: lib_Microsoft.AspNetCore.Authorization.Policy.dll.so => 178
	i64 u0x393c226616977fdb, ; 282: lib_Xamarin.AndroidX.ViewPager.dll.so => 341
	i64 u0x395e37c3334cf82a, ; 283: lib-ca-Microsoft.Maui.Controls.resources.dll.so => 366
	i64 u0x39721dd6cab9d79e, ; 284: Polly.dll => 248
	i64 u0x39aa39fda111d9d3, ; 285: Newtonsoft.Json => 246
	i64 u0x39c3107c28752af1, ; 286: lib_Microsoft.Extensions.FileProviders.Abstractions.dll.so => 209
	i64 u0x3a7548259c176386, ; 287: lib_Nethereum.Util.Rest.dll.so => 244
	i64 u0x3ab5859054645f72, ; 288: System.Security.Cryptography.Primitives.dll => 123
	i64 u0x3ad75090c3fac0e9, ; 289: lib_Xamarin.AndroidX.ResourceInspection.Annotation.dll.so => 328
	i64 u0x3ae44ac43a1fbdbb, ; 290: System.Runtime.Serialization => 114
	i64 u0x3b860f9932505633, ; 291: lib_System.Text.Encoding.Extensions.dll.so => 133
	i64 u0x3bd83d5a444f30c7, ; 292: lib_Nethereum.Signer.EIP712.dll.so => 242
	i64 u0x3c3aafb6b3a00bf6, ; 293: lib_System.Security.Cryptography.X509Certificates.dll.so => 124
	i64 u0x3c4049146b59aa90, ; 294: System.Runtime.InteropServices.JavaScript => 104
	i64 u0x3c7c495f58ac5ee9, ; 295: Xamarin.Kotlin.StdLib => 354
	i64 u0x3c7e5ed3d5db71bb, ; 296: System.Security => 129
	i64 u0x3ca05b43ec08224f, ; 297: Microsoft.AspNetCore.Http.Extensions.dll => 187
	i64 u0x3cd9d281d402eb9b, ; 298: Xamarin.AndroidX.Browser.dll => 278
	i64 u0x3ced6a4f3010aa96, ; 299: ZXing.Net.MAUI.Controls => 364
	i64 u0x3d1c50cc001a991e, ; 300: Xamarin.Google.Guava.ListenableFuture.dll => 351
	i64 u0x3d2b1913edfc08d7, ; 301: lib_System.Threading.ThreadPool.dll.so => 142
	i64 u0x3d46f0b995082740, ; 302: System.Xml.Linq => 151
	i64 u0x3d8a8f400514a790, ; 303: Xamarin.AndroidX.Fragment.Ktx.dll => 305
	i64 u0x3d9c2a242b040a50, ; 304: lib_Xamarin.AndroidX.Core.dll.so => 293
	i64 u0x3da7781d6333a8fe, ; 305: SQLitePCLRaw.batteries_v2 => 253
	i64 u0x3dbb6b9f5ab90fa7, ; 306: lib_Xamarin.AndroidX.DynamicAnimation.dll.so => 300
	i64 u0x3e5441657549b213, ; 307: Xamarin.AndroidX.ResourceInspection.Annotation => 328
	i64 u0x3e57d4d195c53c2e, ; 308: System.Reflection.TypeExtensions => 95
	i64 u0x3e580c35ecfc1247, ; 309: lib_Microsoft.AspNetCore.Http.dll.so => 182
	i64 u0x3e616ab4ed1f3f15, ; 310: lib_System.Data.dll.so => 24
	i64 u0x3e707b1acaaea668, ; 311: lib_Polly.Extensions.Http.dll.so => 249
	i64 u0x3f1d226e6e06db7e, ; 312: Xamarin.AndroidX.SlidingPaneLayout.dll => 332
	i64 u0x3f510adf788828dd, ; 313: System.Threading.Tasks.Extensions => 138
	i64 u0x3f6f5914291cdcf7, ; 314: Microsoft.Extensions.Hosting.Abstractions => 210
	i64 u0x407a10bb4bf95829, ; 315: lib_Xamarin.AndroidX.Navigation.Common.dll.so => 322
	i64 u0x40c98b6bd77346d4, ; 316: Microsoft.VisualBasic.dll => 3
	i64 u0x41833cf766d27d96, ; 317: mscorlib => 162
	i64 u0x41cab042be111c34, ; 318: lib_Xamarin.AndroidX.AppCompat.AppCompatResources.dll.so => 274
	i64 u0x423a9ecc4d905a88, ; 319: lib_System.Resources.ResourceManager.dll.so => 98
	i64 u0x423bf51ae7def810, ; 320: System.Xml.XPath => 156
	i64 u0x42462ff15ddba223, ; 321: System.Resources.Reader.dll => 97
	i64 u0x4291015ff4e5ef71, ; 322: Xamarin.AndroidX.Core.ViewTree.dll => 295
	i64 u0x42a31b86e6ccc3f0, ; 323: System.Diagnostics.Contracts => 25
	i64 u0x430e95b891249788, ; 324: lib_System.Reflection.Emit.dll.so => 91
	i64 u0x43375950ec7c1b6a, ; 325: netstandard.dll => 163
	i64 u0x434c4e1d9284cdae, ; 326: Mono.Android.dll => 167
	i64 u0x43505013578652a0, ; 327: lib_Xamarin.AndroidX.Activity.Ktx.dll.so => 269
	i64 u0x437d06c381ed575a, ; 328: lib_Microsoft.VisualBasic.dll.so => 3
	i64 u0x43950f84de7cc79a, ; 329: pl/Microsoft.Maui.Controls.resources.dll => 385
	i64 u0x43e8ca5bc927ff37, ; 330: lib_Xamarin.AndroidX.Emoji2.ViewsHelper.dll.so => 302
	i64 u0x448bd33429269b19, ; 331: Microsoft.CSharp => 1
	i64 u0x4499fa3c8e494654, ; 332: lib_System.Runtime.Serialization.Primitives.dll.so => 112
	i64 u0x4515080865a951a5, ; 333: Xamarin.Kotlin.StdLib.dll => 354
	i64 u0x4545802489b736b9, ; 334: Xamarin.AndroidX.Fragment.Ktx => 305
	i64 u0x454b4d1e66bb783c, ; 335: Xamarin.AndroidX.Lifecycle.Process => 312
	i64 u0x45c40276a42e283e, ; 336: System.Diagnostics.TraceSource => 32
	i64 u0x45d443f2a29adc37, ; 337: System.AppContext.dll => 6
	i64 u0x46a4213bc97fe5ae, ; 338: lib-ru-Microsoft.Maui.Controls.resources.dll.so => 389
	i64 u0x47358bd471172e1d, ; 339: lib_System.Xml.Linq.dll.so => 151
	i64 u0x479bee1b593751d6, ; 340: NBitcoin.Secp256k1 => 227
	i64 u0x47daf4e1afbada10, ; 341: pt/Microsoft.Maui.Controls.resources => 387
	i64 u0x480c0a47dd42dd81, ; 342: lib_System.IO.MemoryMappedFiles.dll.so => 52
	i64 u0x480ea3349c523c24, ; 343: Bank.MobileUI => 0
	i64 u0x48a6d2fa2eb5d049, ; 344: Microsoft.AspNetCore.SignalR.Protocols.Json => 196
	i64 u0x49e952f19a4e2022, ; 345: System.ObjectModel => 83
	i64 u0x49ea01c721d701b5, ; 346: lib_Microsoft.Net.Http.Headers.dll.so => 225
	i64 u0x49f9e6948a8131e4, ; 347: lib_Xamarin.AndroidX.VersionedParcelable.dll.so => 340
	i64 u0x4a5667b2462a664b, ; 348: lib_Xamarin.AndroidX.Navigation.UI.dll.so => 325
	i64 u0x4a7a18981dbd56bc, ; 349: System.IO.Compression.FileSystem.dll => 43
	i64 u0x4aa5c60350917c06, ; 350: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll.so => 311
	i64 u0x4b07a0ed0ab33ff4, ; 351: System.Runtime.Extensions.dll => 102
	i64 u0x4b576d47ac054f3c, ; 352: System.IO.FileSystem.AccessControl => 46
	i64 u0x4b7b6532ded934b7, ; 353: System.Text.Json => 262
	i64 u0x4c7755cf07ad2d5f, ; 354: System.Net.Http.Json.dll => 62
	i64 u0x4cc5f15266470798, ; 355: lib_Xamarin.AndroidX.Loader.dll.so => 321
	i64 u0x4cf6f67dc77aacd2, ; 356: System.Net.NetworkInformation.dll => 67
	i64 u0x4d3183dd245425d4, ; 357: System.Net.WebSockets.Client.dll => 78
	i64 u0x4d479f968a05e504, ; 358: System.Linq.Expressions.dll => 57
	i64 u0x4d55a010ffc4faff, ; 359: System.Private.Xml => 87
	i64 u0x4d5cbe77561c5b2e, ; 360: System.Web.dll => 149
	i64 u0x4d77512dbd86ee4c, ; 361: lib_Xamarin.AndroidX.Arch.Core.Common.dll.so => 275
	i64 u0x4d7793536e79c309, ; 362: System.ServiceProcess => 131
	i64 u0x4d95fccc1f67c7ca, ; 363: System.Runtime.Loader.dll => 108
	i64 u0x4dcf44c3c9b076a2, ; 364: it/Microsoft.Maui.Controls.resources.dll => 379
	i64 u0x4dd9247f1d2c3235, ; 365: Xamarin.AndroidX.Loader.dll => 321
	i64 u0x4de0a6be5cce1b0e, ; 366: lib_NBitcoin.dll.so => 226
	i64 u0x4e2aeee78e2c4a87, ; 367: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 326
	i64 u0x4e32f00cb0937401, ; 368: Mono.Android.Runtime => 166
	i64 u0x4e39d45ce072e04b, ; 369: Microsoft.AspNetCore.SignalR.Common.dll => 194
	i64 u0x4e5eea4668ac2b18, ; 370: System.Text.Encoding.CodePages => 132
	i64 u0x4ebd0c4b82c5eefc, ; 371: lib_System.Threading.Channels.dll.so => 263
	i64 u0x4ed9e74ff479199a, ; 372: lib_Nethereum.Model.dll.so => 238
	i64 u0x4ee8eaa9c9c1151a, ; 373: System.Globalization.Calendars => 39
	i64 u0x4f21ee6ef9eb527e, ; 374: ca/Microsoft.Maui.Controls.resources => 366
	i64 u0x4fd5f3ee53d0a4f0, ; 375: SQLitePCLRaw.lib.e_sqlite3.android => 255
	i64 u0x4fdc964ec1888e25, ; 376: lib_Microsoft.Extensions.Configuration.Binder.dll.so => 203
	i64 u0x5037f0be3c28c7a3, ; 377: lib_Microsoft.Maui.Controls.dll.so => 220
	i64 u0x506203448c473a65, ; 378: Xamarin.Google.AutoValue.Annotations => 346
	i64 u0x5085ce4db462e679, ; 379: lib_Nethereum.HdWallet.dll.so => 232
	i64 u0x50c3a29b21050d45, ; 380: System.Linq.Parallel.dll => 58
	i64 u0x5112ed116d87baf8, ; 381: CommunityToolkit.Mvvm => 173
	i64 u0x5116b21580ae6eb0, ; 382: Microsoft.Extensions.Configuration.Binder.dll => 203
	i64 u0x5131bbe80989093f, ; 383: Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll => 318
	i64 u0x516324a5050a7e3c, ; 384: System.Net.WebProxy => 77
	i64 u0x516d6f0b21a303de, ; 385: lib_System.Diagnostics.Contracts.dll.so => 25
	i64 u0x51bb8a2afe774e32, ; 386: System.Drawing => 35
	i64 u0x5216f09c5c4c95c8, ; 387: Microsoft.AspNetCore.Authentication.Abstractions => 176
	i64 u0x5247c5c32a4140f0, ; 388: System.Resources.Reader => 97
	i64 u0x526bb15e3c386364, ; 389: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 315
	i64 u0x526ce79eb8e90527, ; 390: lib_System.Net.Primitives.dll.so => 69
	i64 u0x527497f521875686, ; 391: Microsoft.AspNetCore.Http.Abstractions => 183
	i64 u0x52829f00b4467c38, ; 392: lib_System.Data.Common.dll.so => 22
	i64 u0x529ffe06f39ab8db, ; 393: Xamarin.AndroidX.Core => 293
	i64 u0x52d98a6b5ed3be30, ; 394: Nethereum.ABI => 228
	i64 u0x52ff996554dbf352, ; 395: Microsoft.Maui.Graphics => 224
	i64 u0x535f7e40e8fef8af, ; 396: lib-sk-Microsoft.Maui.Controls.resources.dll.so => 390
	i64 u0x53978aac584c666e, ; 397: lib_System.Security.Cryptography.Cng.dll.so => 119
	i64 u0x53a96d5c86c9e194, ; 398: System.Net.NetworkInformation => 67
	i64 u0x53be1038a61e8d44, ; 399: System.Runtime.InteropServices.RuntimeInformation.dll => 105
	i64 u0x53c3014b9437e684, ; 400: lib-zh-HK-Microsoft.Maui.Controls.resources.dll.so => 396
	i64 u0x5435e6f049e9bc37, ; 401: System.Security.Claims.dll => 117
	i64 u0x54795225dd1587af, ; 402: lib_System.Runtime.dll.so => 115
	i64 u0x547a34f14e5f6210, ; 403: Xamarin.AndroidX.Lifecycle.Common.dll => 307
	i64 u0x556e8b63b660ab8b, ; 404: Xamarin.AndroidX.Lifecycle.Common.Jvm.dll => 308
	i64 u0x5588627c9a108ec9, ; 405: System.Collections.Specialized => 11
	i64 u0x55a898e4f42e3fae, ; 406: Microsoft.VisualBasic.Core.dll => 2
	i64 u0x55fa0c610fe93bb1, ; 407: lib_System.Security.Cryptography.OpenSsl.dll.so => 122
	i64 u0x56038631c9fb77b3, ; 408: Microsoft.AspNetCore.SignalR.dll => 191
	i64 u0x56442b99bc64bb47, ; 409: System.Runtime.Serialization.Xml.dll => 113
	i64 u0x56a8b26e1aeae27b, ; 410: System.Threading.Tasks.Dataflow => 137
	i64 u0x56f76b6edb837f8b, ; 411: Polly => 248
	i64 u0x56f932d61e93c07f, ; 412: System.Globalization.Extensions => 40
	i64 u0x571c5cfbec5ae8e2, ; 413: System.Private.Uri => 85
	i64 u0x576499c9f52fea31, ; 414: Xamarin.AndroidX.Annotation => 270
	i64 u0x578cd35c91d7b347, ; 415: lib_SQLitePCLRaw.core.dll.so => 254
	i64 u0x579a06fed6eec900, ; 416: System.Private.CoreLib.dll => 168
	i64 u0x57adda3c951abb33, ; 417: Microsoft.Extensions.Hosting.Abstractions.dll => 210
	i64 u0x57c542c14049b66d, ; 418: System.Diagnostics.DiagnosticSource => 257
	i64 u0x581a8bd5cfda563e, ; 419: System.Threading.Timer => 143
	i64 u0x584ac38e21d2fde1, ; 420: Microsoft.Extensions.Configuration.Binder => 203
	i64 u0x58601b2dda4a27b9, ; 421: lib-ja-Microsoft.Maui.Controls.resources.dll.so => 380
	i64 u0x58688d9af496b168, ; 422: Microsoft.Extensions.DependencyInjection.dll => 204
	i64 u0x587f59a16b329d9c, ; 423: Microsoft.Net.Http.Headers => 225
	i64 u0x588c167a79db6bfb, ; 424: lib_Xamarin.Google.ErrorProne.Annotations.dll.so => 349
	i64 u0x5906028ae5151104, ; 425: Xamarin.AndroidX.Activity.Ktx => 269
	i64 u0x595a356d23e8da9a, ; 426: lib_Microsoft.CSharp.dll.so => 1
	i64 u0x59c270386bf40142, ; 427: Microsoft.AspNetCore.Hosting.Server.Abstractions => 181
	i64 u0x59f9e60b9475085f, ; 428: lib_Xamarin.AndroidX.Annotation.Experimental.dll.so => 271
	i64 u0x5a745f5101a75527, ; 429: lib_System.IO.Compression.FileSystem.dll.so => 43
	i64 u0x5a89a886ae30258d, ; 430: lib_Xamarin.AndroidX.CoordinatorLayout.dll.so => 292
	i64 u0x5a8f6699f4a1caa9, ; 431: lib_System.Threading.dll.so => 144
	i64 u0x5ae9cd33b15841bf, ; 432: System.ComponentModel => 18
	i64 u0x5b16f92e8b4337a6, ; 433: lib_Microsoft.AspNetCore.Http.Connections.dll.so => 184
	i64 u0x5b247cf480c75903, ; 434: Microsoft.AspNetCore.Http.Connections.Common.dll => 186
	i64 u0x5b54391bdc6fcfe6, ; 435: System.Private.DataContractSerialization => 84
	i64 u0x5b5f0e240a06a2a2, ; 436: da/Microsoft.Maui.Controls.resources.dll => 368
	i64 u0x5b8109e8e14c5e3e, ; 437: System.Globalization.Extensions.dll => 40
	i64 u0x5bddd04d72a9e350, ; 438: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 311
	i64 u0x5bdf16b09da116ab, ; 439: Xamarin.AndroidX.Collection => 285
	i64 u0x5c019d5266093159, ; 440: lib_Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll.so => 316
	i64 u0x5c294d94f201783b, ; 441: lib_Microsoft.AspNetCore.Http.Connections.Client.dll.so => 185
	i64 u0x5c30a4a35f9cc8c4, ; 442: lib_System.Reflection.Extensions.dll.so => 92
	i64 u0x5c393624b8176517, ; 443: lib_Microsoft.Extensions.Logging.dll.so => 213
	i64 u0x5c53c29f5073b0c9, ; 444: System.Diagnostics.FileVersionInfo => 27
	i64 u0x5c87463c575c7616, ; 445: lib_System.Globalization.Extensions.dll.so => 40
	i64 u0x5cbe0283eb598ee8, ; 446: Microsoft.AspNetCore.Routing => 189
	i64 u0x5d0a4a29b02d9d3c, ; 447: System.Net.WebHeaderCollection.dll => 76
	i64 u0x5d1b514fc45c92d4, ; 448: ZXing.Net.MAUI => 363
	i64 u0x5d40c9b15181641f, ; 449: lib_Xamarin.AndroidX.Emoji2.dll.so => 301
	i64 u0x5d6ca10d35e9485b, ; 450: lib_Xamarin.AndroidX.Concurrent.Futures.dll.so => 288
	i64 u0x5d7ec76c1c703055, ; 451: System.Threading.Tasks.Parallel => 139
	i64 u0x5db0cbbd1028510e, ; 452: lib_System.Runtime.InteropServices.dll.so => 106
	i64 u0x5db30905d3e5013b, ; 453: Xamarin.AndroidX.Collection.Jvm.dll => 286
	i64 u0x5e467bc8f09ad026, ; 454: System.Collections.Specialized.dll => 11
	i64 u0x5e5173b3208d97e7, ; 455: System.Runtime.Handles.dll => 103
	i64 u0x5ea92fdb19ec8c4c, ; 456: System.Text.Encodings.Web.dll => 261
	i64 u0x5eb8046dd40e9ac3, ; 457: System.ComponentModel.Primitives => 16
	i64 u0x5ec272d219c9aba4, ; 458: System.Security.Cryptography.Csp.dll => 120
	i64 u0x5eee1376d94c7f5e, ; 459: System.Net.HttpListener.dll => 64
	i64 u0x5f36ccf5c6a57e24, ; 460: System.Xml.ReaderWriter.dll => 152
	i64 u0x5f4294b9b63cb842, ; 461: System.Data.Common => 22
	i64 u0x5f7399e166075632, ; 462: lib_SQLitePCLRaw.lib.e_sqlite3.android.dll.so => 255
	i64 u0x5f9a2d823f664957, ; 463: lib-el-Microsoft.Maui.Controls.resources.dll.so => 370
	i64 u0x5fa6da9c3cd8142a, ; 464: lib_Xamarin.KotlinX.Serialization.Core.dll.so => 360
	i64 u0x5fac98e0b37a5b9d, ; 465: System.Runtime.CompilerServices.Unsafe.dll => 100
	i64 u0x5fd02402d97cdaab, ; 466: lib_Microsoft.Extensions.ObjectPool.dll.so => 216
	i64 u0x609f4b7b63d802d4, ; 467: lib_Microsoft.Extensions.DependencyInjection.dll.so => 204
	i64 u0x60cd4e33d7e60134, ; 468: Xamarin.KotlinX.Coroutines.Core.Jvm => 359
	i64 u0x60f62d786afcf130, ; 469: System.Memory => 61
	i64 u0x61bb78c89f867353, ; 470: System.IO => 56
	i64 u0x61be8d1299194243, ; 471: Microsoft.Maui.Controls.Xaml => 221
	i64 u0x61d2cba29557038f, ; 472: de/Microsoft.Maui.Controls.resources => 369
	i64 u0x61d88f399afb2f45, ; 473: lib_System.Runtime.Loader.dll.so => 108
	i64 u0x622eef6f9e59068d, ; 474: System.Private.CoreLib => 168
	i64 u0x63d5e3aa4ef9b931, ; 475: Xamarin.KotlinX.Coroutines.Android.dll => 357
	i64 u0x63f1f6883c1e23c2, ; 476: lib_System.Collections.Immutable.dll.so => 9
	i64 u0x6400f68068c1e9f1, ; 477: Xamarin.Google.Android.Material.dll => 345
	i64 u0x640e3b14dbd325c2, ; 478: System.Security.Cryptography.Algorithms.dll => 118
	i64 u0x64387a8bebb34eb1, ; 479: Nethereum.Web3.dll => 245
	i64 u0x64587004560099b9, ; 480: System.Reflection => 96
	i64 u0x64b1529a438a3c45, ; 481: lib_System.Runtime.Handles.dll.so => 103
	i64 u0x64b61dd9da8a4d57, ; 482: System.Net.ServerSentEvents.dll => 259
	i64 u0x6565fba2cd8f235b, ; 483: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 319
	i64 u0x658f524e4aba7dad, ; 484: CommunityToolkit.Maui.dll => 171
	i64 u0x659dc45417570048, ; 485: Refit => 250
	i64 u0x65ecac39144dd3cc, ; 486: Microsoft.Maui.Controls.dll => 220
	i64 u0x65ece51227bfa724, ; 487: lib_System.Runtime.Numerics.dll.so => 109
	i64 u0x661722438787b57f, ; 488: Xamarin.AndroidX.Annotation.Jvm.dll => 272
	i64 u0x6679b2337ee6b22a, ; 489: lib_System.IO.FileSystem.Primitives.dll.so => 48
	i64 u0x6692e924eade1b29, ; 490: lib_System.Console.dll.so => 20
	i64 u0x66a4e5c6a3fb0bae, ; 491: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Android.dll.so => 318
	i64 u0x66d13304ce1a3efa, ; 492: Xamarin.AndroidX.CursorAdapter => 296
	i64 u0x672a10d319608935, ; 493: lib_Microsoft.AspNetCore.Http.Connections.Common.dll.so => 186
	i64 u0x674303f65d8fad6f, ; 494: lib_System.Net.Quic.dll.so => 70
	i64 u0x6756ca4cad62e9d6, ; 495: lib_Xamarin.AndroidX.ConstraintLayout.Core.dll.so => 291
	i64 u0x67c0802770244408, ; 496: System.Windows.dll => 150
	i64 u0x68100b69286e27cd, ; 497: lib_System.Formats.Tar.dll.so => 38
	i64 u0x68558ec653afa616, ; 498: lib-da-Microsoft.Maui.Controls.resources.dll.so => 368
	i64 u0x6872ec7a2e36b1ac, ; 499: System.Drawing.Primitives.dll => 34
	i64 u0x68bb2c417aa9b61c, ; 500: Xamarin.KotlinX.AtomicFU.dll => 355
	i64 u0x68fbbbe2eb455198, ; 501: System.Formats.Asn1 => 37
	i64 u0x69063fc0ba8e6bdd, ; 502: he/Microsoft.Maui.Controls.resources.dll => 374
	i64 u0x699dffb2427a2d71, ; 503: SQLitePCLRaw.lib.e_sqlite3.android.dll => 255
	i64 u0x69a3e26c76f6eec4, ; 504: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 344
	i64 u0x6a4d7577b2317255, ; 505: System.Runtime.InteropServices.dll => 106
	i64 u0x6a54e7ef31f7a85b, ; 506: Nethereum.Signer.EIP712 => 242
	i64 u0x6ace3b74b15ee4a4, ; 507: nb/Microsoft.Maui.Controls.resources => 383
	i64 u0x6afcedb171067e2b, ; 508: System.Core.dll => 21
	i64 u0x6bef98e124147c24, ; 509: Xamarin.Jetbrains.Annotations => 352
	i64 u0x6c0fad39f1ea366b, ; 510: Plugin.Fingerprint.dll => 247
	i64 u0x6c3292dfcd2f6999, ; 511: NBitcoin.dll => 226
	i64 u0x6ccd396bfa2b5dfc, ; 512: lib_Nethereum.JsonRpc.Client.dll.so => 234
	i64 u0x6ce874bff138ce2b, ; 513: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 317
	i64 u0x6d12bfaa99c72b1f, ; 514: lib_Microsoft.Maui.Graphics.dll.so => 224
	i64 u0x6d70755158ca866e, ; 515: lib_System.ComponentModel.EventBasedAsync.dll.so => 15
	i64 u0x6d79993361e10ef2, ; 516: Microsoft.Extensions.Primitives => 219
	i64 u0x6d7eeca99577fc8b, ; 517: lib_System.Net.WebProxy.dll.so => 77
	i64 u0x6d8515b19946b6a2, ; 518: System.Net.WebProxy.dll => 77
	i64 u0x6d86d56b84c8eb71, ; 519: lib_Xamarin.AndroidX.CursorAdapter.dll.so => 296
	i64 u0x6d9bea6b3e895cf7, ; 520: Microsoft.Extensions.Primitives.dll => 219
	i64 u0x6db4e78dfe47f67c, ; 521: Bank.Domain.dll => 400
	i64 u0x6e25a02c3833319a, ; 522: lib_Xamarin.AndroidX.Navigation.Fragment.dll.so => 323
	i64 u0x6e60bc21ccfc4aaf, ; 523: Nethereum.JsonRpc.RpcClient => 235
	i64 u0x6e79c6bd8627412a, ; 524: Xamarin.AndroidX.SavedState.SavedState.Ktx => 330
	i64 u0x6e838d9a2a6f6c9e, ; 525: lib_System.ValueTuple.dll.so => 147
	i64 u0x6e9965ce1095e60a, ; 526: lib_System.Core.dll.so => 21
	i64 u0x6fd2265da78b93a4, ; 527: lib_Microsoft.Maui.dll.so => 222
	i64 u0x6fdfc7de82c33008, ; 528: cs/Microsoft.Maui.Controls.resources => 367
	i64 u0x6fea42939b3dbc23, ; 529: Microsoft.AspNetCore.WebSockets.dll => 197
	i64 u0x6ffc4967cc47ba57, ; 530: System.IO.FileSystem.Watcher.dll => 49
	i64 u0x701cd46a1c25a5fe, ; 531: System.IO.FileSystem.dll => 50
	i64 u0x70e99f48c05cb921, ; 532: tr/Microsoft.Maui.Controls.resources.dll => 393
	i64 u0x70fd3deda22442d2, ; 533: lib-nb-Microsoft.Maui.Controls.resources.dll.so => 383
	i64 u0x71485e7ffdb4b958, ; 534: System.Reflection.Extensions => 92
	i64 u0x7162a2fce67a945f, ; 535: lib_Xamarin.Android.Glide.Annotations.dll.so => 265
	i64 u0x717530326f808838, ; 536: lib_Microsoft.Extensions.Diagnostics.Abstractions.dll.so => 207
	i64 u0x71a495ea3761dde8, ; 537: lib-it-Microsoft.Maui.Controls.resources.dll.so => 379
	i64 u0x71ad672adbe48f35, ; 538: System.ComponentModel.Primitives.dll => 16
	i64 u0x720f102581a4a5c8, ; 539: Xamarin.AndroidX.Core.ViewTree => 295
	i64 u0x7242820f67bc4ad6, ; 540: Microsoft.AspNetCore.SignalR.Common => 194
	i64 u0x725f5a9e82a45c81, ; 541: System.Security.Cryptography.Encoding => 121
	i64 u0x72b1fb4109e08d7b, ; 542: lib-hr-Microsoft.Maui.Controls.resources.dll.so => 376
	i64 u0x72e0300099accce1, ; 543: System.Xml.XPath.XDocument => 155
	i64 u0x730bfb248998f67a, ; 544: System.IO.Compression.ZipFile => 44
	i64 u0x732b2d67b9e5c47b, ; 545: Xamarin.Google.ErrorProne.Annotations.dll => 349
	i64 u0x734b76fdc0dc05bb, ; 546: lib_GoogleGson.dll.so => 174
	i64 u0x73a6be34e822f9d1, ; 547: lib_System.Runtime.Serialization.dll.so => 114
	i64 u0x73e4ce94e2eb6ffc, ; 548: lib_System.Memory.dll.so => 61
	i64 u0x743a1eccf080489a, ; 549: WindowsBase.dll => 161
	i64 u0x746cf89b511b4d40, ; 550: lib_Microsoft.Extensions.Diagnostics.dll.so => 206
	i64 u0x74f1d6f5ab554b1d, ; 551: Microsoft.Extensions.Http.Polly.dll => 212
	i64 u0x755a91767330b3d4, ; 552: lib_Microsoft.Extensions.Configuration.dll.so => 201
	i64 u0x758463c93f0d589e, ; 553: lib_Microsoft.AspNetCore.Connections.Abstractions.dll.so => 179
	i64 u0x75b05302f5d75586, ; 554: Nethereum.Hex => 233
	i64 u0x75c326eb821b85c4, ; 555: lib_System.ComponentModel.DataAnnotations.dll.so => 14
	i64 u0x76012e7334db86e5, ; 556: lib_Xamarin.AndroidX.SavedState.dll.so => 329
	i64 u0x76ca07b878f44da0, ; 557: System.Runtime.Numerics.dll => 109
	i64 u0x7736c8a96e51a061, ; 558: lib_Xamarin.AndroidX.Annotation.Jvm.dll.so => 272
	i64 u0x778a805e625329ef, ; 559: System.Linq.Parallel => 58
	i64 u0x779290cc2b801eb7, ; 560: Xamarin.KotlinX.AtomicFU.Jvm => 356
	i64 u0x77bf40592cd67602, ; 561: Xamarin.Google.AutoValue.Annotations.dll => 346
	i64 u0x77d9074d8f33a303, ; 562: lib_System.Net.ServerSentEvents.dll.so => 259
	i64 u0x77f8a4acc2fdc449, ; 563: System.Security.Cryptography.Cng.dll => 119
	i64 u0x780bc73597a503a9, ; 564: lib-ms-Microsoft.Maui.Controls.resources.dll.so => 382
	i64 u0x782c5d8eb99ff201, ; 565: lib_Microsoft.VisualBasic.Core.dll.so => 2
	i64 u0x783606d1e53e7a1a, ; 566: th/Microsoft.Maui.Controls.resources.dll => 392
	i64 u0x78a1938b89c96721, ; 567: Microsoft.AspNetCore.Http.Connections.Common => 186
	i64 u0x78a45e51311409b6, ; 568: Xamarin.AndroidX.Fragment.dll => 304
	i64 u0x78a877f2596620e6, ; 569: lib_Microsoft.AspNetCore.WebSockets.dll.so => 197
	i64 u0x78ed4ab8f9d800a1, ; 570: Xamarin.AndroidX.Lifecycle.ViewModel => 317
	i64 u0x7a25bdb29108c6e7, ; 571: Microsoft.Extensions.Http => 211
	i64 u0x7a39601d6f0bb831, ; 572: lib_Xamarin.KotlinX.AtomicFU.dll.so => 355
	i64 u0x7a5207a7c82d30b4, ; 573: lib_Xamarin.JSpecify.dll.so => 353
	i64 u0x7a7e7eddf79c5d26, ; 574: lib_Xamarin.AndroidX.Lifecycle.ViewModel.dll.so => 317
	i64 u0x7a9a57d43b0845fa, ; 575: System.AppContext => 6
	i64 u0x7ad0f4f1e5d08183, ; 576: Xamarin.AndroidX.Collection.dll => 285
	i64 u0x7adb8da2ac89b647, ; 577: fi/Microsoft.Maui.Controls.resources.dll => 372
	i64 u0x7b13d9eaa944ade8, ; 578: Xamarin.AndroidX.DynamicAnimation.dll => 300
	i64 u0x7b856fa105a9ef99, ; 579: Microsoft.AspNetCore.WebSockets => 197
	i64 u0x7bef86a4335c4870, ; 580: System.ComponentModel.TypeConverter => 17
	i64 u0x7c0820144cd34d6a, ; 581: sk/Microsoft.Maui.Controls.resources.dll => 390
	i64 u0x7c2a0bd1e0f988fc, ; 582: lib-de-Microsoft.Maui.Controls.resources.dll.so => 369
	i64 u0x7c41d387501568ba, ; 583: System.Net.WebClient.dll => 75
	i64 u0x7c482cd79bd24b13, ; 584: lib_Xamarin.AndroidX.ConstraintLayout.dll.so => 290
	i64 u0x7c8cb8cf04bee12b, ; 585: lib_Xamarin.Google.AutoValue.Annotations.dll.so => 346
	i64 u0x7ca8d2077284ef33, ; 586: Nethereum.BlockchainProcessing => 230
	i64 u0x7cc637f941f716d0, ; 587: CommunityToolkit.Maui.Core => 172
	i64 u0x7cd2ec8eaf5241cd, ; 588: System.Security.dll => 129
	i64 u0x7cf9ae50dd350622, ; 589: Xamarin.Jetbrains.Annotations.dll => 352
	i64 u0x7cfbc8d16d068e41, ; 590: lib_Xamarin.AndroidX.Tracing.Tracing.Ktx.dll.so => 336
	i64 u0x7d49c593eeb09ac9, ; 591: Microsoft.AspNetCore.SignalR.Client.dll => 192
	i64 u0x7d649b75d580bb42, ; 592: ms/Microsoft.Maui.Controls.resources.dll => 382
	i64 u0x7d8ee2bdc8e3aad1, ; 593: System.Numerics.Vectors => 81
	i64 u0x7df5df8db8eaa6ac, ; 594: Microsoft.Extensions.Logging.Debug => 215
	i64 u0x7dfc3d6d9d8d7b70, ; 595: System.Collections => 12
	i64 u0x7e1f8f575a3599cb, ; 596: BouncyCastle.Cryptography.dll => 170
	i64 u0x7e2e564fa2f76c65, ; 597: lib_System.Diagnostics.Tracing.dll.so => 33
	i64 u0x7e302e110e1e1346, ; 598: lib_System.Security.Claims.dll.so => 117
	i64 u0x7e4465b3f78ad8d0, ; 599: Xamarin.KotlinX.Serialization.Core.dll => 360
	i64 u0x7e571cad5915e6c3, ; 600: lib_Xamarin.AndroidX.Lifecycle.Process.dll.so => 312
	i64 u0x7e6b1ca712437d7d, ; 601: Xamarin.AndroidX.Emoji2.ViewsHelper => 302
	i64 u0x7e946809d6008ef2, ; 602: lib_System.ObjectModel.dll.so => 83
	i64 u0x7ea0272c1b4a9635, ; 603: lib_Xamarin.Android.Glide.dll.so => 264
	i64 u0x7ecc13347c8fd849, ; 604: lib_System.ComponentModel.dll.so => 18
	i64 u0x7eff369f2e01cf95, ; 605: Microsoft.AspNetCore.Http.Features => 188
	i64 u0x7f00ddd9b9ca5a13, ; 606: Xamarin.AndroidX.ViewPager.dll => 341
	i64 u0x7f9351cd44b1273f, ; 607: Microsoft.Extensions.Configuration.Abstractions => 202
	i64 u0x7fa781c67c2cab04, ; 608: Xamarin.AndroidX.Concurrent.Futures.Ktx => 289
	i64 u0x7fbd557c99b3ce6f, ; 609: lib_Xamarin.AndroidX.Lifecycle.LiveData.Core.dll.so => 310
	i64 u0x7fd75077141d6658, ; 610: Microsoft.AspNetCore.Authorization.Policy => 178
	i64 u0x8076a9a44a2ca331, ; 611: System.Net.Quic => 70
	i64 u0x80ced318f46f7fa5, ; 612: Nethereum.Accounts.dll => 229
	i64 u0x80da183a87731838, ; 613: System.Reflection.Metadata => 93
	i64 u0x80fa55b6d1b0be99, ; 614: SQLitePCLRaw.provider.e_sqlite3 => 256
	i64 u0x811b4d215b576447, ; 615: System.Net.WebSockets.WebSocketProtocol.dll => 260
	i64 u0x812c069d5cdecc17, ; 616: System.dll => 160
	i64 u0x81381be520a60adb, ; 617: Xamarin.AndroidX.Interpolator.dll => 306
	i64 u0x81657cec2b31e8aa, ; 618: System.Net => 80
	i64 u0x81ab745f6c0f5ce6, ; 619: zh-Hant/Microsoft.Maui.Controls.resources => 398
	i64 u0x822aa49008112ebe, ; 620: Microsoft.Extensions.ObjectPool => 216
	i64 u0x8277f2be6b5ce05f, ; 621: Xamarin.AndroidX.AppCompat => 273
	i64 u0x828f06563b30bc50, ; 622: lib_Xamarin.AndroidX.CardView.dll.so => 284
	i64 u0x82920a8d9194a019, ; 623: Xamarin.KotlinX.AtomicFU.Jvm.dll => 356
	i64 u0x82b399cb01b531c4, ; 624: lib_System.Web.dll.so => 149
	i64 u0x82df8f5532a10c59, ; 625: lib_System.Drawing.dll.so => 35
	i64 u0x82f0b6e911d13535, ; 626: lib_System.Transactions.dll.so => 146
	i64 u0x82f6403342e12049, ; 627: uk/Microsoft.Maui.Controls.resources => 394
	i64 u0x83144699b312ad81, ; 628: SQLite-net.dll => 252
	i64 u0x83c14ba66c8e2b8c, ; 629: zh-Hans/Microsoft.Maui.Controls.resources => 397
	i64 u0x844ac8f64fd78edc, ; 630: Xamarin.AndroidX.Camera.View.dll => 283
	i64 u0x846ce984efea52c7, ; 631: System.Threading.Tasks.Parallel.dll => 139
	i64 u0x846f52335a832137, ; 632: Microsoft.Extensions.Features => 208
	i64 u0x8474661ff7dfe071, ; 633: Nethereum.Signer => 241
	i64 u0x84a193ebdfbe477d, ; 634: Xamarin.AndroidX.Tracing.Tracing.Ktx => 336
	i64 u0x84ae73148a4557d2, ; 635: lib_System.IO.Pipes.dll.so => 54
	i64 u0x84b01102c12a9232, ; 636: System.Runtime.Serialization.Json.dll => 111
	i64 u0x84f20950c4c7164b, ; 637: Microsoft.AspNetCore.Http => 182
	i64 u0x850c5ba0b57ce8e7, ; 638: lib_Xamarin.AndroidX.Collection.dll.so => 285
	i64 u0x851d02edd334b044, ; 639: Xamarin.AndroidX.VectorDrawable => 338
	i64 u0x85c919db62150978, ; 640: Xamarin.AndroidX.Transition.dll => 337
	i64 u0x8662aaeb94fef37f, ; 641: lib_System.Dynamic.Runtime.dll.so => 36
	i64 u0x86a909228dc7657b, ; 642: lib-zh-Hant-Microsoft.Maui.Controls.resources.dll.so => 398
	i64 u0x86b3e00c36b84509, ; 643: Microsoft.Extensions.Configuration.dll => 201
	i64 u0x86b62cb077ec4fd7, ; 644: System.Runtime.Serialization.Xml => 113
	i64 u0x8706ffb12bf3f53d, ; 645: Xamarin.AndroidX.Annotation.Experimental => 271
	i64 u0x872a5b14c18d328c, ; 646: System.ComponentModel.DataAnnotations => 14
	i64 u0x872fb9615bc2dff0, ; 647: Xamarin.Android.Glide.Annotations.dll => 265
	i64 u0x87c69b87d9283884, ; 648: lib_System.Threading.Thread.dll.so => 141
	i64 u0x87d6cb5c641c5f07, ; 649: Microsoft.AspNetCore.Http.Abstractions.dll => 183
	i64 u0x87f6569b25707834, ; 650: System.IO.Compression.Brotli.dll => 42
	i64 u0x8842b3a5d2d3fb36, ; 651: Microsoft.Maui.Essentials => 223
	i64 u0x88926583efe7ee86, ; 652: Xamarin.AndroidX.Activity.Ktx.dll => 269
	i64 u0x88ab91f65c23d44a, ; 653: Microsoft.AspNetCore.SignalR => 191
	i64 u0x88ba6bc4f7762b03, ; 654: lib_System.Reflection.dll.so => 96
	i64 u0x88bda98e0cffb7a9, ; 655: lib_Xamarin.KotlinX.Coroutines.Core.Jvm.dll.so => 359
	i64 u0x88f6560664ffa916, ; 656: Nethereum.RLP => 239
	i64 u0x8930322c7bd8f768, ; 657: netstandard => 163
	i64 u0x897a606c9e39c75f, ; 658: lib_System.ComponentModel.Primitives.dll.so => 16
	i64 u0x89911a22005b92b7, ; 659: System.IO.FileSystem.DriveInfo.dll => 47
	i64 u0x89c5188089ec2cd5, ; 660: lib_System.Runtime.InteropServices.RuntimeInformation.dll.so => 105
	i64 u0x8a0b6f586fccda8a, ; 661: lib_Microsoft.AspNetCore.Http.Extensions.dll.so => 187
	i64 u0x8a14bf4400a024af, ; 662: lib_Microsoft.AspNetCore.Http.Features.dll.so => 188
	i64 u0x8a19e3dc71b34b2c, ; 663: System.Reflection.TypeExtensions.dll => 95
	i64 u0x8ad229ea26432ee2, ; 664: Xamarin.AndroidX.Loader => 321
	i64 u0x8b08eba2e819a63e, ; 665: lib_Nethereum.RLP.dll.so => 239
	i64 u0x8b42b55a5bb040b5, ; 666: lib_Microsoft.AspNetCore.SignalR.Protocols.Json.dll.so => 196
	i64 u0x8b4ff5d0fdd5faa1, ; 667: lib_System.Diagnostics.DiagnosticSource.dll.so => 257
	i64 u0x8b541d476eb3774c, ; 668: System.Security.Principal.Windows => 126
	i64 u0x8b8d01333a96d0b5, ; 669: System.Diagnostics.Process.dll => 28
	i64 u0x8b9ceca7acae3451, ; 670: lib-he-Microsoft.Maui.Controls.resources.dll.so => 374
	i64 u0x8c575135aa1ccef4, ; 671: Microsoft.Extensions.FileProviders.Abstractions => 209
	i64 u0x8cb8f612b633affb, ; 672: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 330
	i64 u0x8cdfdb4ce85fb925, ; 673: lib_System.Security.Principal.Windows.dll.so => 126
	i64 u0x8cdfe7b8f4caa426, ; 674: System.IO.Compression.FileSystem => 43
	i64 u0x8d0f420977c2c1c7, ; 675: Xamarin.AndroidX.CursorAdapter.dll => 296
	i64 u0x8d52f7ea2796c531, ; 676: Xamarin.AndroidX.Emoji2.dll => 301
	i64 u0x8d7b8ab4b3310ead, ; 677: System.Threading => 144
	i64 u0x8da188285aadfe8e, ; 678: System.Collections.Concurrent => 8
	i64 u0x8dce248c34c54ef3, ; 679: lib_Microsoft.AspNetCore.Hosting.Abstractions.dll.so => 180
	i64 u0x8ec6e06a61c1baeb, ; 680: lib_Newtonsoft.Json.dll.so => 246
	i64 u0x8ed807bfe9858dfc, ; 681: Xamarin.AndroidX.Navigation.Common => 322
	i64 u0x8ee08b8194a30f48, ; 682: lib-hi-Microsoft.Maui.Controls.resources.dll.so => 375
	i64 u0x8ef7601039857a44, ; 683: lib-ro-Microsoft.Maui.Controls.resources.dll.so => 388
	i64 u0x8ef9414937d93a0a, ; 684: SQLitePCLRaw.core.dll => 254
	i64 u0x8f32c6f611f6ffab, ; 685: pt/Microsoft.Maui.Controls.resources.dll => 387
	i64 u0x8f44b45eb046bbd1, ; 686: System.ServiceModel.Web.dll => 130
	i64 u0x8f8829d21c8985a4, ; 687: lib-pt-BR-Microsoft.Maui.Controls.resources.dll.so => 386
	i64 u0x8f97020698a101ba, ; 688: Microsoft.AspNetCore.Routing.dll => 189
	i64 u0x8fbf5b0114c6dcef, ; 689: System.Globalization.dll => 41
	i64 u0x8fcc8c2a81f3d9e7, ; 690: Xamarin.KotlinX.Serialization.Core => 360
	i64 u0x8fd27d934d7b3a55, ; 691: SQLitePCLRaw.core => 254
	i64 u0x90263f8448b8f572, ; 692: lib_System.Diagnostics.TraceSource.dll.so => 32
	i64 u0x90281820febeff00, ; 693: lib_Microsoft.AspNetCore.Routing.Abstractions.dll.so => 190
	i64 u0x903101b46fb73a04, ; 694: _Microsoft.Android.Resource.Designer => 402
	i64 u0x90393bd4865292f3, ; 695: lib_System.IO.Compression.dll.so => 45
	i64 u0x905e2b8e7ae91ae6, ; 696: System.Threading.Tasks.Extensions.dll => 138
	i64 u0x90634f86c5ebe2b5, ; 697: Xamarin.AndroidX.Lifecycle.ViewModel.Android => 318
	i64 u0x907b636704ad79ef, ; 698: lib_Microsoft.Maui.Controls.Xaml.dll.so => 221
	i64 u0x90ae2b5b8b652f2a, ; 699: lib_Microsoft.AspNetCore.SignalR.Client.Core.dll.so => 193
	i64 u0x90e9efbfd68593e0, ; 700: lib_Xamarin.AndroidX.Lifecycle.LiveData.dll.so => 309
	i64 u0x91418dc638b29e68, ; 701: lib_Xamarin.AndroidX.CustomView.dll.so => 297
	i64 u0x9157bd523cd7ed36, ; 702: lib_System.Text.Json.dll.so => 262
	i64 u0x91a74f07b30d37e2, ; 703: System.Linq.dll => 60
	i64 u0x91cb86ea3b17111d, ; 704: System.ServiceModel.Web => 130
	i64 u0x91fa41a87223399f, ; 705: ca/Microsoft.Maui.Controls.resources.dll => 366
	i64 u0x92054e486c0c7ea7, ; 706: System.IO.FileSystem.DriveInfo => 47
	i64 u0x928614058c40c4cd, ; 707: lib_System.Xml.XPath.XDocument.dll.so => 155
	i64 u0x92b138fffca2b01e, ; 708: lib_Xamarin.AndroidX.Arch.Core.Runtime.dll.so => 276
	i64 u0x92dfc2bfc6c6a888, ; 709: Xamarin.AndroidX.Lifecycle.LiveData => 309
	i64 u0x933da2c779423d68, ; 710: Xamarin.Android.Glide.Annotations => 265
	i64 u0x93560decaaffea24, ; 711: NBitcoin => 226
	i64 u0x9388aad9b7ae40ce, ; 712: lib_Xamarin.AndroidX.Lifecycle.Common.dll.so => 307
	i64 u0x93cfa73ab28d6e35, ; 713: ms/Microsoft.Maui.Controls.resources => 382
	i64 u0x941c00d21e5c0679, ; 714: lib_Xamarin.AndroidX.Transition.dll.so => 337
	i64 u0x944077d8ca3c6580, ; 715: System.IO.Compression.dll => 45
	i64 u0x948cffedc8ed7960, ; 716: System.Xml => 159
	i64 u0x94c8990839c4bdb1, ; 717: lib_Xamarin.AndroidX.Interpolator.dll.so => 306
	i64 u0x957a4cdfdcfd6d83, ; 718: Refit.HttpClientFactory.dll => 251
	i64 u0x95c6b36f5f5d7039, ; 719: Xamarin.AndroidX.Camera.Camera2 => 279
	i64 u0x95d757769563d0d3, ; 720: Xamarin.AndroidX.Camera.Lifecycle.dll => 281
	i64 u0x967fc325e09bfa8c, ; 721: es/Microsoft.Maui.Controls.resources => 371
	i64 u0x9686161486d34b81, ; 722: lib_Xamarin.AndroidX.ExifInterface.dll.so => 303
	i64 u0x9732d8dbddea3d9a, ; 723: id/Microsoft.Maui.Controls.resources => 378
	i64 u0x978be80e5210d31b, ; 724: Microsoft.Maui.Graphics.dll => 224
	i64 u0x97b8c771ea3e4220, ; 725: System.ComponentModel.dll => 18
	i64 u0x97e144c9d3c6976e, ; 726: System.Collections.Concurrent.dll => 8
	i64 u0x984184e3c70d4419, ; 727: GoogleGson => 174
	i64 u0x9843944103683dd3, ; 728: Xamarin.AndroidX.Core.Core.Ktx => 294
	i64 u0x98d720cc4597562c, ; 729: System.Security.Cryptography.OpenSsl => 122
	i64 u0x99052c1297204af4, ; 730: lib_Xamarin.AndroidX.Camera.Core.dll.so => 280
	i64 u0x991d510397f92d9d, ; 731: System.Linq.Expressions => 57
	i64 u0x996ceeb8a3da3d67, ; 732: System.Threading.Overlapped.dll => 136
	i64 u0x999cb19e1a04ffd3, ; 733: CommunityToolkit.Mvvm.dll => 173
	i64 u0x99a00ca5270c6878, ; 734: Xamarin.AndroidX.Navigation.Runtime => 324
	i64 u0x99cdc6d1f2d3a72f, ; 735: ko/Microsoft.Maui.Controls.resources.dll => 381
	i64 u0x9a01b1da98b6ee10, ; 736: Xamarin.AndroidX.Lifecycle.Runtime.dll => 313
	i64 u0x9a5ccc274fd6e6ee, ; 737: Jsr305Binding.dll => 347
	i64 u0x9ae6940b11c02876, ; 738: lib_Xamarin.AndroidX.Window.dll.so => 343
	i64 u0x9b211a749105beac, ; 739: System.Transactions.Local => 145
	i64 u0x9b8734714671022d, ; 740: System.Threading.Tasks.Dataflow.dll => 137
	i64 u0x9bc6aea27fbf034f, ; 741: lib_Xamarin.KotlinX.Coroutines.Core.dll.so => 358
	i64 u0x9bd8cc74558ad4c7, ; 742: Xamarin.KotlinX.AtomicFU => 355
	i64 u0x9c244ac7cda32d26, ; 743: System.Security.Cryptography.X509Certificates.dll => 124
	i64 u0x9c465f280cf43733, ; 744: lib_Xamarin.KotlinX.Coroutines.Android.dll.so => 357
	i64 u0x9c8f6872beab6408, ; 745: System.Xml.XPath.XDocument.dll => 155
	i64 u0x9ce01cf91101ae23, ; 746: System.Xml.XmlDocument => 157
	i64 u0x9d052eb79c53b587, ; 747: lib_Polly.dll.so => 248
	i64 u0x9d128180c81d7ce6, ; 748: Xamarin.AndroidX.CustomView.PoolingContainer => 298
	i64 u0x9d5dbcf5a48583fe, ; 749: lib_Xamarin.AndroidX.Activity.dll.so => 268
	i64 u0x9d74dee1a7725f34, ; 750: Microsoft.Extensions.Configuration.Abstractions.dll => 202
	i64 u0x9e4534b6adaf6e84, ; 751: nl/Microsoft.Maui.Controls.resources => 384
	i64 u0x9e4b95dec42769f7, ; 752: System.Diagnostics.Debug.dll => 26
	i64 u0x9e53f28574cae6c2, ; 753: Bank.Application => 399
	i64 u0x9eaf1efdf6f7267e, ; 754: Xamarin.AndroidX.Navigation.Common.dll => 322
	i64 u0x9ee6ffcd8a354b81, ; 755: Polly.Extensions.Http.dll => 249
	i64 u0x9ef542cf1f78c506, ; 756: Xamarin.AndroidX.Lifecycle.LiveData.Core => 310
	i64 u0x9ff334e3cf272fd6, ; 757: lib_Xamarin.AndroidX.Camera.Lifecycle.dll.so => 281
	i64 u0xa00832eb975f56a8, ; 758: lib_System.Net.dll.so => 80
	i64 u0xa05475503f80b7d9, ; 759: Microsoft.AspNetCore.Connections.Abstractions => 179
	i64 u0xa0ad78236b7b267f, ; 760: Xamarin.AndroidX.Window => 343
	i64 u0xa0d8259f4cc284ec, ; 761: lib_System.Security.Cryptography.dll.so => 125
	i64 u0xa0e17ca50c77a225, ; 762: lib_Xamarin.Google.Crypto.Tink.Android.dll.so => 348
	i64 u0xa0ff9b3e34d92f11, ; 763: lib_System.Resources.Writer.dll.so => 99
	i64 u0xa12fbfb4da97d9f3, ; 764: System.Threading.Timer.dll => 143
	i64 u0xa1440773ee9d341e, ; 765: Xamarin.Google.Android.Material => 345
	i64 u0xa1b9d7c27f47219f, ; 766: Xamarin.AndroidX.Navigation.UI.dll => 325
	i64 u0xa2572680829d2c7c, ; 767: System.IO.Pipelines.dll => 258
	i64 u0xa26597e57ee9c7f6, ; 768: System.Xml.XmlDocument.dll => 157
	i64 u0xa308401900e5bed3, ; 769: lib_mscorlib.dll.so => 162
	i64 u0xa39146d7fd1b911a, ; 770: Bank.Domain => 400
	i64 u0xa395572e7da6c99d, ; 771: lib_System.Security.dll.so => 129
	i64 u0xa3e683f24b43af6f, ; 772: System.Dynamic.Runtime.dll => 36
	i64 u0xa4145becdee3dc4f, ; 773: Xamarin.AndroidX.VectorDrawable.Animated => 339
	i64 u0xa46aa1eaa214539b, ; 774: ko/Microsoft.Maui.Controls.resources => 381
	i64 u0xa473938c792db0b6, ; 775: Microsoft.AspNetCore.Routing.Abstractions => 190
	i64 u0xa4a372eecb9e4df0, ; 776: Microsoft.Extensions.Diagnostics => 206
	i64 u0xa4d20d2ff0563d26, ; 777: lib_CommunityToolkit.Mvvm.dll.so => 173
	i64 u0xa4edc8f2ceae241a, ; 778: System.Data.Common.dll => 22
	i64 u0xa5494f40f128ce6a, ; 779: System.Runtime.Serialization.Formatters.dll => 110
	i64 u0xa54b74df83dce92b, ; 780: System.Reflection.DispatchProxy => 88
	i64 u0xa5b7152421ed6d98, ; 781: lib_System.IO.FileSystem.Watcher.dll.so => 49
	i64 u0xa5c3844f17b822db, ; 782: lib_System.Linq.Parallel.dll.so => 58
	i64 u0xa5ce5c755bde8cb8, ; 783: lib_System.Security.Cryptography.Csp.dll.so => 120
	i64 u0xa5e599d1e0524750, ; 784: System.Numerics.Vectors.dll => 81
	i64 u0xa5f1ba49b85dd355, ; 785: System.Security.Cryptography.dll => 125
	i64 u0xa61975a5a37873ea, ; 786: lib_System.Xml.XmlSerializer.dll.so => 158
	i64 u0xa6593e21584384d2, ; 787: lib_Jsr305Binding.dll.so => 347
	i64 u0xa66cbee0130865f7, ; 788: lib_WindowsBase.dll.so => 161
	i64 u0xa67dbee13e1df9ca, ; 789: Xamarin.AndroidX.SavedState.dll => 329
	i64 u0xa684b098dd27b296, ; 790: lib_Xamarin.AndroidX.Security.SecurityCrypto.dll.so => 331
	i64 u0xa68a420042bb9b1f, ; 791: Xamarin.AndroidX.DrawerLayout.dll => 299
	i64 u0xa6d26156d1cacc7c, ; 792: Xamarin.Android.Glide.dll => 264
	i64 u0xa75386b5cb9595aa, ; 793: Xamarin.AndroidX.Lifecycle.Runtime.Android => 314
	i64 u0xa75cf331ee476318, ; 794: lib_Microsoft.AspNetCore.Http.Abstractions.dll.so => 183
	i64 u0xa763fbb98df8d9fb, ; 795: lib_Microsoft.Win32.Primitives.dll.so => 4
	i64 u0xa78ce3745383236a, ; 796: Xamarin.AndroidX.Lifecycle.Common.Jvm => 308
	i64 u0xa797ca094a0a7418, ; 797: lib_Microsoft.AspNetCore.SignalR.Core.dll.so => 195
	i64 u0xa7c31b56b4dc7b33, ; 798: hu/Microsoft.Maui.Controls.resources => 377
	i64 u0xa7eab29ed44b4e7a, ; 799: Mono.Android.Export => 165
	i64 u0xa8195217cbf017b7, ; 800: Microsoft.VisualBasic.Core => 2
	i64 u0xa859a95830f367ff, ; 801: lib_Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll.so => 319
	i64 u0xa8b52f21e0dbe690, ; 802: System.Runtime.Serialization.dll => 114
	i64 u0xa8ee4ed7de2efaee, ; 803: Xamarin.AndroidX.Annotation.dll => 270
	i64 u0xa935d44a0e76326c, ; 804: Nethereum.Signer.EIP712.dll => 242
	i64 u0xa95590e7c57438a4, ; 805: System.Configuration => 19
	i64 u0xa964304b5631e28a, ; 806: CommunityToolkit.Maui.Core.dll => 172
	i64 u0xaa2219c8e3449ff5, ; 807: Microsoft.Extensions.Logging.Abstractions => 214
	i64 u0xaa443ac34067eeef, ; 808: System.Private.Xml.dll => 87
	i64 u0xaa52de307ef5d1dd, ; 809: System.Net.Http => 63
	i64 u0xaa9a7b0214a5cc5c, ; 810: System.Diagnostics.StackTrace.dll => 29
	i64 u0xaaaf86367285a918, ; 811: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 205
	i64 u0xaaf84bb3f052a265, ; 812: el/Microsoft.Maui.Controls.resources => 370
	i64 u0xab9af77b5b67a0b8, ; 813: Xamarin.AndroidX.ConstraintLayout.Core => 291
	i64 u0xab9c1b2687d86b0b, ; 814: lib_System.Linq.Expressions.dll.so => 57
	i64 u0xac03339b985f4d59, ; 815: Microsoft.AspNetCore.SignalR.Client.Core.dll => 193
	i64 u0xac2af3fa195a15ce, ; 816: System.Runtime.Numerics => 109
	i64 u0xac5376a2a538dc10, ; 817: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 310
	i64 u0xac5acae88f60357e, ; 818: System.Diagnostics.Tools.dll => 31
	i64 u0xac79c7e46047ad98, ; 819: System.Security.Principal.Windows.dll => 126
	i64 u0xac98d31068e24591, ; 820: System.Xml.XDocument => 154
	i64 u0xacd46e002c3ccb97, ; 821: ro/Microsoft.Maui.Controls.resources => 388
	i64 u0xacdd9e4180d56dda, ; 822: Xamarin.AndroidX.Concurrent.Futures => 288
	i64 u0xacf42eea7ef9cd12, ; 823: System.Threading.Channels => 263
	i64 u0xad89c07347f1bad6, ; 824: nl/Microsoft.Maui.Controls.resources.dll => 384
	i64 u0xadbb53caf78a79d2, ; 825: System.Web.HttpUtility => 148
	i64 u0xadc90ab061a9e6e4, ; 826: System.ComponentModel.TypeConverter.dll => 17
	i64 u0xadca1b9030b9317e, ; 827: Xamarin.AndroidX.Collection.Ktx => 287
	i64 u0xadd8eda2edf396ad, ; 828: Xamarin.Android.Glide.GifDecoder => 267
	i64 u0xadf4cf30debbeb9a, ; 829: System.Net.ServicePoint.dll => 73
	i64 u0xadf511667bef3595, ; 830: System.Net.Security => 72
	i64 u0xae0aaa94fdcfce0f, ; 831: System.ComponentModel.EventBasedAsync.dll => 15
	i64 u0xae282bcd03739de7, ; 832: Java.Interop => 164
	i64 u0xae53579c90db1107, ; 833: System.ObjectModel.dll => 83
	i64 u0xae7ea18c61eef394, ; 834: SQLite-net => 252
	i64 u0xaec7c0c7e2ed4575, ; 835: lib_Xamarin.KotlinX.AtomicFU.Jvm.dll.so => 356
	i64 u0xaec9ad6c2a70fe2f, ; 836: lib_Bank.Application.dll.so => 399
	i64 u0xaf732d0b2193b8f5, ; 837: System.Security.Cryptography.OpenSsl.dll => 122
	i64 u0xaf8d7bd6ac6cb804, ; 838: lib_Nethereum.Util.dll.so => 243
	i64 u0xafdb94dbccd9d11c, ; 839: Xamarin.AndroidX.Lifecycle.LiveData.dll => 309
	i64 u0xafe29f45095518e7, ; 840: lib_Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll.so => 320
	i64 u0xb03ae931fb25607e, ; 841: Xamarin.AndroidX.ConstraintLayout => 290
	i64 u0xb05cc42cd94c6d9d, ; 842: lib-sv-Microsoft.Maui.Controls.resources.dll.so => 391
	i64 u0xb0ac21bec8f428c5, ; 843: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.Android.dll => 316
	i64 u0xb0bb43dc52ea59f9, ; 844: System.Diagnostics.Tracing.dll => 33
	i64 u0xb1dd05401aa8ee63, ; 845: System.Security.AccessControl => 116
	i64 u0xb220631954820169, ; 846: System.Text.RegularExpressions => 135
	i64 u0xb2376e1dbf8b4ed7, ; 847: System.Security.Cryptography.Csp => 120
	i64 u0xb2a1959fe95c5402, ; 848: lib_System.Runtime.InteropServices.JavaScript.dll.so => 104
	i64 u0xb2a3f67f3bf29fce, ; 849: da/Microsoft.Maui.Controls.resources => 368
	i64 u0xb3874072ee0ecf8c, ; 850: Xamarin.AndroidX.VectorDrawable.Animated.dll => 339
	i64 u0xb3b9014870e7b69c, ; 851: Microsoft.AspNet.SignalR.Client => 175
	i64 u0xb3e6ff0e26df36f1, ; 852: Bank.Infrastructure => 401
	i64 u0xb3f0a0fcda8d3ebc, ; 853: Xamarin.AndroidX.CardView => 284
	i64 u0xb46be1aa6d4fff93, ; 854: hi/Microsoft.Maui.Controls.resources => 375
	i64 u0xb477491be13109d8, ; 855: ar/Microsoft.Maui.Controls.resources => 365
	i64 u0xb4bd7015ecee9d86, ; 856: System.IO.Pipelines => 258
	i64 u0xb4c53d9749c5f226, ; 857: lib_System.IO.FileSystem.AccessControl.dll.so => 46
	i64 u0xb4ff710863453fda, ; 858: System.Diagnostics.FileVersionInfo.dll => 27
	i64 u0xb545f78b0415b9b9, ; 859: Microsoft.AspNetCore.WebUtilities.dll => 198
	i64 u0xb5c38bf497a4cfe2, ; 860: lib_System.Threading.Tasks.dll.so => 140
	i64 u0xb5c7fcdafbc67ee4, ; 861: Microsoft.Extensions.Logging.Abstractions.dll => 214
	i64 u0xb5e59badb43e7829, ; 862: Microsoft.AspNetCore.Routing.Abstractions.dll => 190
	i64 u0xb5ea31d5244c6626, ; 863: System.Threading.ThreadPool.dll => 142
	i64 u0xb7212c4683a94afe, ; 864: System.Drawing.Primitives => 34
	i64 u0xb7b7753d1f319409, ; 865: sv/Microsoft.Maui.Controls.resources => 391
	i64 u0xb7f996489e8e91e4, ; 866: Nethereum.Accounts => 229
	i64 u0xb7fc1ca98fe2d494, ; 867: Nethereum.KeyStore.dll => 236
	i64 u0xb81a2c6e0aee50fe, ; 868: lib_System.Private.CoreLib.dll.so => 168
	i64 u0xb872c26142d22aa9, ; 869: Microsoft.Extensions.Http.dll => 211
	i64 u0xb8b0a9b3dfbc5cb7, ; 870: Xamarin.AndroidX.Window.Extensions.Core.Core => 344
	i64 u0xb8c60af47c08d4da, ; 871: System.Net.ServicePoint => 73
	i64 u0xb8e68d20aad91196, ; 872: lib_System.Xml.XPath.dll.so => 156
	i64 u0xb9185c33a1643eed, ; 873: Microsoft.CSharp.dll => 1
	i64 u0xb9b8001adf4ed7cc, ; 874: lib_Xamarin.AndroidX.SlidingPaneLayout.dll.so => 332
	i64 u0xb9f64d3b230def68, ; 875: lib-pt-Microsoft.Maui.Controls.resources.dll.so => 387
	i64 u0xb9fc3c8a556e3691, ; 876: ja/Microsoft.Maui.Controls.resources => 380
	i64 u0xba4670aa94a2b3c6, ; 877: lib_System.Xml.XDocument.dll.so => 154
	i64 u0xba48785529705af9, ; 878: System.Collections.dll => 12
	i64 u0xba965b8c86359996, ; 879: lib_System.Windows.dll.so => 150
	i64 u0xbb286883bc35db36, ; 880: System.Transactions.dll => 146
	i64 u0xbb639e0337b3d979, ; 881: Microsoft.AspNetCore.Http.dll => 182
	i64 u0xbb65706fde942ce3, ; 882: System.Net.Sockets => 74
	i64 u0xbb6dc0b35452c1a0, ; 883: ZXing.Net.MAUI.dll => 363
	i64 u0xbb835720c2fe45c6, ; 884: lib_Nethereum.KeyStore.dll.so => 236
	i64 u0xbba28979413cad9e, ; 885: lib_System.Runtime.CompilerServices.VisualC.dll.so => 101
	i64 u0xbbd180354b67271a, ; 886: System.Runtime.Serialization.Formatters => 110
	i64 u0xbc1c174a8f6053a0, ; 887: Plugin.Fingerprint => 247
	i64 u0xbc22a245dab70cb4, ; 888: lib_SQLitePCLRaw.provider.e_sqlite3.dll.so => 256
	i64 u0xbc260cdba33291a3, ; 889: Xamarin.AndroidX.Arch.Core.Common.dll => 275
	i64 u0xbc529bad4a26d429, ; 890: Nethereum.Model => 238
	i64 u0xbcd36316d29f27b4, ; 891: lib_Microsoft.AspNetCore.Authorization.dll.so => 177
	i64 u0xbd0e2c0d55246576, ; 892: System.Net.Http.dll => 63
	i64 u0xbd3fbd85b9e1cb29, ; 893: lib_System.Net.HttpListener.dll.so => 64
	i64 u0xbd437a2cdb333d0d, ; 894: Xamarin.AndroidX.ViewPager2 => 342
	i64 u0xbd4f572d2bd0a789, ; 895: System.IO.Compression.ZipFile.dll => 44
	i64 u0xbd5703eb120dcd72, ; 896: Nethereum.Web3 => 245
	i64 u0xbd5d0b88d3d647a5, ; 897: lib_Xamarin.AndroidX.Browser.dll.so => 278
	i64 u0xbd877b14d0b56392, ; 898: System.Runtime.Intrinsics.dll => 107
	i64 u0xbde4cd9bb9008cb3, ; 899: lib_Microsoft.AspNetCore.Authentication.Abstractions.dll.so => 176
	i64 u0xbe08e3083025c53d, ; 900: ZXing.Net.MAUI.Controls.dll => 364
	i64 u0xbe532a80075c3dc8, ; 901: Xamarin.AndroidX.Camera.Core.dll => 280
	i64 u0xbe65a49036345cf4, ; 902: lib_System.Buffers.dll.so => 7
	i64 u0xbee38d4a88835966, ; 903: Xamarin.AndroidX.AppCompat.AppCompatResources => 274
	i64 u0xbef9919db45b4ca7, ; 904: System.IO.Pipes.AccessControl => 53
	i64 u0xbf0fa68611139208, ; 905: lib_Xamarin.AndroidX.Annotation.dll.so => 270
	i64 u0xbfbc29f76af17966, ; 906: lib_Bank.MobileUI.dll.so => 0
	i64 u0xbfc1e1fb3095f2b3, ; 907: lib_System.Net.Http.Json.dll.so => 62
	i64 u0xc040a4ab55817f58, ; 908: ar/Microsoft.Maui.Controls.resources.dll => 365
	i64 u0xc07cadab29efeba0, ; 909: Xamarin.AndroidX.Core.Core.Ktx.dll => 294
	i64 u0xc0d928351ab5ca77, ; 910: System.Console.dll => 20
	i64 u0xc0f5a221a9383aea, ; 911: System.Runtime.Intrinsics => 107
	i64 u0xc111030af54d7191, ; 912: System.Resources.Writer => 99
	i64 u0xc12b8b3afa48329c, ; 913: lib_System.Linq.dll.so => 60
	i64 u0xc183ca0b74453aa9, ; 914: lib_System.Threading.Tasks.Dataflow.dll.so => 137
	i64 u0xc1ebdc7e6a943450, ; 915: Microsoft.AspNetCore.Authorization.dll => 177
	i64 u0xc1ef053871843006, ; 916: Nethereum.Hex.dll => 233
	i64 u0xc1ff9ae3cdb6e1e6, ; 917: Xamarin.AndroidX.Activity.dll => 268
	i64 u0xc2260e1da1054ac1, ; 918: lib_BouncyCastle.Cryptography.dll.so => 170
	i64 u0xc25533624a79454d, ; 919: lib_Nethereum.Merkle.Patricia.dll.so => 237
	i64 u0xc26c064effb1dea9, ; 920: System.Buffers.dll => 7
	i64 u0xc28c50f32f81cc73, ; 921: ja/Microsoft.Maui.Controls.resources.dll => 380
	i64 u0xc2902f6cf5452577, ; 922: lib_Mono.Android.Export.dll.so => 165
	i64 u0xc2a3bca55b573141, ; 923: System.IO.FileSystem.Watcher => 49
	i64 u0xc2bcfec99f69365e, ; 924: Xamarin.AndroidX.ViewPager2.dll => 342
	i64 u0xc30b52815b58ac2c, ; 925: lib_System.Runtime.Serialization.Xml.dll.so => 113
	i64 u0xc36d7d89c652f455, ; 926: System.Threading.Overlapped => 136
	i64 u0xc374571bc2b0b5f8, ; 927: lib_Microsoft.AspNetCore.Routing.dll.so => 189
	i64 u0xc396b285e59e5493, ; 928: GoogleGson.dll => 174
	i64 u0xc39ced8467203460, ; 929: lib_Refit.HttpClientFactory.dll.so => 251
	i64 u0xc3a20bf3bcc87eaf, ; 930: Microsoft.AspNetCore.Http.Connections => 184
	i64 u0xc3c7c6d5a3761540, ; 931: Nethereum.RPC => 240
	i64 u0xc3c86c1e5e12f03d, ; 932: WindowsBase => 161
	i64 u0xc3f0e03e56ce7b69, ; 933: zxing => 362
	i64 u0xc421b61fd853169d, ; 934: lib_System.Net.WebSockets.Client.dll.so => 78
	i64 u0xc463e077917aa21d, ; 935: System.Runtime.Serialization.Json => 111
	i64 u0xc4d3858ed4d08512, ; 936: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 320
	i64 u0xc4f2d57c50beb816, ; 937: lib_Microsoft.Extensions.Features.dll.so => 208
	i64 u0xc50fded0ded1418c, ; 938: lib_System.ComponentModel.TypeConverter.dll.so => 17
	i64 u0xc519125d6bc8fb11, ; 939: lib_System.Net.Requests.dll.so => 71
	i64 u0xc5293b19e4dc230e, ; 940: Xamarin.AndroidX.Navigation.Fragment => 323
	i64 u0xc5325b2fcb37446f, ; 941: lib_System.Private.Xml.dll.so => 87
	i64 u0xc535cb9a21385d9b, ; 942: lib_Xamarin.Android.Glide.DiskLruCache.dll.so => 266
	i64 u0xc5a0f4b95a699af7, ; 943: lib_System.Private.Uri.dll.so => 85
	i64 u0xc5cdcd5b6277579e, ; 944: lib_System.Security.Cryptography.Algorithms.dll.so => 118
	i64 u0xc5de3dcae13c325f, ; 945: Microsoft.AspNetCore.SignalR.Client => 192
	i64 u0xc5ec286825cb0bf4, ; 946: Xamarin.AndroidX.Tracing.Tracing => 335
	i64 u0xc6706bc8aa7fe265, ; 947: Xamarin.AndroidX.Annotation.Jvm => 272
	i64 u0xc7c01e7d7c93a110, ; 948: System.Text.Encoding.Extensions.dll => 133
	i64 u0xc7ce851898a4548e, ; 949: lib_System.Web.HttpUtility.dll.so => 148
	i64 u0xc809d4089d2556b2, ; 950: System.Runtime.InteropServices.JavaScript.dll => 104
	i64 u0xc858a28d9ee5a6c5, ; 951: lib_System.Collections.Specialized.dll.so => 11
	i64 u0xc87a188861588632, ; 952: Xamarin.AndroidX.Camera.Video.dll => 282
	i64 u0xc8ac7c6bf1c2ec51, ; 953: System.Reflection.DispatchProxy.dll => 88
	i64 u0xc9c62c8f354ac568, ; 954: lib_System.Diagnostics.TextWriterTraceListener.dll.so => 30
	i64 u0xc9e54b32fc19baf3, ; 955: lib_CommunityToolkit.Maui.dll.so => 171
	i64 u0xca3a723e7342c5b6, ; 956: lib-tr-Microsoft.Maui.Controls.resources.dll.so => 393
	i64 u0xca5801070d9fccfb, ; 957: System.Text.Encoding => 134
	i64 u0xcab3493c70141c2d, ; 958: pl/Microsoft.Maui.Controls.resources => 385
	i64 u0xcab69b9a31439815, ; 959: lib_Xamarin.Google.ErrorProne.TypeAnnotations.dll.so => 350
	i64 u0xcacfddc9f7c6de76, ; 960: ro/Microsoft.Maui.Controls.resources.dll => 388
	i64 u0xcadbc92899a777f0, ; 961: Xamarin.AndroidX.Startup.StartupRuntime => 333
	i64 u0xcba1cb79f45292b5, ; 962: Xamarin.Android.Glide.GifDecoder.dll => 267
	i64 u0xcbb5f80c7293e696, ; 963: lib_System.Globalization.Calendars.dll.so => 39
	i64 u0xcbd4fdd9cef4a294, ; 964: lib__Microsoft.Android.Resource.Designer.dll.so => 402
	i64 u0xcc15da1e07bbd994, ; 965: Xamarin.AndroidX.SlidingPaneLayout => 332
	i64 u0xcc182c3afdc374d6, ; 966: Microsoft.Bcl.AsyncInterfaces => 199
	i64 u0xcc2876b32ef2794c, ; 967: lib_System.Text.RegularExpressions.dll.so => 135
	i64 u0xcc5c3bb714c4561e, ; 968: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 359
	i64 u0xcc76886e09b88260, ; 969: Xamarin.KotlinX.Serialization.Core.Jvm.dll => 361
	i64 u0xcc9fa2923aa1c9ef, ; 970: System.Diagnostics.Contracts.dll => 25
	i64 u0xcce5f0b382db16b7, ; 971: Microsoft.AspNetCore.Http.Connections.Client => 185
	i64 u0xccf25c4b634ccd3a, ; 972: zh-Hans/Microsoft.Maui.Controls.resources.dll => 397
	i64 u0xcd10a42808629144, ; 973: System.Net.Requests => 71
	i64 u0xcdca1b920e9f53ba, ; 974: Xamarin.AndroidX.Interpolator => 306
	i64 u0xcdd0c48b6937b21c, ; 975: Xamarin.AndroidX.SwipeRefreshLayout => 334
	i64 u0xce57238a2f68613f, ; 976: lib_Plugin.Fingerprint.dll.so => 247
	i64 u0xcf23d8093f3ceadf, ; 977: System.Diagnostics.DiagnosticSource.dll => 257
	i64 u0xcf5ff6b6b2c4c382, ; 978: System.Net.Mail.dll => 65
	i64 u0xcf8fc898f98b0d34, ; 979: System.Private.Xml.Linq => 86
	i64 u0xd030f32762b3d78f, ; 980: Microsoft.AspNetCore.SignalR.Core => 195
	i64 u0xd04b5f59ed596e31, ; 981: System.Reflection.Metadata.dll => 93
	i64 u0xd063299fcfc0c93f, ; 982: lib_System.Runtime.Serialization.Json.dll.so => 111
	i64 u0xd0de8a113e976700, ; 983: System.Diagnostics.TextWriterTraceListener => 30
	i64 u0xd0fc33d5ae5d4cb8, ; 984: System.Runtime.Extensions => 102
	i64 u0xd1194e1d8a8de83c, ; 985: lib_Xamarin.AndroidX.Lifecycle.Common.Jvm.dll.so => 308
	i64 u0xd12beacdfc14f696, ; 986: System.Dynamic.Runtime => 36
	i64 u0xd16fd7fb9bbcd43e, ; 987: Microsoft.Extensions.Diagnostics.Abstractions => 207
	i64 u0xd198e7ce1b6a8344, ; 988: System.Net.Quic.dll => 70
	i64 u0xd1be4f7ac200f22c, ; 989: Nethereum.Util => 243
	i64 u0xd273aaa712516edb, ; 990: lib_Microsoft.AspNetCore.SignalR.dll.so => 191
	i64 u0xd3144156a3727ebe, ; 991: Xamarin.Google.Guava.ListenableFuture => 351
	i64 u0xd333d0af9e423810, ; 992: System.Runtime.InteropServices => 106
	i64 u0xd33a415cb4278969, ; 993: System.Security.Cryptography.Encoding.dll => 121
	i64 u0xd3426d966bb704f5, ; 994: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 274
	i64 u0xd3651b6fc3125825, ; 995: System.Private.Uri.dll => 85
	i64 u0xd373685349b1fe8b, ; 996: Microsoft.Extensions.Logging.dll => 213
	i64 u0xd3801faafafb7698, ; 997: System.Private.DataContractSerialization.dll => 84
	i64 u0xd3e4c8d6a2d5d470, ; 998: it/Microsoft.Maui.Controls.resources => 379
	i64 u0xd3edcc1f25459a50, ; 999: System.Reflection.Emit => 91
	i64 u0xd4645626dffec99d, ; 1000: lib_Microsoft.Extensions.DependencyInjection.Abstractions.dll.so => 205
	i64 u0xd4fa0abb79079ea9, ; 1001: System.Security.Principal.dll => 127
	i64 u0xd51e08cddf283b3c, ; 1002: lib_Xamarin.AndroidX.Concurrent.Futures.Ktx.dll.so => 289
	i64 u0xd52f53c4b3d62e11, ; 1003: Microsoft.AspNetCore.Connections.Abstractions.dll => 179
	i64 u0xd5507e11a2b2839f, ; 1004: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 320
	i64 u0xd567f168deeeaf3c, ; 1005: lib_zxing.dll.so => 362
	i64 u0xd5aa0995e9c57c8f, ; 1006: NBitcoin.Secp256k1.dll => 227
	i64 u0xd5d04bef8478ea19, ; 1007: Xamarin.AndroidX.Tracing.Tracing.dll => 335
	i64 u0xd60815f26a12e140, ; 1008: Microsoft.Extensions.Logging.Debug.dll => 215
	i64 u0xd63b432ec9306914, ; 1009: zxing.dll => 362
	i64 u0xd6694f8359737e4e, ; 1010: Xamarin.AndroidX.SavedState => 329
	i64 u0xd6949e129339eae5, ; 1011: lib_Xamarin.AndroidX.Core.Core.Ktx.dll.so => 294
	i64 u0xd6d21782156bc35b, ; 1012: Xamarin.AndroidX.SwipeRefreshLayout.dll => 334
	i64 u0xd6de019f6af72435, ; 1013: Xamarin.AndroidX.ConstraintLayout.Core.dll => 291
	i64 u0xd6f697a581fc6fe3, ; 1014: Xamarin.Google.ErrorProne.TypeAnnotations.dll => 350
	i64 u0xd70956d1e6deefb9, ; 1015: Jsr305Binding => 347
	i64 u0xd72329819cbbbc44, ; 1016: lib_Microsoft.Extensions.Configuration.Abstractions.dll.so => 202
	i64 u0xd72c760af136e863, ; 1017: System.Xml.XmlSerializer.dll => 158
	i64 u0xd753f071e44c2a03, ; 1018: lib_System.Security.SecureString.dll.so => 128
	i64 u0xd7b3764ada9d341d, ; 1019: lib_Microsoft.Extensions.Logging.Abstractions.dll.so => 214
	i64 u0xd7f0088bc5ad71f2, ; 1020: Xamarin.AndroidX.VersionedParcelable => 340
	i64 u0xd8fb25e28ae30a12, ; 1021: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 326
	i64 u0xd9d04d95a2671e29, ; 1022: lib_ZXing.Net.MAUI.Controls.dll.so => 364
	i64 u0xd9e245a1762ddad5, ; 1023: BouncyCastle.Cryptography => 170
	i64 u0xda1dfa4c534a9251, ; 1024: Microsoft.Extensions.DependencyInjection => 204
	i64 u0xda5cc470758594fc, ; 1025: lib_Bank.Domain.dll.so => 400
	i64 u0xdad05a11827959a3, ; 1026: System.Collections.NonGeneric.dll => 10
	i64 u0xdaefdfe71aa53cf9, ; 1027: System.IO.FileSystem.Primitives => 48
	i64 u0xdb5383ab5865c007, ; 1028: lib-vi-Microsoft.Maui.Controls.resources.dll.so => 395
	i64 u0xdb58816721c02a59, ; 1029: lib_System.Reflection.Emit.ILGeneration.dll.so => 89
	i64 u0xdbeda89f832aa805, ; 1030: vi/Microsoft.Maui.Controls.resources.dll => 395
	i64 u0xdbf2a779fbc3ac31, ; 1031: System.Transactions.Local.dll => 145
	i64 u0xdbf9607a441b4505, ; 1032: System.Linq => 60
	i64 u0xdbfc90157a0de9b0, ; 1033: lib_System.Text.Encoding.dll.so => 134
	i64 u0xdc75032002d1a212, ; 1034: lib_System.Transactions.Local.dll.so => 145
	i64 u0xdca8be7403f92d4f, ; 1035: lib_System.Linq.Queryable.dll.so => 59
	i64 u0xdce2c53525640bf3, ; 1036: Microsoft.Extensions.Logging => 213
	i64 u0xdd2b722d78ef5f43, ; 1037: System.Runtime.dll => 115
	i64 u0xdd67031857c72f96, ; 1038: lib_System.Text.Encodings.Web.dll.so => 261
	i64 u0xdd70765ad6162057, ; 1039: Xamarin.JSpecify => 353
	i64 u0xdd92e229ad292030, ; 1040: System.Numerics.dll => 82
	i64 u0xdde30e6b77aa6f6c, ; 1041: lib-zh-Hans-Microsoft.Maui.Controls.resources.dll.so => 397
	i64 u0xde110ae80fa7c2e2, ; 1042: System.Xml.XDocument.dll => 154
	i64 u0xde4726fcdf63a198, ; 1043: Xamarin.AndroidX.Transition => 337
	i64 u0xde572c2b2fb32f93, ; 1044: lib_System.Threading.Tasks.Extensions.dll.so => 138
	i64 u0xde74b8ad7a027199, ; 1045: Nethereum.Contracts => 231
	i64 u0xde8769ebda7d8647, ; 1046: hr/Microsoft.Maui.Controls.resources.dll => 376
	i64 u0xdee075f3477ef6be, ; 1047: Xamarin.AndroidX.ExifInterface.dll => 303
	i64 u0xdf45cf5bdb612c8c, ; 1048: Nethereum.RPC.dll => 240
	i64 u0xdf4b773de8fb1540, ; 1049: System.Net.dll => 80
	i64 u0xdf9c7682560a9629, ; 1050: System.Net.ServerSentEvents => 259
	i64 u0xdfa254ebb4346068, ; 1051: System.Net.Ping => 68
	i64 u0xdfa4850418b6c99a, ; 1052: Microsoft.AspNetCore.Hosting.Abstractions => 180
	i64 u0xe0142572c095a480, ; 1053: Xamarin.AndroidX.AppCompat.dll => 273
	i64 u0xe021eaa401792a05, ; 1054: System.Text.Encoding.dll => 134
	i64 u0xe02f89350ec78051, ; 1055: Xamarin.AndroidX.CoordinatorLayout.dll => 292
	i64 u0xe02ff568f8e5f275, ; 1056: Microsoft.AspNetCore.Http.Connections.Client.dll => 185
	i64 u0xe0496b9d65ef5474, ; 1057: Xamarin.Android.Glide.DiskLruCache.dll => 266
	i64 u0xe0a0a4c883f4beeb, ; 1058: lib_Xamarin.AndroidX.Biometric.dll.so => 277
	i64 u0xe0d33290f3eea314, ; 1059: Nethereum.Model.dll => 238
	i64 u0xe10b760bb1462e7a, ; 1060: lib_System.Security.Cryptography.Primitives.dll.so => 123
	i64 u0xe17611c582813d84, ; 1061: Bank.Application.dll => 399
	i64 u0xe192a588d4410686, ; 1062: lib_System.IO.Pipelines.dll.so => 258
	i64 u0xe1a08bd3fa539e0d, ; 1063: System.Runtime.Loader => 108
	i64 u0xe1a77eb8831f7741, ; 1064: System.Security.SecureString.dll => 128
	i64 u0xe1b52f9f816c70ef, ; 1065: System.Private.Xml.Linq.dll => 86
	i64 u0xe1e199c8ab02e356, ; 1066: System.Data.DataSetExtensions.dll => 23
	i64 u0xe1ecfdb7fff86067, ; 1067: System.Net.Security.dll => 72
	i64 u0xe2252a80fe853de4, ; 1068: lib_System.Security.Principal.dll.so => 127
	i64 u0xe22fa4c9c645db62, ; 1069: System.Diagnostics.TextWriterTraceListener.dll => 30
	i64 u0xe24095a7afddaab3, ; 1070: lib_Microsoft.Extensions.Hosting.Abstractions.dll.so => 210
	i64 u0xe2420585aeceb728, ; 1071: System.Net.Requests.dll => 71
	i64 u0xe26692647e6bcb62, ; 1072: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 315
	i64 u0xe29b73bc11392966, ; 1073: lib-id-Microsoft.Maui.Controls.resources.dll.so => 378
	i64 u0xe2ad448dee50fbdf, ; 1074: System.Xml.Serialization => 153
	i64 u0xe2d920f978f5d85c, ; 1075: System.Data.DataSetExtensions => 23
	i64 u0xe2e426c7714fa0bc, ; 1076: Microsoft.Win32.Primitives.dll => 4
	i64 u0xe332bacb3eb4a806, ; 1077: Mono.Android.Export.dll => 165
	i64 u0xe3811d68d4fe8463, ; 1078: pt-BR/Microsoft.Maui.Controls.resources.dll => 386
	i64 u0xe3a586956771a0ed, ; 1079: lib_SQLite-net.dll.so => 252
	i64 u0xe3b7cbae5ad66c75, ; 1080: lib_System.Security.Cryptography.Encoding.dll.so => 121
	i64 u0xe4292b48f3224d5b, ; 1081: lib_Xamarin.AndroidX.Core.ViewTree.dll.so => 295
	i64 u0xe494f7ced4ecd10a, ; 1082: hu/Microsoft.Maui.Controls.resources.dll => 377
	i64 u0xe4a9b1e40d1e8917, ; 1083: lib-fi-Microsoft.Maui.Controls.resources.dll.so => 372
	i64 u0xe4f74a0b5bf9703f, ; 1084: System.Runtime.Serialization.Primitives => 112
	i64 u0xe5434e8a119ceb69, ; 1085: lib_Mono.Android.dll.so => 167
	i64 u0xe55703b9ce5c038a, ; 1086: System.Diagnostics.Tools => 31
	i64 u0xe57013c8afc270b5, ; 1087: Microsoft.VisualBasic => 3
	i64 u0xe5876071b3482131, ; 1088: Polly.Extensions.Http => 249
	i64 u0xe62913cc36bc07ec, ; 1089: System.Xml.dll => 159
	i64 u0xe7bea09c4900a191, ; 1090: Xamarin.AndroidX.VectorDrawable.dll => 338
	i64 u0xe7e03cc18dcdeb49, ; 1091: lib_System.Diagnostics.StackTrace.dll.so => 29
	i64 u0xe7e147ff99a7a380, ; 1092: lib_System.Configuration.dll.so => 19
	i64 u0xe8397cf3948e7cb7, ; 1093: lib_Microsoft.Extensions.Options.ConfigurationExtensions.dll.so => 218
	i64 u0xe86b0df4ba9e5db8, ; 1094: lib_Xamarin.AndroidX.Lifecycle.Runtime.Android.dll.so => 314
	i64 u0xe896622fe0902957, ; 1095: System.Reflection.Emit.dll => 91
	i64 u0xe89a2a9ef110899b, ; 1096: System.Drawing.dll => 35
	i64 u0xe8c5f8c100b5934b, ; 1097: Microsoft.Win32.Registry => 5
	i64 u0xe957c3976986ab72, ; 1098: lib_Xamarin.AndroidX.Window.Extensions.Core.Core.dll.so => 344
	i64 u0xe98163eb702ae5c5, ; 1099: Xamarin.AndroidX.Arch.Core.Runtime => 276
	i64 u0xe994f23ba4c143e5, ; 1100: Xamarin.KotlinX.Coroutines.Android => 357
	i64 u0xe9b9c8c0458fd92a, ; 1101: System.Windows => 150
	i64 u0xe9d166d87a7f2bdb, ; 1102: lib_Xamarin.AndroidX.Startup.StartupRuntime.dll.so => 333
	i64 u0xe9f8ffcbcfeab04b, ; 1103: lib_Nethereum.Hex.dll.so => 233
	i64 u0xea5a4efc2ad81d1b, ; 1104: Xamarin.Google.ErrorProne.Annotations => 349
	i64 u0xeb2313fe9d65b785, ; 1105: Xamarin.AndroidX.ConstraintLayout.dll => 290
	i64 u0xec14d6cc88e0036b, ; 1106: Nethereum.Merkle.Patricia.dll => 237
	i64 u0xec8abb68d340aac6, ; 1107: Microsoft.AspNetCore.Authorization => 177
	i64 u0xed19c616b3fcb7eb, ; 1108: Xamarin.AndroidX.VersionedParcelable.dll => 340
	i64 u0xedc4817167106c23, ; 1109: System.Net.Sockets.dll => 74
	i64 u0xedc632067fb20ff3, ; 1110: System.Memory.dll => 61
	i64 u0xedc8e4ca71a02a8b, ; 1111: Xamarin.AndroidX.Navigation.Runtime.dll => 324
	i64 u0xee81f5b3f1c4f83b, ; 1112: System.Threading.ThreadPool => 142
	i64 u0xeeb7ebb80150501b, ; 1113: lib_Xamarin.AndroidX.Collection.Jvm.dll.so => 286
	i64 u0xeedf6bb58bca9075, ; 1114: Xamarin.AndroidX.Biometric.dll => 277
	i64 u0xeefc635595ef57f0, ; 1115: System.Security.Cryptography.Cng => 119
	i64 u0xef03b1b5a04e9709, ; 1116: System.Text.Encoding.CodePages.dll => 132
	i64 u0xef0fab0994b6b40e, ; 1117: System.Net.WebSockets.WebSocketProtocol => 260
	i64 u0xef1ae9ac8aa3c40b, ; 1118: Nethereum.HdWallet => 232
	i64 u0xef2a5020eb7f7a35, ; 1119: lib_Bank.Infrastructure.dll.so => 401
	i64 u0xef602c523fe2e87a, ; 1120: lib_Xamarin.Google.Guava.ListenableFuture.dll.so => 351
	i64 u0xef72742e1bcca27a, ; 1121: Microsoft.Maui.Essentials.dll => 223
	i64 u0xefa72f1b3fe37b3d, ; 1122: lib_Nethereum.Contracts.dll.so => 231
	i64 u0xefd1e0c4e5c9b371, ; 1123: System.Resources.ResourceManager.dll => 98
	i64 u0xefe8f8d5ed3c72ea, ; 1124: System.Formats.Tar.dll => 38
	i64 u0xefec0b7fdc57ec42, ; 1125: Xamarin.AndroidX.Activity => 268
	i64 u0xf00c29406ea45e19, ; 1126: es/Microsoft.Maui.Controls.resources.dll => 371
	i64 u0xf038bf84c0c27e83, ; 1127: lib_Microsoft.AspNetCore.SignalR.Client.dll.so => 192
	i64 u0xf09e47b6ae914f6e, ; 1128: System.Net.NameResolution => 66
	i64 u0xf0ac2b489fed2e35, ; 1129: lib_System.Diagnostics.Debug.dll.so => 26
	i64 u0xf0bb49dadd3a1fe1, ; 1130: lib_System.Net.ServicePoint.dll.so => 73
	i64 u0xf0de2537ee19c6ca, ; 1131: lib_System.Net.WebHeaderCollection.dll.so => 76
	i64 u0xf1138779fa181c68, ; 1132: lib_Xamarin.AndroidX.Lifecycle.Runtime.dll.so => 313
	i64 u0xf11b621fc87b983f, ; 1133: Microsoft.Maui.Controls.Xaml.dll => 221
	i64 u0xf161f4f3c3b7e62c, ; 1134: System.Data => 24
	i64 u0xf16eb650d5a464bc, ; 1135: System.ValueTuple => 147
	i64 u0xf1c4b4005493d871, ; 1136: System.Formats.Asn1.dll => 37
	i64 u0xf238bd79489d3a96, ; 1137: lib-nl-Microsoft.Maui.Controls.resources.dll.so => 384
	i64 u0xf2feea356ba760af, ; 1138: Xamarin.AndroidX.Arch.Core.Runtime.dll => 276
	i64 u0xf300e085f8acd238, ; 1139: lib_System.ServiceProcess.dll.so => 131
	i64 u0xf32a2fa88738a54c, ; 1140: lib_Xamarin.AndroidX.Camera.Video.dll.so => 282
	i64 u0xf34e52b26e7e059d, ; 1141: System.Runtime.CompilerServices.VisualC.dll => 101
	i64 u0xf37221fda4ef8830, ; 1142: lib_Xamarin.Google.Android.Material.dll.so => 345
	i64 u0xf3ad9b8fb3eefd12, ; 1143: lib_System.IO.UnmanagedMemoryStream.dll.so => 55
	i64 u0xf3ddfe05336abf29, ; 1144: System => 160
	i64 u0xf408654b2a135055, ; 1145: System.Reflection.Emit.ILGeneration.dll => 89
	i64 u0xf4103170a1de5bd0, ; 1146: System.Linq.Queryable.dll => 59
	i64 u0xf42ad2f4323b64d3, ; 1147: Microsoft.Net.Http.Headers.dll => 225
	i64 u0xf42d20c23173d77c, ; 1148: lib_System.ServiceModel.Web.dll.so => 130
	i64 u0xf4c1dd70a5496a17, ; 1149: System.IO.Compression => 45
	i64 u0xf4ecf4b9afc64781, ; 1150: System.ServiceProcess.dll => 131
	i64 u0xf4eeeaa566e9b970, ; 1151: lib_Xamarin.AndroidX.CustomView.PoolingContainer.dll.so => 298
	i64 u0xf518f63ead11fcd1, ; 1152: System.Threading.Tasks => 140
	i64 u0xf5fc7602fe27b333, ; 1153: System.Net.WebHeaderCollection => 76
	i64 u0xf6077741019d7428, ; 1154: Xamarin.AndroidX.CoordinatorLayout => 292
	i64 u0xf6742cbf457c450b, ; 1155: Xamarin.AndroidX.Lifecycle.Runtime.Android.dll => 314
	i64 u0xf6f893f692f8cb43, ; 1156: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 218
	i64 u0xf70c0a7bf8ccf5af, ; 1157: System.Web => 149
	i64 u0xf77b20923f07c667, ; 1158: de/Microsoft.Maui.Controls.resources.dll => 369
	i64 u0xf7e2cac4c45067b3, ; 1159: lib_System.Numerics.Vectors.dll.so => 81
	i64 u0xf7e74930e0e3d214, ; 1160: zh-HK/Microsoft.Maui.Controls.resources.dll => 396
	i64 u0xf7fa0bf77fe677cc, ; 1161: Newtonsoft.Json.dll => 246
	i64 u0xf84773b5c81e3cef, ; 1162: lib-uk-Microsoft.Maui.Controls.resources.dll.so => 394
	i64 u0xf874611ecafe39b8, ; 1163: Microsoft.Bcl.TimeProvider.dll => 200
	i64 u0xf87e0d5910d5cb96, ; 1164: lib_Microsoft.Extensions.Http.Polly.dll.so => 212
	i64 u0xf8aac5ea82de1348, ; 1165: System.Linq.Queryable => 59
	i64 u0xf8abd63acd77d37b, ; 1166: Xamarin.AndroidX.Camera.View => 283
	i64 u0xf8b77539b362d3ba, ; 1167: lib_System.Reflection.Primitives.dll.so => 94
	i64 u0xf8e045dc345b2ea3, ; 1168: lib_Xamarin.AndroidX.RecyclerView.dll.so => 327
	i64 u0xf915dc29808193a1, ; 1169: System.Web.HttpUtility.dll => 148
	i64 u0xf96c777a2a0686f4, ; 1170: hi/Microsoft.Maui.Controls.resources.dll => 375
	i64 u0xf9be54c8bcf8ff3b, ; 1171: System.Security.AccessControl.dll => 116
	i64 u0xf9eec5bb3a6aedc6, ; 1172: Microsoft.Extensions.Options => 217
	i64 u0xfa0e82300e67f913, ; 1173: lib_System.AppContext.dll.so => 6
	i64 u0xfa2fdb27e8a2c8e8, ; 1174: System.ComponentModel.EventBasedAsync => 15
	i64 u0xfa3f278f288b0e84, ; 1175: lib_System.Net.Security.dll.so => 72
	i64 u0xfa504dfa0f097d72, ; 1176: Microsoft.Extensions.FileProviders.Abstractions.dll => 209
	i64 u0xfa5ed7226d978949, ; 1177: lib-ar-Microsoft.Maui.Controls.resources.dll.so => 365
	i64 u0xfa645d91e9fc4cba, ; 1178: System.Threading.Thread => 141
	i64 u0xfab337a1ee4b5b7c, ; 1179: Xamarin.AndroidX.Concurrent.Futures.Ktx.dll => 289
	i64 u0xfad4d2c770e827f9, ; 1180: lib_System.IO.IsolatedStorage.dll.so => 51
	i64 u0xfb022853d73b7fa5, ; 1181: lib_SQLitePCLRaw.batteries_v2.dll.so => 253
	i64 u0xfb06dd2338e6f7c4, ; 1182: System.Net.Ping.dll => 68
	i64 u0xfb087abe5365e3b7, ; 1183: lib_System.Data.DataSetExtensions.dll.so => 23
	i64 u0xfb846e949baff5ea, ; 1184: System.Xml.Serialization.dll => 153
	i64 u0xfbad3e4ce4b98145, ; 1185: System.Security.Cryptography.X509Certificates => 124
	i64 u0xfbd71978549ea473, ; 1186: Microsoft.AspNetCore.Http.Features.dll => 188
	i64 u0xfbf0a31c9fc34bc4, ; 1187: lib_System.Net.Http.dll.so => 63
	i64 u0xfc6b7527cc280b3f, ; 1188: lib_System.Runtime.Serialization.Formatters.dll.so => 110
	i64 u0xfc719aec26adf9d9, ; 1189: Xamarin.AndroidX.Navigation.Fragment.dll => 323
	i64 u0xfc82690c2fe2735c, ; 1190: Xamarin.AndroidX.Lifecycle.Process.dll => 312
	i64 u0xfc93fc307d279893, ; 1191: System.IO.Pipes.AccessControl.dll => 53
	i64 u0xfcd302092ada6328, ; 1192: System.IO.MemoryMappedFiles.dll => 52
	i64 u0xfd22f00870e40ae0, ; 1193: lib_Xamarin.AndroidX.DrawerLayout.dll.so => 299
	i64 u0xfd49b3c1a76e2748, ; 1194: System.Runtime.InteropServices.RuntimeInformation => 105
	i64 u0xfd4f1cb508086944, ; 1195: Microsoft.Extensions.Http.Polly => 212
	i64 u0xfd536c702f64dc47, ; 1196: System.Text.Encoding.Extensions => 133
	i64 u0xfd583f7657b6a1cb, ; 1197: Xamarin.AndroidX.Fragment => 304
	i64 u0xfd6d7e5e921d95b5, ; 1198: Nethereum.RLP.dll => 239
	i64 u0xfd8dd91a2c26bd5d, ; 1199: Xamarin.AndroidX.Lifecycle.Runtime => 313
	i64 u0xfda36abccf05cf5c, ; 1200: System.Net.WebSockets.Client => 78
	i64 u0xfdbe4710aa9beeff, ; 1201: CommunityToolkit.Maui => 171
	i64 u0xfddbe9695626a7f5, ; 1202: Xamarin.AndroidX.Lifecycle.Common => 307
	i64 u0xfeae9952cf03b8cb, ; 1203: tr/Microsoft.Maui.Controls.resources => 393
	i64 u0xfebe1950717515f9, ; 1204: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 311
	i64 u0xff1a4e86e72b0140, ; 1205: Microsoft.AspNetCore.Authentication.Abstractions.dll => 176
	i64 u0xff270a55858bac8d, ; 1206: System.Security.Principal => 127
	i64 u0xff9b54613e0d2cc8, ; 1207: System.Net.Http.Json => 62
	i64 u0xffdb7a971be4ec73 ; 1208: System.ValueTuple.dll => 147
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [1209 x i32] [
	i32 41, i32 358, i32 334, i32 250, i32 13, i32 178, i32 194, i32 363,
	i32 324, i32 172, i32 218, i32 103, i32 166, i32 47, i32 273, i32 7,
	i32 256, i32 84, i32 260, i32 389, i32 367, i32 395, i32 300, i32 69,
	i32 231, i32 327, i32 12, i32 222, i32 100, i32 181, i32 200, i32 396,
	i32 151, i32 19, i32 305, i32 286, i32 156, i32 245, i32 302, i32 338,
	i32 162, i32 389, i32 10, i32 215, i32 339, i32 94, i32 298, i32 299,
	i32 13, i32 217, i32 10, i32 0, i32 125, i32 93, i32 401, i32 282,
	i32 263, i32 228, i32 38, i32 390, i32 361, i32 196, i32 341, i32 386,
	i32 281, i32 167, i32 267, i32 5, i32 223, i32 65, i32 241, i32 331,
	i32 128, i32 199, i32 330, i32 301, i32 66, i32 230, i32 287, i32 229,
	i32 64, i32 180, i32 55, i32 199, i32 297, i32 51, i32 42, i32 216,
	i32 123, i32 279, i32 65, i32 79, i32 277, i32 315, i32 169, i32 153,
	i32 90, i32 97, i32 327, i32 136, i32 146, i32 169, i32 278, i32 373,
	i32 157, i32 164, i32 374, i32 205, i32 79, i32 353, i32 287, i32 193,
	i32 4, i32 5, i32 50, i32 99, i32 54, i32 118, i32 96, i32 163,
	i32 116, i32 358, i32 21, i32 377, i32 261, i32 95, i32 361, i32 75,
	i32 383, i32 251, i32 333, i32 117, i32 283, i32 181, i32 8, i32 160,
	i32 392, i32 68, i32 266, i32 316, i32 328, i32 187, i32 236, i32 206,
	i32 166, i32 140, i32 39, i32 331, i32 46, i32 29, i32 325, i32 381,
	i32 139, i32 217, i32 158, i32 27, i32 82, i32 335, i32 75, i32 42,
	i32 244, i32 240, i32 28, i32 41, i32 101, i32 115, i32 271, i32 44,
	i32 89, i32 392, i32 54, i32 143, i32 141, i32 98, i32 48, i32 20,
	i32 293, i32 230, i32 112, i32 264, i32 373, i32 348, i32 253, i32 279,
	i32 234, i32 354, i32 219, i32 280, i32 243, i32 92, i32 56, i32 228,
	i32 378, i32 376, i32 79, i32 348, i32 164, i32 26, i32 69, i32 326,
	i32 250, i32 198, i32 175, i32 207, i32 303, i32 200, i32 394, i32 175,
	i32 67, i32 32, i32 372, i32 14, i32 232, i32 135, i32 37, i32 398,
	i32 288, i32 198, i32 184, i32 385, i32 132, i32 90, i32 86, i32 144,
	i32 391, i32 24, i32 262, i32 55, i32 50, i32 370, i32 208, i32 227,
	i32 28, i32 152, i32 33, i32 159, i32 211, i32 304, i32 51, i32 235,
	i32 402, i32 343, i32 88, i32 336, i32 350, i32 195, i32 235, i32 284,
	i32 34, i32 373, i32 152, i32 9, i32 371, i32 74, i32 237, i32 53,
	i32 222, i32 367, i32 220, i32 234, i32 13, i32 342, i32 201, i32 275,
	i32 107, i32 169, i32 319, i32 31, i32 102, i32 82, i32 241, i32 244,
	i32 90, i32 52, i32 94, i32 352, i32 56, i32 9, i32 100, i32 297,
	i32 66, i32 178, i32 341, i32 366, i32 248, i32 246, i32 209, i32 244,
	i32 123, i32 328, i32 114, i32 133, i32 242, i32 124, i32 104, i32 354,
	i32 129, i32 187, i32 278, i32 364, i32 351, i32 142, i32 151, i32 305,
	i32 293, i32 253, i32 300, i32 328, i32 95, i32 182, i32 24, i32 249,
	i32 332, i32 138, i32 210, i32 322, i32 3, i32 162, i32 274, i32 98,
	i32 156, i32 97, i32 295, i32 25, i32 91, i32 163, i32 167, i32 269,
	i32 3, i32 385, i32 302, i32 1, i32 112, i32 354, i32 305, i32 312,
	i32 32, i32 6, i32 389, i32 151, i32 227, i32 387, i32 52, i32 0,
	i32 196, i32 83, i32 225, i32 340, i32 325, i32 43, i32 311, i32 102,
	i32 46, i32 262, i32 62, i32 321, i32 67, i32 78, i32 57, i32 87,
	i32 149, i32 275, i32 131, i32 108, i32 379, i32 321, i32 226, i32 326,
	i32 166, i32 194, i32 132, i32 263, i32 238, i32 39, i32 366, i32 255,
	i32 203, i32 220, i32 346, i32 232, i32 58, i32 173, i32 203, i32 318,
	i32 77, i32 25, i32 35, i32 176, i32 97, i32 315, i32 69, i32 183,
	i32 22, i32 293, i32 228, i32 224, i32 390, i32 119, i32 67, i32 105,
	i32 396, i32 117, i32 115, i32 307, i32 308, i32 11, i32 2, i32 122,
	i32 191, i32 113, i32 137, i32 248, i32 40, i32 85, i32 270, i32 254,
	i32 168, i32 210, i32 257, i32 143, i32 203, i32 380, i32 204, i32 225,
	i32 349, i32 269, i32 1, i32 181, i32 271, i32 43, i32 292, i32 144,
	i32 18, i32 184, i32 186, i32 84, i32 368, i32 40, i32 311, i32 285,
	i32 316, i32 185, i32 92, i32 213, i32 27, i32 40, i32 189, i32 76,
	i32 363, i32 301, i32 288, i32 139, i32 106, i32 286, i32 11, i32 103,
	i32 261, i32 16, i32 120, i32 64, i32 152, i32 22, i32 255, i32 370,
	i32 360, i32 100, i32 216, i32 204, i32 359, i32 61, i32 56, i32 221,
	i32 369, i32 108, i32 168, i32 357, i32 9, i32 345, i32 118, i32 245,
	i32 96, i32 103, i32 259, i32 319, i32 171, i32 250, i32 220, i32 109,
	i32 272, i32 48, i32 20, i32 318, i32 296, i32 186, i32 70, i32 291,
	i32 150, i32 38, i32 368, i32 34, i32 355, i32 37, i32 374, i32 255,
	i32 344, i32 106, i32 242, i32 383, i32 21, i32 352, i32 247, i32 226,
	i32 234, i32 317, i32 224, i32 15, i32 219, i32 77, i32 77, i32 296,
	i32 219, i32 400, i32 323, i32 235, i32 330, i32 147, i32 21, i32 222,
	i32 367, i32 197, i32 49, i32 50, i32 393, i32 383, i32 92, i32 265,
	i32 207, i32 379, i32 16, i32 295, i32 194, i32 121, i32 376, i32 155,
	i32 44, i32 349, i32 174, i32 114, i32 61, i32 161, i32 206, i32 212,
	i32 201, i32 179, i32 233, i32 14, i32 329, i32 109, i32 272, i32 58,
	i32 356, i32 346, i32 259, i32 119, i32 382, i32 2, i32 392, i32 186,
	i32 304, i32 197, i32 317, i32 211, i32 355, i32 353, i32 317, i32 6,
	i32 285, i32 372, i32 300, i32 197, i32 17, i32 390, i32 369, i32 75,
	i32 290, i32 346, i32 230, i32 172, i32 129, i32 352, i32 336, i32 192,
	i32 382, i32 81, i32 215, i32 12, i32 170, i32 33, i32 117, i32 360,
	i32 312, i32 302, i32 83, i32 264, i32 18, i32 188, i32 341, i32 202,
	i32 289, i32 310, i32 178, i32 70, i32 229, i32 93, i32 256, i32 260,
	i32 160, i32 306, i32 80, i32 398, i32 216, i32 273, i32 284, i32 356,
	i32 149, i32 35, i32 146, i32 394, i32 252, i32 397, i32 283, i32 139,
	i32 208, i32 241, i32 336, i32 54, i32 111, i32 182, i32 285, i32 338,
	i32 337, i32 36, i32 398, i32 201, i32 113, i32 271, i32 14, i32 265,
	i32 141, i32 183, i32 42, i32 223, i32 269, i32 191, i32 96, i32 359,
	i32 239, i32 163, i32 16, i32 47, i32 105, i32 187, i32 188, i32 95,
	i32 321, i32 239, i32 196, i32 257, i32 126, i32 28, i32 374, i32 209,
	i32 330, i32 126, i32 43, i32 296, i32 301, i32 144, i32 8, i32 180,
	i32 246, i32 322, i32 375, i32 388, i32 254, i32 387, i32 130, i32 386,
	i32 189, i32 41, i32 360, i32 254, i32 32, i32 190, i32 402, i32 45,
	i32 138, i32 318, i32 221, i32 193, i32 309, i32 297, i32 262, i32 60,
	i32 130, i32 366, i32 47, i32 155, i32 276, i32 309, i32 265, i32 226,
	i32 307, i32 382, i32 337, i32 45, i32 159, i32 306, i32 251, i32 279,
	i32 281, i32 371, i32 303, i32 378, i32 224, i32 18, i32 8, i32 174,
	i32 294, i32 122, i32 280, i32 57, i32 136, i32 173, i32 324, i32 381,
	i32 313, i32 347, i32 343, i32 145, i32 137, i32 358, i32 355, i32 124,
	i32 357, i32 155, i32 157, i32 248, i32 298, i32 268, i32 202, i32 384,
	i32 26, i32 399, i32 322, i32 249, i32 310, i32 281, i32 80, i32 179,
	i32 343, i32 125, i32 348, i32 99, i32 143, i32 345, i32 325, i32 258,
	i32 157, i32 162, i32 400, i32 129, i32 36, i32 339, i32 381, i32 190,
	i32 206, i32 173, i32 22, i32 110, i32 88, i32 49, i32 58, i32 120,
	i32 81, i32 125, i32 158, i32 347, i32 161, i32 329, i32 331, i32 299,
	i32 264, i32 314, i32 183, i32 4, i32 308, i32 195, i32 377, i32 165,
	i32 2, i32 319, i32 114, i32 270, i32 242, i32 19, i32 172, i32 214,
	i32 87, i32 63, i32 29, i32 205, i32 370, i32 291, i32 57, i32 193,
	i32 109, i32 310, i32 31, i32 126, i32 154, i32 388, i32 288, i32 263,
	i32 384, i32 148, i32 17, i32 287, i32 267, i32 73, i32 72, i32 15,
	i32 164, i32 83, i32 252, i32 356, i32 399, i32 122, i32 243, i32 309,
	i32 320, i32 290, i32 391, i32 316, i32 33, i32 116, i32 135, i32 120,
	i32 104, i32 368, i32 339, i32 175, i32 401, i32 284, i32 375, i32 365,
	i32 258, i32 46, i32 27, i32 198, i32 140, i32 214, i32 190, i32 142,
	i32 34, i32 391, i32 229, i32 236, i32 168, i32 211, i32 344, i32 73,
	i32 156, i32 1, i32 332, i32 387, i32 380, i32 154, i32 12, i32 150,
	i32 146, i32 182, i32 74, i32 363, i32 236, i32 101, i32 110, i32 247,
	i32 256, i32 275, i32 238, i32 177, i32 63, i32 64, i32 342, i32 44,
	i32 245, i32 278, i32 107, i32 176, i32 364, i32 280, i32 7, i32 274,
	i32 53, i32 270, i32 0, i32 62, i32 365, i32 294, i32 20, i32 107,
	i32 99, i32 60, i32 137, i32 177, i32 233, i32 268, i32 170, i32 237,
	i32 7, i32 380, i32 165, i32 49, i32 342, i32 113, i32 136, i32 189,
	i32 174, i32 251, i32 184, i32 240, i32 161, i32 362, i32 78, i32 111,
	i32 320, i32 208, i32 17, i32 71, i32 323, i32 87, i32 266, i32 85,
	i32 118, i32 192, i32 335, i32 272, i32 133, i32 148, i32 104, i32 11,
	i32 282, i32 88, i32 30, i32 171, i32 393, i32 134, i32 385, i32 350,
	i32 388, i32 333, i32 267, i32 39, i32 402, i32 332, i32 199, i32 135,
	i32 359, i32 361, i32 25, i32 185, i32 397, i32 71, i32 306, i32 334,
	i32 247, i32 257, i32 65, i32 86, i32 195, i32 93, i32 111, i32 30,
	i32 102, i32 308, i32 36, i32 207, i32 70, i32 243, i32 191, i32 351,
	i32 106, i32 121, i32 274, i32 85, i32 213, i32 84, i32 379, i32 91,
	i32 205, i32 127, i32 289, i32 179, i32 320, i32 362, i32 227, i32 335,
	i32 215, i32 362, i32 329, i32 294, i32 334, i32 291, i32 350, i32 347,
	i32 202, i32 158, i32 128, i32 214, i32 340, i32 326, i32 364, i32 170,
	i32 204, i32 400, i32 10, i32 48, i32 395, i32 89, i32 395, i32 145,
	i32 60, i32 134, i32 145, i32 59, i32 213, i32 115, i32 261, i32 353,
	i32 82, i32 397, i32 154, i32 337, i32 138, i32 231, i32 376, i32 303,
	i32 240, i32 80, i32 259, i32 68, i32 180, i32 273, i32 134, i32 292,
	i32 185, i32 266, i32 277, i32 238, i32 123, i32 399, i32 258, i32 108,
	i32 128, i32 86, i32 23, i32 72, i32 127, i32 30, i32 210, i32 71,
	i32 315, i32 378, i32 153, i32 23, i32 4, i32 165, i32 386, i32 252,
	i32 121, i32 295, i32 377, i32 372, i32 112, i32 167, i32 31, i32 3,
	i32 249, i32 159, i32 338, i32 29, i32 19, i32 218, i32 314, i32 91,
	i32 35, i32 5, i32 344, i32 276, i32 357, i32 150, i32 333, i32 233,
	i32 349, i32 290, i32 237, i32 177, i32 340, i32 74, i32 61, i32 324,
	i32 142, i32 286, i32 277, i32 119, i32 132, i32 260, i32 232, i32 401,
	i32 351, i32 223, i32 231, i32 98, i32 38, i32 268, i32 371, i32 192,
	i32 66, i32 26, i32 73, i32 76, i32 313, i32 221, i32 24, i32 147,
	i32 37, i32 384, i32 276, i32 131, i32 282, i32 101, i32 345, i32 55,
	i32 160, i32 89, i32 59, i32 225, i32 130, i32 45, i32 131, i32 298,
	i32 140, i32 76, i32 292, i32 314, i32 218, i32 149, i32 369, i32 81,
	i32 396, i32 246, i32 394, i32 200, i32 212, i32 59, i32 283, i32 94,
	i32 327, i32 148, i32 375, i32 116, i32 217, i32 6, i32 15, i32 72,
	i32 209, i32 365, i32 141, i32 289, i32 51, i32 253, i32 68, i32 23,
	i32 153, i32 124, i32 188, i32 63, i32 110, i32 323, i32 312, i32 53,
	i32 52, i32 299, i32 105, i32 212, i32 133, i32 304, i32 239, i32 313,
	i32 78, i32 171, i32 307, i32 393, i32 311, i32 176, i32 127, i32 62,
	i32 147
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 u0x0000000000000000, ; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

; Functions

; Function attributes: memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { memory(write, argmem: none, inaccessiblemem: none) "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!".NET for Android remotes/origin/release/9.0.1xx @ 1dcfb6f8779c33b6f768c996495cb90ecd729329"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
