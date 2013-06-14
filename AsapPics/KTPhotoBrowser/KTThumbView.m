//
//  KTThumbView.m
//  KTPhotoBrowser
//
//  Created by Kirby Turner on 2/3/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "KTThumbView.h"
#import "KTThumbsViewController.h"
#import <QuartzCore/QuartzCore.h>


@implementation KTThumbView

@synthesize controller = controller_;
static int nbLongTouch = 0;
- (void)dealloc 
{
   [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
   if (self = [super initWithFrame:frame]) {

       UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] 
                                             initWithTarget:self action:@selector(handleLongPress:)];
       lpgr.minimumPressDuration = 2.0; //seconds
       lpgr.delegate = self;

      [self addTarget:self
               action:@selector(didTouch:)
     forControlEvents:UIControlEventTouchUpInside];
       [self addGestureRecognizer:lpgr];
       [lpgr release];
      
      [self setClipsToBounds:YES];

      // If the thumbnail needs to be scaled, it should mantain its aspect
      // ratio.
      [[self imageView] setContentMode:UIViewContentModeScaleAspectFill];
   }
   return self;
}

- (void)didTouch:(id)sender 
{
    //#####################
    //@@@@@@@@@@@@@@@@
    //Ici pareil différencier le touch sur un album et le touch sur une image
    //If dans un album
      [controller_ didSelectThumbAtIndex:[self tag]];
    
//If dans galerie d'album : Passer à la vue des images
    
}

- (void)didTouchRepeat:(id)sender 
{
    //Supprimer la photo ou l'album
    // Soit ajouter un attribut dans le KTThumbsViewController pour savoir si on est dans le cas d'un album ou d'une image
    //Soit faire un instance of
    /*if (controller_) {
        [controller_ didSelectThumbAtIndex:[self tag]];
    }*/
    
    NSLog(@"Delete with Touch Repeat");
}

-(void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer
{ 
    if(nbLongTouch == 0){
        nbLongTouch++;
        [controller_ deleteAtIndex:self.tag];
    }
    else if (nbLongTouch == 1){
        nbLongTouch = 0;
    }
    else {
        nbLongTouch++;
    }
}

- (void)setThumbImage:(UIImage *)newImage 
{
  [self setImage:newImage forState:UIControlStateNormal];
}

- (void)setHasBorder:(BOOL)hasBorder
{
   if (hasBorder) {
      self.layer.borderColor = [UIColor colorWithWhite:0.85 alpha:1.0].CGColor;
      self.layer.borderWidth = 1;
   } else {
      self.layer.borderColor = nil;
   }
}


@end
