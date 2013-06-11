//
//  ImageView.h
//  AsapPics
//
//  Created by polytech polytech on 10/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoChooser : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate> {
	UIImageView * imageView;
	UIButton * choosePhotoBtn;
	UIButton * takePhotoBtn;
}

@property (nonatomic, retain) IBOutlet UIImageView * imageView;
@property (nonatomic, retain) IBOutlet UIButton * choosePhotoBtn;
@property (nonatomic, retain) IBOutlet UIButton * takePhotoBtn;

-(IBAction) getPhoto:(id) sender;
- (IBAction)cancelUpload:(id)sender;

@end
