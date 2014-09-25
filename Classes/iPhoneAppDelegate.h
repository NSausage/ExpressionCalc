//
//  MailComposerAppDelegate.h

#import <UIKit/UIKit.h>

//@class rectShapeViewController;

@interface iPhoneAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

