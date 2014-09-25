//
//  aboutScreenController.h

#import <UIKit/UIKit.h>
#import "RootViewControlleriPad.h"

@interface aboutScreenController : UIViewController <SubstitutableDetailViewController>  
{

	UINavigationBar *navigationBar;

}
@property (nonatomic, retain) IBOutlet UINavigationBar *navigationBar;

@end
