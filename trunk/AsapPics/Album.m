//
//  Album.m
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "Album.h"

@implementation Album

-(id) init : (long) album : (long) image {
    self = [super init];
    if (self) {
        idAlbum = album;
        idImageRandom = image;
    }
    
    return self;
}

-(long) getIdAlbum {
    return idAlbum;
}

-(long) getImageRandom {
    return idImageRandom;
}

@end
