//
//  CD2ITerm.m
//  iterm
//
//  Created by James Tuley on 2/18/07.
//  Copyright 2007 __MyCompanyName__. All rights reserved.
//

#import "CD2ITerm.h"

@implementation CD2ITerm
-(BOOL)openTermWindowForPath:(NSString*)aPath{
	@try{

        NSString* command = [NSString stringWithFormat:
            @"osascript "
            @"-e 'tell application \"iTerm\"' "
            @"-e 'activate' "
            @"-e 'set myTerm to (create window with default profile)' "
            @"-e 'tell current session of myTerm' "
            @"-e 'write text \"cd '\"'%@'\"'; clear\"' "
            @"-e 'end tell' -e 'end tell'", aPath];

#if 0
        NSAlert *alert = [NSAlert alertWithMessageText:@"CD TO"
                                         defaultButton:@"OK" alternateButton:@"Cancel"
                                           otherButton:nil informativeTextWithFormat:
                          command];

        [alert runModal];
#endif
        
        system([command UTF8String]);

	}@catch(id test){
		return NO;
	}
	return YES;
}

@end
