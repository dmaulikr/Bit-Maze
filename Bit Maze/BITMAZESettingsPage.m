//
//  BITMAZESettingsPage.m
//  Bit Maze
//
//  Created by Jack on 3/28/14.
//  Copyright (c) 2014 Montablo. All rights reserved.
//

#import "BITMAZESettingsPage.h"
#import "BITMAZEHomePage.h"

@implementation BITMAZESettingsPage


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //self.backgroundColor = [SKColor colorWithRed:0.1 green:0.7 blue:0.4 alpha:1.0];
        SKSpriteNode *backgroundImage = [SKSpriteNode spriteNodeWithImageNamed:@"HomePageBackground"];
        backgroundImage.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        backgroundImage.zPosition = -1;
        backgroundImage.alpha = 0.7;
        
        SKLabelNode *homeLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        homeLabel.text = @"Home";
        homeLabel.name = @"homeButton";
        homeLabel.fontSize = 20;
        homeLabel.position = CGPointMake(CGRectGetMidX(self.frame), 2*(CGRectGetHeight(self.frame)/3));
        
        SKSpriteNode *homeButton = [SKSpriteNode spriteNodeWithColor: [SKColor colorWithRed:.8 green:.3 blue:.3 alpha:1.0] size:CGSizeMake(50, 50)];
        homeButton.name = @"homeButton";
        homeButton.position = CGPointMake(CGRectGetMidX(self.frame), 2*(CGRectGetHeight(self.frame)/3));
        
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Helvetica Neue UltraLight"];
        titleLabel.text = @"Bit Maze";
        titleLabel.fontSize = 30;
        float titleY = 2*(CGRectGetHeight(self.frame))/3 + 50;
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame), titleY);
        
        [self addChild:titleLabel];
        [self addChild:backgroundImage];
        [self addChild:homeButton];
        [self addChild:homeLabel];
        
    }
    
    return self;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    SKNode *node = [self nodeAtPoint:location];
    //NSLog(@"Node name where touch began: %@", node.name);
    
    if ([node.name isEqualToString:@"homeButton"]) {
        //Play button is touched
        [self launchHome];
    }
}

-(void) launchHome {
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [BITMAZEHomePage sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}



@end