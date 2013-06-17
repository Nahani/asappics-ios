//
//  ImageView.h
//  AsapPics
//
//  Created by polytech polytech on 10/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDWebImageRootViewController;

@interface PhotoChooser : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	UIImageView * imageView;
	UIButton * choosePhotoBtn;
	UIButton * takePhotoBtn;
    long idAlbum;
    UIActivityIndicatorView *activityIndicatorView_;
}

@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (nonatomic, retain) IBOutlet UIButton * choosePhotoBtn;
@property (nonatomic, retain) IBOutlet UIButton * uploadPhotoBtn;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UILabel *imageName;
@property (retain, nonatomic) IBOutlet UIButton *editBtn;

-(IBAction) getPhoto:(id) sender;
- (IBAction)uploadPhoto:(id)sender;
- (IBAction)editName:(id)sender;
-(void) setIdAlbum:(long) album;
-(void) uploadPhotoDidFinished:(BOOL) result;

@end
