#import "FlutterCardScanPlugin.h"
#if __has_include(<flutter_card_scan/flutter_card_scan-Swift.h>)
#import <flutter_card_scan/flutter_card_scan-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_card_scan-Swift.h"
#endif

@implementation FlutterCardScanPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCardScanPlugin registerWithRegistrar:registrar];
}
@end
