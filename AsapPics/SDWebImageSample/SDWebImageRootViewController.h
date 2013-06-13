//
//  SDWebImageRootViewController.h
//  Sample
//
//  Created by Kirby Turner on 3/18/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTThumbsViewController.h"
#import "PhotoChooser.h"
#import "Welcome.h"


@class SDWebImageDataSource;

@interface SDWebImageRootViewController : KTThumbsViewController 
{
@private
   SDWebImageDataSource *images_;
   UIActivityIndicatorView *activityIndicatorView_;
   UIWindow *window_;
    UINavigationController *navController;
    Welcome *welcomeView;
}

- (id)init: (Welcome *) welcome;

@end