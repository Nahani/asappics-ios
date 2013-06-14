//
//  SDWebImageDataSource.m
//  Sample
//
//  Created by Kirby Turner on 3/18/10.
//  Copyright 2010 White Peak Software Inc. All rights reserved.
//

#import "SDWebImageDataSource.h"
#import "KTPhotoView+SDWebImage.h"
#import "KTThumbView+SDWebImage.h"
#import "WebServiceManager.h"
#import "Image.h"
#import "Utils.h"

#define FULL_SIZE_INDEX 0
#define THUMBNAIL_INDEX 1

@implementation SDWebImageDataSource
NSString *URL_THUMB = @"http://asap-pics.com/REST/ImageService.svc/get_thumb";
NSString *URL_IMAGE = @"http://asap-pics.com/REST/ImageService.svc/get";

- (void)dealloc {
   [images release], images = nil;
   [super dealloc];
}

- (id)init : (long) album {
   self = [super init];
    if (self) {
        idAlbum = album;
      // Create a 2-dimensional array. First element of
      // the sub-array is the full size image URL and 
      // the second element is the thumbnail URL.
        images = [WebServiceManager get_Images_from_album:idAlbum];
    }
   return self;
}


#pragma mark -
#pragma mark KTPhotoBrowserDataSource

- (NSInteger)numberOfPhotos {
   NSInteger count = [images count];
   return count;
}

- (void)imageAtIndex:(NSInteger)index photoView:(KTPhotoView *)photoView {
    Image *image = [images objectAtIndex:index];
    NSString *url = [Utils construct_URL:URL_IMAGE,[[NSNumber numberWithInt:[image getIdImage]] stringValue],[[NSNumber numberWithInt:[image getIdAlbum]] stringValue], nil];
    NSLog(@"url thumb album: %@", url);
    [photoView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];
}

- (void)thumbImageAtIndex:(NSInteger)index thumbView:(KTThumbView *)thumbView {
    Image *image = [images objectAtIndex:index];
    NSString *url = [Utils construct_URL:URL_THUMB,[[NSNumber numberWithInt:[image getIdImage]] stringValue],[[NSNumber numberWithInt:[image getIdAlbum]] stringValue], nil];
    NSLog(@"url thumb album: %@", url);
    [thumbView setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"photoDefault.png"]];

}

- (void)deleteImageAtIndex:(NSInteger)index {
    [WebServiceManager delete_image:[(Image *)[images objectAtIndex:index] getIdImage] withAlbum:[(Image *)[images objectAtIndex:index] getIdAlbum]];
    
}


@end
