//
//  Image.m
//  AsapPics
//
//  Created by polytech polytech on 13/06/13.
//  Copyright (c) 2013 polytech. All rights reserved.
//

#import "Image.h"

@implementation Image

- (id)init: (long) image : (long) album : (NSString *) ImageName {
        self = [super init];
        if (self) {
            idImage = image;
            idAlbum = album;
            name = ImageName;
        }
        
        return self;
}

- (long) getIdImage {
    return idImage;
}

- (long) getIdAlbum{
    return idAlbum;
}

- (NSString*) getName {
    return name;
}


@end
