//
//  AlbumsViewController.h
//  AsapPics
//
//  Created by polytech polytech on 12/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTThumbsViewController.h"
#import "PhotoChooser.h"
#import "Welcome.h"


@class AlbumsDataSource;

@interface AlbumsViewController : KTThumbsViewController <UITextFieldDelegate>
{
@private
    AlbumsDataSource *albums;
    UIActivityIndicatorView *activityIndicatorView_;
    UIAlertView * alertAdd; 
    NSInteger indexAlbum;
}

- (id)init: (Welcome *) welcome;

@end

