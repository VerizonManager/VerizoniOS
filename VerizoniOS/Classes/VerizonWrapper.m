//
//  VerizonWrapper.m
//  VerizonFramework
//
//  Created by Beacon-QA on 25/02/20.
//  Copyright © 2020 Infy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VerizonWrapper.h"

@implementation VerizonWrapper

- (void) initilizeVerizonBridgeParameters {
    
}

- (void)joinVerizonChatRoom:(UIView *)parentView {
    jitsiView = [[JitsiMeetView alloc] initWithFrame:parentView.frame];
    jitsiView.delegate = self;
    [parentView addSubview:jitsiView];
    // Join the room.
    JitsiMeetConferenceOptions *options
            = [JitsiMeetConferenceOptions fromBuilder:^(JitsiMeetConferenceOptionsBuilder *builder)
               {
                 builder.serverURL = [NSURL URLWithString:self.serverURL];
                 builder.room = self.room;
                 if ([self.subject length] != 0)
                 {
                  builder.subject = self.subject;
                 }
                 builder.audioOnly = self.audioOnly;
                 builder.audioMuted = self.audioMuted;
                 builder.videoMuted = self.videoMuted;
                 builder.welcomePageEnabled = self.welcomePageEnabled;
                 if ([self.userInfo.displayName length] != 0)
                 {
                  builder.userInfo.displayName = self.userInfo.displayName;
                 }
                 if ([self.userInfo.email length] != 0)
                 {
                  builder.userInfo.email = self.userInfo.email;
                 }
               }
             ];
    [jitsiView join:options];
}

- (void)leaveerizonChatRoom {
    [jitsiView leave];
}

- (void)conferenceWillJoin:(NSDictionary *)data {
    NSLog(@"About to join conference ");
    if (self.delegate && [self.delegate respondsToSelector:@selector(verizonConferenceWillJoin:)]) {
        [self.delegate verizonConferenceWillJoin:data];
    }
}

- (void)conferenceJoined:(NSDictionary *)data {
    NSLog(@"Conference  joined");
    if (self.delegate && [self.delegate respondsToSelector:@selector(verizonConferenceJoined:)]) {
        [self.delegate verizonConferenceJoined:data];
    }
}

- (void)conferenceTerminated:(NSDictionary *)data {
    NSLog(@"Conference  terminated");
    [jitsiView removeFromSuperview];
    if (self.delegate && [self.delegate respondsToSelector:@selector(verizonConferenceTerminated:)]) {
        [self.delegate verizonConferenceTerminated:data];
    }
}

- (void)enterPictureInPicture:(NSDictionary *)data {
    if (self.delegate && [self.delegate respondsToSelector:@selector(verizonEnterPictureInPicture:)]) {
        [self.delegate verizonEnterPictureInPicture:data];
    }
}

@end
