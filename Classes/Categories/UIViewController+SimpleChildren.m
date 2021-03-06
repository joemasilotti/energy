#import "UIViewController+SimpleChildren.h"


@implementation UIViewController (SimpleChildren)

- (void)ar_addChildViewController:(UIViewController *)controller atFrame:(CGRect)frame
{
    [self ar_addChildViewController:controller inView:self.view atFrame:frame];
}

- (void)ar_addChildViewController:(UIViewController *)controller inView:(UIView *)view atFrame:(CGRect)frame
{
    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];

    controller.view.frame = frame;
    [view addSubview:controller.view];

    [controller didMoveToParentViewController:self];
}

- (void)ar_addModernChildViewController:(UIViewController *)controller
{
    [self ar_addModernChildViewController:controller intoView:self.view];
}

- (void)ar_addModernChildViewController:(UIViewController *)controller intoView:(UIView *)view
{
    [controller willMoveToParentViewController:self];
    [self addChildViewController:controller];
    [view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
}

- (void)ar_removeChildViewController:(UIViewController *)controller
{
    [controller willMoveToParentViewController:nil];
    [controller removeFromParentViewController];
    [controller.view removeFromSuperview];
}

@end
